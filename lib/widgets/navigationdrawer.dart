import 'package:flutter/material.dart';
import 'package:primeiroprojeto/styles/color.dart';
import 'package:primeiroprojeto/styles/text-styles.dart';

class NavigationMenuDrawer extends StatelessWidget {
  const NavigationMenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
        backgroundColor: white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildHeader(context),
              buildMenuItems(context),
            ],
          ),
        ),
      );

  Widget buildHeader(BuildContext context) => Container();

  Widget buildMenuItems(BuildContext context) => Wrap(
        runSpacing: 16,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              top: 50,
            ),
            child: ListTile(
              title: Text(
                'Início',
                style: styleTextMenu,
              ),
              onTap: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              top: 10,
            ),
            child: ListTile(
              title: Text(
                'Artigos',
                style: styleTextMenu,
              ),
              onTap: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              top: 10,
            ),
            child: ListTile(
              title: Text(
                'Calendário',
                style: styleTextMenu,
              ),
              onTap: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              top: 10,
            ),
            child: ListTile(
              title: Text(
                'Emergência',
                style: styleTextMenu,
              ),
              onTap: () {},
            ),
          ),
          const Divider(color: Colors.black54),
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              top: 10,
            ),
            child: ListTile(
              leading: Icon(
                Icons.account_circle,
                color: gray,
                size: 40,
              ),
              title: Text(
                'Perfil',
                style: styleTextMenu,
              ),
              onTap: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              top: 10,
            ),
            child: ListTile(
              leading: Icon(
                Icons.settings_outlined,
                color: gray,
                size: 40,
              ),
              title: Text(
                'Configurações',
                style: styleTextMenu,
              ),
              onTap: () {},
            ),
          ),
        ],
      );
}
