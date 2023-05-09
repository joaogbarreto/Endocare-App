import 'package:flutter/material.dart';
import 'package:primeiroprojeto/styles/color.dart';
import 'package:primeiroprojeto/styles/text-styles.dart';
import 'package:primeiroprojeto/widgets/card-glicose.dart';

class TelaCadastroInsulina extends StatefulWidget {
  const TelaCadastroInsulina({Key? key}) : super(key: key);

  @override
  State<TelaCadastroInsulina> createState() => _TelaCadastroInsulinaState();
}

class _TelaCadastroInsulinaState extends State<TelaCadastroInsulina> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var obscureText = true;
  final _formKey = GlobalKey<FormState>();

  get screenWidth => MediaQuery.of(context).size.width;

  get screenHeight => MediaQuery.of(context).size.height;

  List listitem = [
    "Antes do café",
    "Depois do café",
    "Antes do almoço",
    "Depois do almoço",
    "Antes da Janta",
    "Depois da Janta",
  ];
  late String valueChoose;

  @override
  Widget build(BuildContext context) => Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Insulina",
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_outlined,
              size: 30,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/TelaHome');
            },
          ),
          actions: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  icon: Icon(Icons.check),
                  onPressed: () {
                    Navigator.pushNamed(context, '/TelaHome');
                  },
                ))
          ],
          foregroundColor: white,
          backgroundColor: principalColor,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: MediaQuery.of(context).size.height * 0.10,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: white,
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xFFe8e8e8),
                            blurRadius: 5.0,
                            offset: Offset(0, 5)),
                        BoxShadow(color: white, offset: Offset(-5, 0)),
                        BoxShadow(color: white, offset: Offset(5, 0)),
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                        child: Text(
                          'Dose',
                          style: styleText,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 30.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'ml',
                            labelStyle: TextStyle(
                                color: principalGray,
                                fontFamily: 'SourceSansPro',
                                fontSize: 20),
                            fillColor: white,
                            filled: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Container(
              //     width: MediaQuery.of(context).size.width * 0.95,
              //     height: MediaQuery.of(context).size.height * 0.10,
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(20),
              //         color: white,
              //         boxShadow: [
              //           BoxShadow(
              //               color: Color(0xFFe8e8e8),
              //               blurRadius: 5.0,
              //               offset: Offset(0, 5)),
              //           BoxShadow(color: white, offset: Offset(-5, 0)),
              //           BoxShadow(color: white, offset: Offset(5, 0)),
              //         ]),
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Padding(
              //           padding: const EdgeInsets.only(top: 8.0, left: 8.0),
              //           child: Text(
              //             'Evento',
              //             style: styleText,
              //           ),
              //         ),
              //         Container(
              //           width: MediaQuery.of(context).size.width * 0.4,
              //           child: TextFormField(
              //             decoration: InputDecoration(
              //               hintText: 'Antes do café',
              //               hintStyle: TextStyle(
              //                 color: gray,
              //                 fontFamily: 'SourceSansPro',
              //                 fontSize: 20,
              //               ),
              //             ),
              //           ),
              //         ),
              //         // DropdownButton(
              //         //     value: valueChoose,
              //         //     items: listitem.map(valueItem){
              //         // return DropdownMenuItem(
              //         // value: valueItem,
              //         // );
              //         // },
              //         //     onChanged: (newValue) {
              //         //       setState(() {
              //         //         valueChoose = newValue;
              //         //       });
              //         //     })
              //       ],
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: MediaQuery.of(context).size.height * 0.10,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: white,
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xFFe8e8e8),
                            blurRadius: 5.0,
                            offset: Offset(0, 5)),
                        BoxShadow(color: white, offset: Offset(-5, 0)),
                        BoxShadow(color: white, offset: Offset(5, 0)),
                      ]),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                          child: Text(
                            'Data & Hora',
                            style: styleText,
                          ),
                        ),
                        Container(
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.4,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      hintText: 'DD/MM/AAAA',
                                      hintStyle: TextStyle(
                                        color: principalGray,
                                        fontFamily: 'SourceSansPro',
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      hintText: 'HH:MM',
                                      hintStyle: TextStyle(
                                        color: principalGray,
                                        fontFamily: 'SourceSansPro',
                                        fontSize: 20,
                                      ),
                                      fillColor: white,
                                      filled: true,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                ),
              ),
              // Container(
              //   width: MediaQuery.of(context).size.width * 0.95,
              //   height: MediaQuery.of(context).size.height * 0.10,
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(20),
              //       color: white,
              //       boxShadow: [
              //         BoxShadow(
              //             color: Color(0xFFe8e8e8),
              //             blurRadius: 5.0,
              //             offset: Offset(0, 5)),
              //         BoxShadow(color: white, offset: Offset(-5, 0)),
              //         BoxShadow(color: white, offset: Offset(5, 0)),
              //       ]),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Padding(
              //         padding: const EdgeInsets.only(top: 8.0, left: 8.0),
              //         child: Text(
              //           'Notas',
              //           style: styleText,
              //         ),
              //       ),
              //       Padding(
              //         padding: const EdgeInsets.only(left: 10, right: 30.0),
              //         child: TextFormField(
              //           decoration: InputDecoration(
              //             fillColor: white,
              //             filled: true,
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ));
}
