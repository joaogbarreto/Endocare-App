import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:primeiroprojeto/screens/tela-alimentacao.dart';
import 'package:primeiroprojeto/screens/tela-cadastro-glicose.dart';
import 'package:primeiroprojeto/screens/tela-cadastro-insulina.dart';
import 'package:primeiroprojeto/screens/tela-cadastro-medicacao.dart';
import 'package:primeiroprojeto/screens/tela-cadastro-usuario.dart';
import 'package:primeiroprojeto/screens/tela-cadastro-usuariopt1.dart';
import 'package:primeiroprojeto/screens/tela-cadastro-usuariopt2.dart';
import 'package:primeiroprojeto/screens/tela-cadastro-usuariopt3.dart';
import 'package:primeiroprojeto/screens/tela-emergencia.dart';
import 'package:primeiroprojeto/screens/tela-glicose.dart';
import 'package:primeiroprojeto/screens/tela-inicio.dart';
import 'package:primeiroprojeto/screens/tela-insulina.dart';
import 'package:primeiroprojeto/screens/tela-login.dart';
// import 'package:primeiroprojeto/screens/tela-login.dart';
import 'package:primeiroprojeto/screens/tela-medicacao.dart' ;
import 'package:primeiroprojeto/screens/tela-perfil-usuario-conta.dart';
import 'package:primeiroprojeto/screens/tela-perfil-usuario-informacoes.dart';
import 'package:primeiroprojeto/screens/tela-perfil-usuario.dart';
import 'package:primeiroprojeto/styles/color.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// import 'screens/tela-cadastropt1.dart';
import 'screens/tela-home.dart';
// import 'screens/tela-inicio.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value)=> runApp(const MyApp()));

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  firestore.collection("Só para testar").doc("Estou testando").set({"Funcionou?": true});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EndoCare',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: principalColor),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const TelaInicio(),
        '/TelaLogin': (context) => const TelaLogin(),
        '/TelaCadastroUsuarioPT1': (context) => const TelaCadastroUsuarioPT1(),
        '/TelaCadastroUsuarioPT2': (context) => const TelaCadastroUsuarioPT2(),
        '/TelaCadastroUsuarioPT3': (context) => const TelaCadastroUsuarioPT3(),
        '/TelaHomePages': (context) => const TelaHomePages(),
        '/TelaGlicose': (context) => const TelaGlicose(),
        '/TelaInsulina': (context) => const TelaInsulina(),
        '/TelaMedicacao': (context) => const TelaMedicacao(),
        '/TelaAlimentacao': (context) => const TelaAlimentacao(),
        '/TelaPerfilUsuario': (context) => const TelaPerfilUsuario(),
        '/TelaPerfilUsuarioInformacoes': (context) => const TelaPerfilUsuarioInformacoes(),
        '/TelaPerfilUsuarioConta': (context) => const TelaPerfilUsuarioConta(),
        // '/TelaCadastroGlicose': (context) => const TelaCadastroGlicose(),
        // '/TelaCadastroInsulina': (context) => const TelaCadastroInsulina(),
        // '/TelaCadastroMedicacao': (context) => const TelaCadastroMedicacao(),
      },
      // home: const TelaHomePages(),
    );
  }
}
class RoteadorTelas extends StatelessWidget {
  const RoteadorTelas({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.userChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else {
          if (snapshot.hasData) {
            return TelaHomePages(
              user: snapshot.data!,
            );
          } else {
            return const TelaInicio();
          }
        }
      },
    );
  }
}
