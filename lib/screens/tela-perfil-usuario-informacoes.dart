import 'package:flutter/material.dart';
import 'package:primeiroprojeto/styles/color.dart';

class TelaPerfilUsuarioInformacoes extends StatefulWidget {
  const TelaPerfilUsuarioInformacoes({Key? key}) : super(key: key);

  @override
  State<TelaPerfilUsuarioInformacoes> createState() => _TelaPerfilUsuarioInformacoesState();
}

class _TelaPerfilUsuarioInformacoesState extends State<TelaPerfilUsuarioInformacoes> {
  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: Text(
          "Meu Perfil",
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
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: CircleAvatar(
                  radius: MediaQuery.of(context).size.width * 0.15,
                  backgroundImage: const NetworkImage('https://cdn-icons-png.flaticon.com/512/6073/6073873.png'),
                ),
              ),
              Divider(
                thickness: 1,
                color: principalGray,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Primeiro Nome',
                        style: TextStyle(
                            color: principalGray,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            fontSize: 22
                        ),
                      ),
                      Text(
                        'João Guilherme',
                        style: TextStyle(
                            color: black2,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            fontSize: 22
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              Divider(
                thickness: 1,
                color: principalGray,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Segundo Nome',
                        style: TextStyle(
                            color: principalGray,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            fontSize: 22
                        ),
                      ),
                      Text(
                        'Pontes Barreto',
                        style: TextStyle(
                            color: black2,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            fontSize: 22
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                thickness: 1,
                color: principalGray,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Data de Nascimento',
                        style: TextStyle(
                            color: principalGray,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            fontSize: 22
                        ),
                      ),
                      Text(
                        '07/12/2005',
                        style: TextStyle(
                            color: black2,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            fontSize: 22
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              Divider(
                thickness: 1,
                color: principalGray,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Gênero',
                        style: TextStyle(
                            color: principalGray,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            fontSize: 22
                        ),
                      ),
                      Text(
                        'Masculino',
                        style: TextStyle(
                            color: black2,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            fontSize: 22
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                thickness: 1,
                color: principalGray,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Peso',
                        style: TextStyle(
                            color: principalGray,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            fontSize: 22
                        ),
                      ),
                      Text(
                        '75Kg',
                        style: TextStyle(
                            color: black2,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            fontSize: 22
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              Divider(
                thickness: 1,
                color: principalGray,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Altura',
                        style: TextStyle(
                            color: principalGray,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            fontSize: 22
                        ),
                      ),
                      Text(
                        '1,85m',
                        style: TextStyle(
                            color: black2,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            fontSize: 22
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                thickness: 1,
                color: principalGray,
              ),
            ]),
      ));
}
