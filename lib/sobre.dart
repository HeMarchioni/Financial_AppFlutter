import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'alta.dart';
import 'baixa.dart';
import 'home2.dart';



class Sobre extends StatelessWidget {
  const Sobre({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('App Calculo IMC'),

      ),


      // ========================================================================= > Drawer


      drawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
                accountName: Text("User"),
                accountEmail: Text("User@user.com.br")),


            // ========================================================================= > Lista de Links


            ListTile(
              leading: const Icon(Icons.ad_units),
              title: const Text("Cotações"),
              subtitle: const Text("Principais indices"),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Home2()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.add_reaction_rounded),
              title: const Text("Alta ↑ do dia"),
              subtitle: const Text("Ação com melhor rendimento do dia"),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              onTap: () {Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Alta()),
              );
              },
            ),
            ListTile(
              leading: const Icon(Icons.anchor_rounded),
              title: const Text("Baixa ↓ do dia"),
              subtitle: const Text("Ação com pior rendimento do dia"),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              onTap: () {Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Baixa()),
              );
              },
            ),
            ListTile(
              leading: const Icon(Icons.account_balance_sharp),
              title: const Text("Sobre"),
              subtitle: const Text("Informações da aplicação"),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Sobre()),
                );
              },
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: const SafeArea(
        child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(30, 10, 30, 10),
        child: SobreBody(),
    ),
    ),
    );
  }
}









class SobreBody extends StatefulWidget {
  const SobreBody({Key? key}) : super(key: key);

  @override
  _SobreBodyState createState() => _SobreBodyState();
}

class _SobreBodyState extends State<SobreBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 30),
          child: Text(
            'Sobre',
            textAlign: TextAlign.center,
            style: TextStyle (fontWeight: FontWeight.w700,
                    color: Color(0xff242323),
                    fontFamily: 'Roboto',
                    fontSize: 33,
            ),
          ),
        ),
        const Align(
          alignment: AlignmentDirectional(0, 0),
          child: Icon(Icons.adb,
              color: Color(0xff111010)),
        ),
        const Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 20),
          child: Text(
            'Aplicativo Financial Monkey\n Versão 1.00 \n Desenvolvido por Tech Monkeys ® 2021',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xff242323),
              fontSize: 18,
              fontFamily: 'Poppins',
            ),
          ),
        ),
        Image.asset(
          'assets/images/TechMonkeys.jpg',
          width: 100,
          height: 150,
          fit: BoxFit.fitWidth,
        )
      ],
    );
  }
}
