import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:primeiroprojeto/screens/tela-alimentacao.dart';
import 'package:primeiroprojeto/screens/tela-cadastro-alimentos.dart';
import 'package:primeiroprojeto/screens/tela-cadastro-usuario-adolept1.dart';
import 'package:primeiroprojeto/screens/tela-cadastro-usuario-adolept2.dart';
import 'package:primeiroprojeto/screens/tela-cadastro-usuario-adolept3.dart';
import 'package:primeiroprojeto/screens/tela-cadastro-usuario-nutript1.dart';
import 'package:primeiroprojeto/screens/tela-cadastro-usuario-nutript2.dart';
import 'package:primeiroprojeto/screens/tela-cadastro-usuario-nutript3.dart';
import 'package:primeiroprojeto/screens/tela-escolha-alimentos.dart';
import 'package:primeiroprojeto/screens/tela-escolha.dart';
import 'package:primeiroprojeto/screens/tela-glicose.dart';
import 'package:primeiroprojeto/screens/tela-home-nutri.dart';
import 'package:primeiroprojeto/screens/tela-inicio.dart';
import 'package:primeiroprojeto/screens/tela-insulina.dart';
import 'package:primeiroprojeto/screens/tela-login.dart';
// import 'package:primeiroprojeto/screens/tela-login.dart';
import 'package:primeiroprojeto/screens/tela-medicacao.dart' ;
import 'package:primeiroprojeto/screens/tela-perfil-usuario-conta.dart';
import 'package:primeiroprojeto/screens/tela-perfil-usuario-informacoes.dart';
import 'package:primeiroprojeto/screens/tela-perfil-usuario.dart';
import 'package:primeiroprojeto/styles/color.dart';

import 'firebase_options.dart';
// import 'screens/tela-cadastropt1.dart';
import 'screens/tela-home-adole.dart';
// import 'screens/tela-inicio.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value)=> runApp(const MyApp()));

  FirebaseFirestore firestore = FirebaseFirestore.instance;
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
      initialRoute: '/TelaHomePagesNutricionista',
      routes: {
        '/': (context) => const TelaInicio(),
        '/TelaLogin': (context) => const TelaLogin(),
        '/TelaCadastroUsuarioAdolescentePT1': (context) => const TelaCadastroUsuarioAdolescentePT1(),
        '/TelaCadastroUsuarioAdolescentePT2': (context) => const TelaCadastroUsuarioAdolescentePT2(),
        '/TelaCadastroUsuarioAdolescentePT3': (context) => const TelaCadastroUsuarioAdolescentePT3(),
        '/TelaCadastroUsuarioNutricionistaPT1': (context) => const TelaCadastroUsuarioNutricionistaPT1(),
        '/TelaCadastroUsuarioNutricionistaPT2': (context) => const TelaCadastroUsuarioNutricionistaPT2(),
        '/TelaCadastroUsuarioNutricionistaPT3': (context) => const TelaCadastroUsuarioNutricionistaPT3(),
        '/TelaHomePagesAdolescente': (context) => const TelaHomePagesAdolescente(),
        '/TelaHomePagesNutricionista': (context) => const TelaHomePagesNutricionista(),
        '/TelaGlicose': (context) => const TelaGlicose(),
        '/TelaInsulina': (context) => const TelaInsulina(),
        '/TelaMedicacao': (context) => const TelaMedicacao(),
        '/TelaAlimentacao': (context) => const TelaAlimentacao(),
        '/TelaEscolha': (context) => const TelaEscolha(),
        '/TelaEscolhaAlimentos': (context) => const TelaEscolhaAlimentos(),
        '/TelaCadastroAlimentos': (context) => const TelaCadastroAlimentos(),
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
            return TelaHomePagesAdolescente(
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
