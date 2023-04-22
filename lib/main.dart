import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:primeiroprojeto/screens/tela-alimentacao.dart';
import 'package:primeiroprojeto/screens/tela-cadastro-glicose.dart';
import 'package:primeiroprojeto/screens/tela-cadastro-insulina.dart';
import 'package:primeiroprojeto/screens/tela-cadastro-medicacao.dart';
import 'package:primeiroprojeto/screens/tela-cadastro-usuario.dart';
import 'package:primeiroprojeto/screens/tela-glicose.dart';
import 'package:primeiroprojeto/screens/tela-insulina.dart';
import 'package:primeiroprojeto/screens/tela-login.dart';
import 'package:primeiroprojeto/screens/tela-medicacao.dart';
import 'package:primeiroprojeto/styles/color.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'screens/tela-cadastropt1.dart';
import 'screens/tela-home.dart';
import 'screens/tela-inicio.dart';
import 'screens/telacadastropt2.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  firestore.collection("Só para testar").doc("Estou testando").set({"Funcionou?": true});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EndoCare',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: principalColor),
        useMaterial3: true,
      ),
      initialRoute: '/TelaGlicose',
      routes: {
        '/': (context) => const TelaInicio(),
        '/TelaLogin': (context) => const TelaLogin(),
        '/TelaCadastroPT1': (context) => const TelaCadastroPT1(),
        '/TelaCadastroPT2': (context) => const TelaCadastroPT2(),
        '/TelaHomePages': (context) => const TelaHomePages(),
        '/TelaCadastroGlicose': (context) => const TelaCadastroGlicose(),
        '/TelaGlicose': (context) => const TelaGlicose(),
        '/TelaInsulina': (context) => const TelaInsulina(),
        '/TelaMedicacao': (context) => const TelaMedicacao(),
        '/TelaAlimentacao': (context) => const TelaAlimentacao(),
        '/TelaCadastroInsulina': (context) => const TelaCadastroInsulina(),
        '/TelaCadastroMedicacao': (context) => const TelaCadastroMedicacao()
      },
      // home: const TelaHomePages(),
    );
  }
}
