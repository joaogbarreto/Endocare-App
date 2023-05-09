import 'package:flutter/material.dart';
import 'package:primeiroprojeto/objects/glicose.dart';
import 'package:primeiroprojeto/styles/color.dart';
import 'package:primeiroprojeto/styles/text-styles.dart';
import 'package:primeiroprojeto/widgets/card-glicose.dart';
import 'package:primeiroprojeto/widgets/line-chart.dart';

class TelaAlimentacao extends StatefulWidget {
  const TelaAlimentacao({Key? key}) : super(key: key);

  @override
  State<TelaAlimentacao> createState() => _TelaAlimentacaoState();
}

class _TelaAlimentacaoState extends State<TelaAlimentacao> {
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
    appBar: AppBar(
      title: Text(
        "Alimentação",
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 22,
        ),
      ),
      leading: BackButton(
        onPressed: (){
          Navigator.pop(context);
        },
      ),
      foregroundColor: newprincipalColor,
      backgroundColor: Colors.transparent,
    ),
    body: CustomScrollView(slivers: <Widget>[
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: double.infinity,
            child: Text(
              'Horarios de Alimentação', textAlign: TextAlign.center,
              style: TextStyle(fontSize: 26, fontFamily: 'Poppins'),
            ),
          ),
        ),
      ),
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 32, right: 32),
          child: Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
                color: newprincipalColor,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 5.0,
                      offset: Offset(0, 5)),
                ]
            ),
          ),
        ),
      ),
      // SliverToBoxAdapter(
      //   child: ListView(
      //     scrollDirection: Axis.horizontal,
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
  );
}
