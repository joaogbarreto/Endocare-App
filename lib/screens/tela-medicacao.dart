import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:primeiroprojeto/data/cadastro_medicacao_inherited.dart';
import 'package:primeiroprojeto/objects/medicacao.dart';
import 'package:primeiroprojeto/styles/button.dart';
import 'package:primeiroprojeto/styles/color.dart';
import 'package:primeiroprojeto/widgets/card-medicacao.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:uuid/uuid.dart';

import '../authentication/components/show_snackbar.dart';

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
  final _formKey = GlobalKey<FormState>();
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
          backgroundColor: white,
          appBar: AppBar(
            title: Text(
              "Medicações",
              style: TextStyle(
                color: principalColor,
                fontFamily: "Poppins",
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: BackButton(
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            foregroundColor: principalColor,
            backgroundColor: white,
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
                            hora: listMedicacao[index].hora,
                            nome: listMedicacao[index].nome,
                            observacoes: listMedicacao[index].notas,
                          ),
                        ),
                      );
                    }, childCount: listMedicacao.length))
                  ]),
                ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: white,
            fixedColor: secondaryColorblue,
            showSelectedLabels: null,
            showUnselectedLabels: null,
            iconSize: 40,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.bar_chart_sharp,
                  color: secondaryColorblue,
                ),
                label: 'Análise',
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: secondaryColorblue,
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.notifications,
                    color: secondaryColorblue,
                  ),
                  label: 'Emergência'),
            ],
            currentIndex: _currentPage,
            onTap: (pagina) {
              pc.animateToPage(pagina,
                  duration: Duration(milliseconds: 400), curve: Curves.ease);
            },
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: principalColor,
            shape: const CircleBorder(),
            child: Icon(
              Icons.add,
              color: white,
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
        return Form(
          key: _formKey,
          child: Container(
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
                  decoration: const InputDecoration(label: Text("Observações")),
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

                ElevatedButton(

                  style: buttonFilledPrimary,

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
                    showSnackBar(context: context, mensagem: "Medicação registrado com sucesso!");
                    // Salvar no Firestore
                    firestore
                        .collection("medicacao")
                        .doc(medicacao.id)
                        .set(medicacao.toMap());

                    // Atualizar a lista
                    refresh();

                    // Fechar o Modal
                    Navigator.pop(context);
                    showSnackBar(context: context, mensagem: "Medicação registrado com sucesso!");
                  },
                  child: Text(labelConfirmationButton, style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5),),
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(

                  style: buttonFilledPrimary,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(labelSkipButton, style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5),),
                ),
              ],
            ),
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
            height: MediaQuery.of(context).size.height*0.4,
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
                        style: buttonFilledPrimary,
                        onPressed: () {
                          remove(listMedicacao[index]);

                          Navigator.pop(context);
                          showSnackBar(context: context, mensagem: "Registro Excluído com sucesso");
                        },
                        child: Text("Sim", style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5),)),
                    const SizedBox(
                      height: 16,
                    ),
                    ElevatedButton(
                      style: buttonFilledPrimary,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Não", style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5),),
                    )
                  ],
                )
              ],
            ),
          );
        });
  }
}
