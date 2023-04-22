import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:primeiroprojeto/objects/medicacao.dart';
import 'package:primeiroprojeto/styles/color.dart';
import 'package:primeiroprojeto/styles/text-styles.dart';
import 'package:primeiroprojeto/widgets/card-insulina.dart';
import 'package:primeiroprojeto/widgets/card-medicacao.dart';
import 'package:primeiroprojeto/widgets/line-chart.dart';
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
  final _formKey = GlobalKey<FormState>();
  late final TabController _tabController;
  int _currentPage = 1;
  late PageController pc;
  final key = const Key('123');
  String nome = 'João';
  DateTime today = DateTime.now();

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  List<Medicacao> listMedicacao = [];

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  void initState() {
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
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
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
        body: CustomScrollView(slivers: <Widget>[
          SliverToBoxAdapter(
            child: Container(
              height: 350,
              child: TableCalendar(
                locale: "en_US",
                headerStyle: HeaderStyle(
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
              child: CardMedicacao(
                key: key,
                hora: listMedicacao[index].hora,
                nome: listMedicacao[index].nome,
                notas: listMedicacao[index].notas,
              ),
            );
          }, childCount: listMedicacao.length))
        ]),
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
          shape: CircleBorder(),
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            showFormModal();
          },
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
        return Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(32.0),

          // Formulário com Título, Campo e Botões
          child: ListView(
            children: [
              Text(labelTitle, style: Theme.of(context).textTheme.headline5),
              TextFormField(
                controller: nameController,
                decoration:
                    const InputDecoration(label: Text("Nome da Medicação")),
              ),
              TextFormField(
                controller: horarioController,
                keyboardType: TextInputType.datetime,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  LengthLimitingTextInputFormatter(4)
                ],
                decoration: const InputDecoration(label: Text("Horário")),
              ),
              TextFormField(
                controller: notasController,
                decoration: const InputDecoration(label: Text("Notas")),
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
                        hora: horarioController.text,
                        notas: notasController.text);

                    // Usar id do model
                    // if (model != null) {
                    //   listin.id = model.id;
                    // }

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
    await firestore.collection("glicose").get();

    for (var doc in snapshot.docs) {
      temp.add(Medicacao.fromMap(doc.data()));
    }

    setState(() {
      listMedicacao = temp;
    });
  }

  void remove(Medicacao model) {
    firestore.collection('glicose').doc(model.id).delete();
    refresh();
  }
}
