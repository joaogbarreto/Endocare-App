import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:primeiroprojeto/authentication/services/auth_service.dart';
import 'package:primeiroprojeto/styles/color.dart';

class TelaPerfilUsuario extends StatefulWidget {
  const TelaPerfilUsuario({Key? key}) : super(key: key);

  @override
  State<TelaPerfilUsuario> createState() => _TelaPerfilUsuarioState();
}

class _TelaPerfilUsuarioState extends State<TelaPerfilUsuario> {
  XFile? comprovante;

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
              comprovante != null
                ?InkWell(
                  onTap: () => selecionarComprovante(),
                  child: Container(
                    child: CircleAvatar(
                      radius: MediaQuery.of(context).size.width * 0.15,
                      backgroundImage: Image.file(File(comprovante!.path)).image,
                    ),
                  ),
                )
              :InkWell(
                  onTap: () => selecionarComprovante(),
                  child: Container(
                    child: CircleAvatar(
                      radius: MediaQuery.of(context).size.width * 0.15,
                      backgroundImage: const NetworkImage(
                          'https://cdn-icons-png.flaticon.com/512/6073/6073873.png'),
                    ),
                  ),
                ),
              Divider(
                thickness: 1,
                color: principalGray,
              ),
              InkWell(
                onTap: () => Navigator.pushNamed(
                    context, '/TelaPerfilUsuarioInformacoes'),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
                  child: Container(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Informações Pessoais',
                          style: TextStyle(
                              color: black2,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: black2,
                          size: 30,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Divider(
                thickness: 1,
                color: principalGray,
              ),
              InkWell(
                onTap: () =>
                    Navigator.pushNamed(context, '/TelaPerfilUsuarioConta'),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
                  child: Container(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Informações da conta',
                          style: TextStyle(
                              color: black2,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: black2,
                          size: 30,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Divider(
                thickness: 1,
                color: principalGray,
              ),
              InkWell(
                onTap: () =>
                    Navigator.pushNamed(context, '/TelaCardapiosFavoritados'),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
                  child: Container(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Cardápios Favoritados',
                          style: TextStyle(
                              color: black2,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: black2,
                          size: 30,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Divider(
                thickness: 1,
                color: principalGray,
              ),
              InkWell(
                onTap: () {
                  AuthService().deslogar();
                  Navigator.popAndPushNamed(context, '/');
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
                  child: Container(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Sair',
                          style: TextStyle(
                              color: red,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
      ));

  // showFormModal() {
  //   showModalBottomSheet(
  //     context: context,
  //
  //     // Define que as bordas verticais serão arredondadas
  //     shape: const RoundedRectangleBorder(
  //       borderRadius: BorderRadius.vertical(
  //         top: Radius.circular(24),
  //       ),
  //     ),
  //     builder: (context) {
  //       return Container(
  //           padding: const EdgeInsets.all(32.0),
  //
  //           // Formulário com Título, Campo e Botões
  //           child: ListTile(
  //             leading: Icon(Icons.attach_file),
  //             title: Text('Adicionar imagem'),
  //             onTap: selecionarComprovante(),
  //           ));
  //     },
  //   );
  // }
  selecionarComprovante() async{
    final ImagePicker picker = ImagePicker();

    try{
      XFile? file = await picker.pickImage(source: ImageSource.gallery);
      if(file != null) setState(() => comprovante=file);
    } catch (e){
      debugPrint(e.toString());
    }
  }
}
