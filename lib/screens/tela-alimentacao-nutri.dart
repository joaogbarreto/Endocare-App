import 'package:flutter/material.dart';
import 'package:primeiroprojeto/firestore/firestore_glicose/models/glicose.dart';
import 'package:primeiroprojeto/styles/color.dart';
import 'package:primeiroprojeto/styles/text-styles.dart';
import 'package:primeiroprojeto/widgets/card-glicose.dart';
import 'package:primeiroprojeto/widgets/line-chart.dart';

class TelaAlimentacaoNutricionista extends StatefulWidget {
  const TelaAlimentacaoNutricionista({Key? key}) : super(key: key);

  @override
  State<TelaAlimentacaoNutricionista> createState() => _TelaAlimentacaoNutricionistaState();
}

class _TelaAlimentacaoNutricionistaState extends State<TelaAlimentacaoNutricionista> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var obscureText = true;
  final _formKey = GlobalKey<FormState>();

  get screenWidth => MediaQuery.of(context).size.width;

  get screenHeight => MediaQuery.of(context).size.height;

  late String valueChoose;
  final key = Key('123');

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: white,
    appBar: AppBar(
      title: Text(
        "Alimentação",
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 22,
        ),
      ),
      foregroundColor: principalColor,
      backgroundColor: Colors.transparent,
    ),
    body: CustomScrollView(slivers: <Widget>[
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: TextField(
              style: styleTextFieldPrincipalColor,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  prefixIconColor: principalColor,
                  filled: false,
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: principalColor, width: 2.5),
                      borderRadius: BorderRadius.circular(50)),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: red, width: 2.5),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: red, width: 2.5),
                      borderRadius: BorderRadius.circular(50)),
                  hintText: 'Pesquise por Receitas',
                  hintStyle: styleTextFieldPrincipalColor,
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: principalColor, width: 2.5),
                      borderRadius: BorderRadius.circular(50))),
            ),
          ),
        ),
      ),
      // SliverList(delegate: SliverChildBuilderDelegate((context, index) {
      //   return Padding(
      //     padding: const EdgeInsets.all(12.0),
      //     child: InkWell(
      //       // onLongPress: () => showDialog(
      //       //     context: context,
      //       //     builder: (context) => showDialogModal(index)),
      //       child:
      //       CardGlicose(
      //           hora: listGlicose[index].hora,
      //           concentracaoSugarSangue:
      //           listGlicose[index].sugarConcentration.toString(),
      //           data: listGlicose[index].data.toString()),
      //     ),
      //   );
      // }, childCount: listGlicose.length))
      // SliverGrid(delegate: SliverChildBuilderDelegate((context, index) {
      // return HighlightItem(imageURI: items[index]['image'], itemTitle: items[index]['name'], itemPrice: items[index]['price'], itemDescription: items[index]['description']);
      // }, childCount: items.length),
      // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      // crossAxisCount: 2,
      // crossAxisSpacing: 8,
      // mainAxisSpacing: 8,
      // childAspectRatio: 1.2,
      // ));
      // SliverToBoxAdapter(
      //   child: ListView(
      //     scrollDirection: Axis.horizontal
      //     ,
      //       children: [
      //         Padding(
      //           padding: const EdgeInsets.all(8.0),
      //           child: Glicose(
      //             key: key,
      //             data: '02/02/2023',
      //             hora: '06:00 AM',
      //             evento: 'Antes do café',
      //             notas: 'Comi o pão de queijo',
      //             concentracaoSugarSangue: '40',
      //           ),
      //         )
      //      ]
      //   )
      // )
    ]),
    floatingActionButton: FloatingActionButton(
      backgroundColor: principalColor,
      shape: CircleBorder(),
      child: Icon(
        Icons.add,
        color: Colors.white,
      ),
      onPressed: () {
        Navigator.pushNamed(context, '/TelaEscolhaAlimentos');
      },
    ),
  );
}
