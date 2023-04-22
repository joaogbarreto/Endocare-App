import 'package:flutter/material.dart';
import 'package:primeiroprojeto/objects/glicose.dart';
import 'package:primeiroprojeto/styles/color.dart';
import 'package:primeiroprojeto/styles/text-styles.dart';
import 'package:primeiroprojeto/widgets/card-insulina.dart';
import 'package:primeiroprojeto/widgets/cardglicose.dart';
import 'package:primeiroprojeto/widgets/line-chart.dart';

class TelaInsulina extends StatefulWidget {
  const TelaInsulina({Key? key}) : super(key: key);

  @override
  State<TelaInsulina> createState() => _TelaInsulinaState();
}

class _TelaInsulinaState extends State<TelaInsulina> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var obscureText = true;
  final _formKey = GlobalKey<FormState>();

  get screenWidth => MediaQuery.of(context).size.width;

  get screenHeight => MediaQuery.of(context).size.height;

  late String valueChoose;
  final key = Key('123');
  @override
  Widget build(BuildContext context) => Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Insulina",
          ),
          leading: IconButton(
            icon:Icon(Icons.arrow_back_outlined,
              size: 30, ),
            onPressed: (){
              Navigator.pushNamed(context, '/TelaHome');
            },
          ),
          foregroundColor: white,
          backgroundColor: principalColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Insulina(
                key: key,
                data: '02/02/2023',
                hora: '06:00 AM',
                evento: 'Antes do café',
                notas: 'Comi o pão de queijo',
                concentracaoInsulina: '40',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Insulina(
                key: key,
                data: '02/02/2023',
                hora: '06:00 AM',
                evento: 'Antes do café',
                notas: 'Comi o pão de queijo',
                concentracaoInsulina: '40',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Insulina(
                key: key,
                data: '02/02/2023',
                hora: '06:00 AM',
                evento: 'Antes do café',
                notas: 'Comi o pão de queijo',
                concentracaoInsulina: '40',
              ),
            ),
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
            Navigator.pushNamed(context, '/TelaCadastroInsulina ');
          },
        ),
      ));
}
