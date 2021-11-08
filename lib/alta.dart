import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:previsao_tempo/sobre.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import 'baixa.dart';
import 'home2.dart';






class Alta extends StatelessWidget {
  const Alta({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Financial Monkey'),

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
          child: AltaBody(),
        ),
      ),
    );
  }
}




class AltaBody extends StatefulWidget {
  const AltaBody({Key? key}) : super(key: key);

  @override
  _AltaBodyState createState() => _AltaBodyState();
}




class _AltaBodyState extends State<AltaBody> {

  void initState(){
    super.initState();
    obterAlta();
  }


  String ticket = "";
  String nome = "";
  String descricao = "";
  double variacao = 0.00;
  double preco = 0.00;



  var url = "https://api.hgbrasil.com/finance/stock_price?format=json-cors&key=be36731f&symbol=get-high";



  void obterAlta() async {



    var response = await http.get(Uri.parse(url));

    Map<String, dynamic> retorno = convert.jsonDecode(response.body);



    setState(() {



      ticket = retorno["results"].toString().substring(1,6);
      nome = retorno["results"][ticket]["company_name"];
      descricao = retorno["results"][ticket]["description"];
      variacao = retorno["results"][ticket]["change_percent"];
      preco = retorno["results"][ticket]["price"];





    });
  }




  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width * 1,
        height: MediaQuery.of(context).size.height * 1,
        decoration: BoxDecoration(
          color: const Color(0xFFEEEEEE),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: Image.asset(
              'assets/images/recession.jpg',
            ).image,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
              child: Text(
                'Alta do dia',
                style: TextStyle(fontSize:25.0,
                    fontWeight: FontWeight.w600,
                    color: Color(0xffffffff),
                    fontFamily: "Poppins"
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Ticket: $ticket ',
                textAlign: TextAlign.start,
                style: const TextStyle(fontSize:20.0,
                    fontWeight: FontWeight.w600,
                    color: Color(0xffffffff),
                    fontFamily: "Poppins"
                ),
              ),
              subtitle: Text(
                '\n$nome   \n\nDescrição:\n$descricao \n\nVariação: +$variacao % \nPreço: R\$ $preco ',
                style: const TextStyle(fontSize:16.0,
                    fontWeight: FontWeight.w400,
                    color: Color(0xffffffff),
                    fontFamily: "Poppins"
                ),
              ),
              tileColor: const Color(0xFFF5F5F5),
              dense: false,
            )
          ],
        ),
      ),
    );

  }
}


