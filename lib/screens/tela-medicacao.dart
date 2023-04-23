import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:primeiroprojeto/data/cadastro_medicacao_inherited.dart';
import 'package:primeiroprojeto/objects/medicacao.dart';
import 'package:primeiroprojeto/styles/color.dart';
import 'package:primeiroprojeto/widgets/card-medicacao.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:uuid/uuid.dart';

class TelaMedicacao extends StatefulWidget {
  const TelaMedicacao({Key? key}) : super(key: key);

  @override
  State<TelaMedicacao> createState() => _TelaMedicacaoState();
}

class _TelaMedicacaoState extends State<TelaMedicacao> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var obscureText = true;

  // final _formKey = GlobalKey<FormState>();
  int _currentPage = 1;
  late PageController pc;
  final key = const Key('123');
  String nome = 'João';
  DateTime today = DateTime.now();

  DateTime dateTime = DateTime(DateTime.now().year, DateTime.now().month,
      DateTime.now().day, DateTime.now().hour, DateTime.now().minute);

  var maskFormatter =
      MaskTextInputFormatter(mask: '##:##', filter: {"#": RegExp(r'[0-9]')});

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  List<Medicacao> listMedicacao = [];

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  void initState() {
    refresh();
    super.initState();
    pc = PageController(initialPage: _currentPage);
  }

  setPaginaAtual(pagina) {
    setState(() {
      _currentPage = pagina;
    });
  }

  get screenWidth => MediaQuery.of(context).size.width;

  get screenHeight => MediaQuery.of(context).size.height;

  late String valueChoose;

  @override
  Widget build(BuildContext context) => CadastroMedicacaoInherited(
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Medicação",
            ),
            leading: BackButton(
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            foregroundColor: black2,
            backgroundColor: Colors.white,
          ),
          body: (listMedicacao.isEmpty)
              ? const Center(
                  child: Text(
                    "Nenhum cadastro de Medicação feito ainda.\nVamos realizar o primeiro?",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18),
                  ),
                )
              : RefreshIndicator(
                  onRefresh: () => refresh(),
                  child: CustomScrollView(slivers: <Widget>[
                    SliverToBoxAdapter(
                      child: Container(
                        height: 350,
                        child: TableCalendar(
                          locale: "en_US",
                          headerStyle: const HeaderStyle(
                              formatButtonVisible: false, titleCentered: true),
                          availableGestures: AvailableGestures.all,
                          rowHeight: 43,
                          focusedDay: today,
                          firstDay: DateTime.utc(2010, 10, 16),
                          lastDay: DateTime.utc(2030, 3, 14),
                          onDaySelected: _onDaySelected,
                          selectedDayPredicate: (day) => isSameDay(day, today),
                        ),
                      ),
                    ),
                    SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: InkWell(
                          onDoubleTap: () =>
                              showFormModal(model: listMedicacao[index]),
                          onLongPress: () => showFormModalDelete(index),
                          child: CardMedicacao(
                            key: key,
                            hora: listMedicacao[index].hora,
                            nome: listMedicacao[index].nome,
                            notas: listMedicacao[index].notas,
                          ),
                        ),
                      );
                    }, childCount: listMedicacao.length))
                  ]),
                ),
          bottomNavigationBar: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.bar_chart_sharp,
                  color: black2,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: black2,
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.notifications,
                    color: black2,
                  ),
                  label: ''),
            ],
            unselectedItemColor: Colors.transparent,
            selectedItemColor: Colors.transparent,
            currentIndex: _currentPage,
            onTap: (pagina) {
              Navigator.pop(context);
            },
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: principalColor,
            shape: const CircleBorder(),
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              showFormModal();
            },
          ),
        ),
      );

  showFormModal({Medicacao? model}) {
    // Labels à serem mostradas no Modal
    String labelTitle = "Adicionar Medicação";
    String labelConfirmationButton = "Salvar";
    String labelSkipButton = "Cancelar";

    // Controlador do campo que receberá o nome do Objeto
    TextEditingController nameController = TextEditingController();
    TextEditingController notasController = TextEditingController();
    TextEditingController horarioController = TextEditingController();
    // Caso esteja editando
    if (model != null) {
      // labelTitle = "Editando ${model.name}";
      // nameController.text = model.name;
    }
    // Função do Flutter que mostra o modal na tela
    showModalBottomSheet(
      context: context,

      // Define que as bordas verticais serão arredondadas
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
      builder: (context) {
        final hours = dateTime.hour.toString().padLeft(2, '0');
        final minutes = dateTime.minute.toString().padLeft(2, '0');
        var hora = "$hours:$minutes";
        return Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(32.0),

          // Formulário com Título, Campo e Botões
          child: ListView(
            children: [
              Text(labelTitle,
                  style: Theme.of(context).textTheme.headlineSmall),
              TextFormField(
                controller: nameController,
                decoration:
                    const InputDecoration(label: Text("Nome da Medicação")),
              ),
              TextFormField(
                controller: notasController,
                decoration: const InputDecoration(label: Text("Notas")),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () async {
                    final time = await pickTime();
                    if (time == null) return;
                    final newDateTime = DateTime(dateTime.year, dateTime.month,
                        dateTime.day, time.hour, time.minute);
                    setState(() => dateTime = newDateTime);
                    hora = "$hours:$minutes";
                  },
                  child: Text('Horário: $hours:$minutes'),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(labelSkipButton),
                ),
                const SizedBox(
                  width: 16,
                ),
                ElevatedButton(
                  onPressed: () {
                    // Criar um objeto Listin com as infos
                    Medicacao medicacao = Medicacao(
                        id: const Uuid().v1(),
                        nome: nameController.text,
                        day: DateTime.now().day.toDouble(),
                        hora: DateFormat('KK:mm').format(dateTime),
                        notas: notasController.text);

                    // Usar id do model
                    if (model != null) {
                      medicacao.id = model.id;
                    }

                    // Salvar no Firestore
                    firestore
                        .collection("medicacao")
                        .doc(medicacao.id)
                        .set(medicacao.toMap());

                    // Atualizar a lista
                    refresh();

                    // Fechar o Modal
                    Navigator.pop(context);
                  },
                  child: Text(labelConfirmationButton),
                ),
              ])
            ],
          ),
        );
      },
    );
  }

  refresh() async {
    List<Medicacao> temp = [];

    QuerySnapshot<Map<String, dynamic>> snapshot =
        await firestore.collection("medicacao").get();

    for (var doc in snapshot.docs) {
      temp.add(Medicacao.fromMap(doc.data()));
    }

    setState(() {
      listMedicacao = temp;
    });
  }

  void remove(Medicacao model) {
    firestore.collection('medicacao').doc(model.id).delete();
    refresh();
  }

  Future<TimeOfDay?> pickTime() => showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute));

  showFormModalDelete(int index) {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(24),
          ),
        ),
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.all(32.0),
            child: ListView(
              children: [
                Text("Deseja Excluir?",
                    style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(
                  height: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          remove(listMedicacao[index]);

                          Navigator.pop(context);
                        },
                        child: Text("Sim")),
                    const SizedBox(
                      height: 16,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Não"),
                    )
                  ],
                )
              ],
            ),
          );
        });
  }
}
