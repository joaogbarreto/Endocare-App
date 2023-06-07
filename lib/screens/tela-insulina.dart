import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:primeiroprojeto/authentication/components/show_snackbar.dart';
import 'package:primeiroprojeto/data/cadastro_glicose_inherited.dart';
import 'package:primeiroprojeto/firestore/firestore_glicose/models/glicose.dart';
import 'package:primeiroprojeto/firestore/firestore_insulina/models/insulina.dart';
import 'package:primeiroprojeto/styles/button.dart';
import 'package:primeiroprojeto/styles/color.dart';
import 'package:primeiroprojeto/styles/text-styles.dart';
import 'package:primeiroprojeto/widgets/card-glicose.dart';
import 'package:primeiroprojeto/widgets/card-insulina.dart';
import 'package:primeiroprojeto/widgets/line-chart.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:uuid/uuid.dart';

import '../firestore/firestore_glicose/models/glicose.dart';

class TelaInsulina extends StatefulWidget {
  const TelaInsulina({Key? key}) : super(key: key);

  @override
  State<TelaInsulina> createState() => _TelaInsulinaState();
}

class _TelaInsulinaState extends State<TelaInsulina> {
  late final TabController _tabController;
  int _currentPage = 1;
  late PageController pc;
  final _formKey = GlobalKey<FormState>();
  String nome = 'João';
  var obscureText = true;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  List<Insulina> listInsulina = [];

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

  bool isSorted = false;

  sort() {
    if (!isSorted) {
      listInsulina.sort((Insulina a, Insulina b) => a.day.compareTo(b.day));
      isSorted = true;
    } else {
      listInsulina = listInsulina.reversed.toList();
    }
  }

  get screenWidth => MediaQuery.of(context).size.width;

  get screenHeight => MediaQuery.of(context).size.height;

  late String valueChoose;

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: white,
    appBar: AppBar(
      title: Text(
        "Insulina",
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
    body:
    // (listGlicose.isEmpty)
    //     ? const Center(
    //         child: Text(
    //           "Nenhum cadastro de glicose feito ainda.\nVamos realizar o primeiro?",
    //           textAlign: TextAlign.center,
    //           style: TextStyle(fontSize: 18),
    //         ),
    //       )
    //     :
    RefreshIndicator(
      onRefresh: () {
        return refresh();
      },
      child: CustomScrollView(slivers: <Widget>[
        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.only(top: 20),
            child: SvgPicture.asset('assets/images/Medidor.svg', height: 200,),
          ),
        ),
        // SliverToBoxAdapter(
        //   child: Padding(
        //     padding: const EdgeInsets.symmetric(
        //         horizontal: 24.0, vertical: 12),
        //     child: Container(
        //       child: Row(
        //         children: [
        //           Container(
        //             margin: EdgeInsets.symmetric(horizontal: 5),
        //             height: 10,
        //             width: 10,
        //             decoration: BoxDecoration(
        //                 color: Colors.red,
        //                 borderRadius: BorderRadius.circular(50)),
        //           ),
        //           Text('Açucar no Sangue'),
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
        SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: InkWell(
                  onDoubleTap: () =>
                      showFormModal(model: listInsulina[index]),
                  onLongPress: () => showDialog(
                      context: context,
                      builder: (context) => showDialogModal(index)),
                  child: CardInsulina(
                      hora: listInsulina[index].hora,
                      concentracaoInsulina: listInsulina[index]
                          .dosagemInsulina.toInt()
                          .toString(),
                      observacoes: listInsulina[index].notas,),
                ),
              );
            }, childCount: listInsulina.length))
      ]),
    ),
    bottomNavigationBar: BottomNavigationBar(
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

  showFormModal({Insulina? model}) {
    // Labels à serem mostradas no Modal
    String labelTitle = "Adicionar Insulina";
    String labelConfirmationButton = "Salvar";
    String labelSkipButton = "Cancelar";
    late var hora;
    // Controlador do campo que receberá o nome do Objeto
    TextEditingController nameController = TextEditingController();
    TextEditingController sugarConcentrationController =
    TextEditingController();
    TextEditingController insulinaController = TextEditingController();
    TextEditingController notasController = TextEditingController();
    // Caso esteja editando
    if (model != null) {
      labelTitle = "Editando Insulina";
      insulinaController.text = model.dosagemInsulina.toInt().toString();
      notasController.text = model.notas;
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
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                Text(labelTitle, style: Theme.of(context).textTheme.headline5),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: insulinaController,
                  decoration: InputDecoration(
                    label: Text("Dosagem Insulina"),
                    hintText: 'Em ml',
                    hintStyle: styleTextFieldHint,
                  ),
                ),
                TextFormField(
                  controller: notasController,
                  decoration: const InputDecoration(label: Text("Observações")),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: buttonEmptyDialog,
                      child: Text(labelSkipButton,
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5)),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          // Criar um objeto Glicose com as infos

                          Insulina insulina = Insulina(
                              id: const Uuid().v1(),
                              dosagemInsulina:
                              double.parse(insulinaController.text),
                              day: DateTime.now().day.toDouble(),
                              hora: hora =
                                  DateFormat('hh:mm a').format(DateTime.now()),
                              notas: notasController.text);
                              // data: DateFormat('dd/MM/yy')
                              //     .format(DateTime.now()));

                          // Usar id do model
                          if (model != null) {
                            insulina.id = model.id;
                            showSnackBar(
                                context: context,
                                mensagem:
                                "Registro de Insulina alterado com sucesso!");
                          } else {
                            showSnackBar(
                                context: context,
                                mensagem:
                                "Insulina registrada com sucesso!");
                          }
                          // Salvar no Firestore
                          firestore
                              .collection("insulina")
                              .doc(insulina.id)
                              .set(insulina.toMap());
                          // Atualizar a lista
                          refresh();
                          print('Chegamos aqui 2');
                          // Fechar o Modal
                          Navigator.pop(context);
                        },
                        style: buttonFilledDialog,
                        child: Text(labelConfirmationButton,
                            style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5)))
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  refresh() async {
    List<Insulina> temp = [];

    QuerySnapshot<Map<String, dynamic>> snapshot =
    await firestore.collection("insulina").get();

    for (var doc in snapshot.docs) {
      temp.add(Insulina.fromMap(doc.data()));
    }

    setState(() {
      listInsulina = temp;
    });
    sort();
  }

  void remove(Insulina model) {
    firestore.collection('insulina').doc(model.id).delete();
    refresh();
  }

  showDialogModal(int index) {
    return AlertDialog(
      backgroundColor: white,
      title: Text(
        "Você realmente deseja excluir?",
      ),
      titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: principalColor,
          fontSize: 20,
          fontFamily: 'Poppins'),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      actionsOverflowButtonSpacing: 20,
      actions: [
        ElevatedButton(
          style: buttonEmptyDialog,
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            "Não",
            style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5),
          ),
        ),
        ElevatedButton(
            style: buttonFilledDialog,
            onPressed: () {
              remove(listInsulina[index]);

              Navigator.pop(context);
              showSnackBar(
                  context: context, mensagem: "Registro Excluído com sucesso");
            },
            child: Text(
              "Sim",
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5),
            )),
      ],
      content: Text(
        "Essa ação não poderá ser desfeita",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontFamily: 'Poppins'),
      ),
    );
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
            height: MediaQuery.of(context).size.height * 0.4,
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
                          remove(listInsulina[index]);

                          Navigator.pop(context);
                          showSnackBar(
                              context: context,
                              mensagem: "Registro Excluído com sucesso");
                        },
                        child: Text(
                          "Sim",
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5),
                        )),
                    const SizedBox(
                      height: 16,
                    ),
                    ElevatedButton(
                      style: buttonFilledPrimary,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Não",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5),
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        });
  }
}
