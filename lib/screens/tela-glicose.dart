import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:primeiroprojeto/data/cadastro_glicose_inherited.dart';
import 'package:primeiroprojeto/objects/glicose.dart';
import 'package:primeiroprojeto/styles/color.dart';
import 'package:primeiroprojeto/styles/text-styles.dart';
import 'package:primeiroprojeto/widgets/cardglicose.dart';
import 'package:primeiroprojeto/widgets/line-chart.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:uuid/uuid.dart';

import '../objects/glicose.dart';

class TelaGlicose extends StatefulWidget {
  const TelaGlicose({Key? key}) : super(key: key);

  @override
  State<TelaGlicose> createState() => _TelaGlicoseState();
}

class _TelaGlicoseState extends State<TelaGlicose> {
  late final TabController _tabController;
  final _formKey = GlobalKey<FormState>();
  int _currentPage = 1;
  late PageController pc;
  final key = const Key('123');
  String nome = 'João';
  var obscureText = true;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  List<Glicose> listGlicose = [];

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
  Widget build(BuildContext context) => CadastroGlicoseInherited(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Registrar Glicose",
            ),
            leading: BackButton(
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            foregroundColor: black2,
            backgroundColor: white,
          ),
          body: (listGlicose.isEmpty)
              ? const Center(
                  child: Text(
                    "Nenhum cadastro de glicose feito ainda.\nVamos realizar o primeiro?",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18),
                  ),
                )
              : RefreshIndicator(
                  onRefresh: () {
                    return refresh();
                  },
                  child: CustomScrollView(slivers: <Widget>[
                    SliverToBoxAdapter(
                      child: Container(
                        margin: EdgeInsets.only(top: 20),
                        child: LineChartWidget(bloodGlicose),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 12),
                        child: Container(
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 5),
                                height: 10,
                                width: 10,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(50)),
                              ),
                              Text('Açucar no Sangue'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: InkWell(
                          onDoubleTap: () =>
                              showFormModal(model: listGlicose[index]),
                          onLongPress: () => showFormModalDelete(index),
                          child: CardGlicose(
                            key: key,
                            hora: listGlicose[index].hora,
                            concentracaoSugarSangue: listGlicose[index]
                                .sugarConcentration
                                .toString(),
                          ),
                        ),
                      );
                    }, childCount: listGlicose.length))
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
            shape: CircleBorder(),
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              showFormModal();
            },
          ),
        ),
      );

  showFormModal({Glicose? model}) {
    // Labels à serem mostradas no Modal
    String labelTitle = "Adicionar Glicose";
    String labelConfirmationButton = "Salvar";
    String labelSkipButton = "Cancelar";
    late var hora;
    // Controlador do campo que receberá o nome do Objeto
    TextEditingController nameController = TextEditingController();
    TextEditingController sugarConcentrationController =
        TextEditingController();
    TextEditingController glicoseController = TextEditingController();
    // Caso esteja editando
    if (model != null) {
      labelTitle = "Editando Glicose";
      glicoseController.text = model.sugarConcentration.toString();
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
                keyboardType: TextInputType.number,
                controller: glicoseController,
                decoration: const InputDecoration(
                    label: Text("Quantidade de Glicose Medida")),
              ),
              const SizedBox(
                height: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        // Criar um objeto Glicose com as infos

                        Glicose glicose = Glicose(
                            id: const Uuid().v1(),
                            sugarConcentration:
                                double.parse(glicoseController.text),
                            day: DateTime.now().day.toDouble(),
                            hora: hora =
                                DateFormat('KK:mm').format(DateTime.now()));

                        // Usar id do model
                        if (model != null) {
                          glicose.id = model.id;
                        }

                        // Salvar no Firestore
                        firestore
                            .collection("glicose")
                            .doc(glicose.id)
                            .set(glicose.toMap());
                        // Atualizar a lista
                        refresh();
                        if (model != null) {
                          CadastroGlicoseInherited.of(context)
                              .newCadastroGlicose(hora, glicoseController.text);
                        } else {
                          CadastroGlicoseInherited.of(context)
                              .newCadastroGlicose(
                                  glicose.hora, glicoseController.text);
                        }
                        // Fechar o Modal
                        Navigator.pop(context);
                      },
                      child: Text(labelConfirmationButton)),
                  const SizedBox(
                    height: 16,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(labelSkipButton),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }

  refresh() async {
    List<Glicose> temp = [];

    QuerySnapshot<Map<String, dynamic>> snapshot =
        await firestore.collection("glicose").get();

    for (var doc in snapshot.docs) {
      temp.add(Glicose.fromMap(doc.data()));
    }

    setState(() {
      listGlicose = temp;
    });
  }

  void remove(Glicose model) {
    firestore.collection('glicose').doc(model.id).delete();
    refresh();
  }

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
                          remove(listGlicose[index]);

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
