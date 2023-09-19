import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:primeiroprojeto/authentication/components/show_snackbar.dart';
import 'package:primeiroprojeto/firestore/firestore_glicose/models/glicose.dart';
import 'package:primeiroprojeto/styles/button.dart';
import 'package:primeiroprojeto/styles/color.dart';
import 'package:primeiroprojeto/styles/text-styles.dart';
import 'package:primeiroprojeto/widgets/card-glicose.dart';
import 'package:primeiroprojeto/widgets/line-chart.dart';
import 'package:uuid/uuid.dart';

class TelaGlicose extends StatefulWidget {
  const TelaGlicose({Key? key}) : super(key: key);

  @override
  State<TelaGlicose> createState() => _TelaGlicoseState();
}

class _TelaGlicoseState extends State<TelaGlicose> {
  late final TabController _tabController;
  int _currentPage = 1;
  late PageController pc;
  final _formKey = GlobalKey<FormState>();
  String nome = 'João';
  var obscureText = true;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  String fUID = FirebaseAuth.instance.currentUser!.uid;
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

  bool isSorted = false;

  sort() {
    if (!isSorted) {
      listGlicose.sort((Glicose a, Glicose b) => a.day.compareTo(b.day));
      isSorted = true;
    } else {
      listGlicose = listGlicose.reversed.toList();
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
            "Registrar Glicose",
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
                child: LineChartWidget(glicoseNoSangue: listGlicose),
              ),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: InkWell(
                  onDoubleTap: () => showFormModal(model: listGlicose[index]),
                  onLongPress: () => showDialog(
                      context: context,
                      builder: (context) => showDialogModal(index)),
                  child: CardGlicose(
                      hora: listGlicose[index].hora,
                      concentracaoSugarSangue:
                          listGlicose[index].sugarConcentration.toString(),
                      data: listGlicose[index].data.toString()),
                ),
              );
            }, childCount: listGlicose.length))
          ]),
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
      glicoseController.text = model.sugarConcentration.toInt().toString();
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
                  controller: glicoseController,
                  decoration: InputDecoration(
                    label: Text("Quantidade de Glicose Medida"),
                    hintText: 'Em mg/dl',
                    hintStyle: styleTextFieldHint,
                  ),
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

                          Glicose glicose = Glicose(
                              id: const Uuid().v1(),
                              sugarConcentration:
                                  double.parse(glicoseController.text),
                              day: DateTime.now().day.toDouble(),
                              hora: hora =
                                  DateFormat('hh:mm a').format(DateTime.now()),
                              data: DateFormat('dd/MM/yy')
                                  .format(DateTime.now()));

                          // Usar id do model
                          if (model != null) {
                            glicose.id = model.id;
                            showSnackBar(
                                context: context,
                                mensagem:
                                    "Nível Glicêmico alterado com sucesso!",
                                isErro: false);
                          } else {
                            showSnackBar(
                                context: context,
                                mensagem:
                                    "Nível Glicêmico registrado com sucesso!",
                                isErro: false);
                          }
                          // Salvar no Firestore
                          firestore
                              .collection("glicose")
                              .doc(glicose.id)
                              .set(glicose.toMap());
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
    List<Glicose> temp = [];

    QuerySnapshot<Map<String, dynamic>> snapshot =
        await firestore.collection("glicose").get();

    for (var doc in snapshot.docs) {
      temp.add(Glicose.fromMap(doc.data()));
    }

    setState(() {
      listGlicose = temp;
    });
    sort();
  }

  void remove(Glicose model) {
    firestore.collection('glicose').doc(model.id).delete();
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
              remove(listGlicose[index]);

              Navigator.pop(context);
              showSnackBar(
                  context: context,
                  mensagem: "Registro Excluído com sucesso",
                  isErro: false);
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
                          remove(listGlicose[index]);

                          Navigator.pop(context);
                          showSnackBar(
                              context: context,
                              mensagem: "Registro Excluído com sucesso",
                              isErro: false);
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
