import 'package:flutter/material.dart';
import 'package:primeiroprojeto/authentication/services/auth_service.dart';
import 'package:primeiroprojeto/styles/color.dart';

class TelaPerfilUsuarioConta extends StatefulWidget {
  const TelaPerfilUsuarioConta({Key? key}) : super(key: key);

  @override
  State<TelaPerfilUsuarioConta> createState() => _TelaPerfilUsuarioContaState();
}

class _TelaPerfilUsuarioContaState extends State<TelaPerfilUsuarioConta> {
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
                        'Email',
                        style: TextStyle(
                            color: principalGray,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            fontSize: 22
                        ),
                      ),
                      Text(
                        'joao.barreto@gmail.com',
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
                        'Senha',
                        style: TextStyle(
                            color: principalGray,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            fontSize: 22
                        ),
                      ),
                      Text(
                        'Jonas1234@@',
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
