import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:previsao_tempo/sobre.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;


import 'alta.dart';
import 'baixa.dart';

class Home2 extends StatelessWidget {
  const Home2({Key? key}) : super(key: key);

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

      body: const Cotacao(),
    );
  }
}







class Cotacao extends StatefulWidget {
  const Cotacao({Key? key}) : super(key: key);

  @override
  _CotacaoState createState() => _CotacaoState();
}





class _CotacaoState extends State<Cotacao> {



  @override
  void initState(){
    super.initState();
    obterCotacao();
  }



  double dolarValor = 0.00;
  double euroValor = 0.00;
  double bitcoinValor = 0.00;
  double ibov = 0.00;
  double nasdaq = 0.00;
  double dowjones = 0.00;

  double dolarVariacao = 0.00;
  double euroVariacao = 0.00;
  double bitcoinVariacao = 0.00;
  double ibovVariacao = 0.00;
  double nasdaqVariacao = 0.00;
  double dowjonesVariacao = 0.00;



  var url = "https://api.hgbrasil.com/finance?format=json-cors&key=be36731f";



  void obterCotacao() async {



    var response = await http.get(Uri.parse(url));
    Map<String, dynamic> retorno = convert.jsonDecode(response.body);



    setState(() {

      // -> Moedas
      dolarValor = retorno["results"]["currencies"]["USD"]["buy"];
      euroValor = retorno["results"]["currencies"]["EUR"]["buy"];
      bitcoinValor = retorno["results"]["currencies"]["BTC"]["buy"];

      dolarVariacao = retorno["results"]["currencies"]["USD"]["variation"];
      euroVariacao = retorno["results"]["currencies"]["EUR"]["variation"];
      bitcoinVariacao = retorno["results"]["currencies"]["BTC"]["variation"];


      // -> Indices
      ibov = retorno["results"]["stocks"]["IBOVESPA"]["points"];
      nasdaq = retorno["results"]["stocks"]["NASDAQ"]["points"];
      dowjones = retorno["results"]["stocks"]["DOWJONES"]["points"];

      ibovVariacao = retorno["results"]["stocks"]["IBOVESPA"]["variation"];
      nasdaqVariacao = retorno["results"]["stocks"]["NASDAQ"]["variation"];
      dowjonesVariacao = retorno["results"]["stocks"]["DOWJONES"]["variation"];






    });
  }








  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(

        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/stock-market-background.jpg"),
            fit: BoxFit.cover,
          ),
        ),

        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 5),
              child: Text(
                'Principais Cotações',
                style: TextStyle(fontSize:20.0,
                    fontWeight: FontWeight.w600,
                    color: Color(0xffffffff),
                    fontFamily: "Poppins"
                ),
              ),
            ),




            Expanded(
              child: Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 15, 10, 20),




                  child: GridView(
                    padding: EdgeInsets.zero,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1,
                    ),
                    scrollDirection: Axis.vertical,
                    children: [
                      Material(
                        color: Colors.transparent,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2),
                        ),





                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: const Color(0xFFC8E6C9),
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 2,
                                color: Color(0xFF9E9E9E),
                                offset: Offset(1, 1),
                                spreadRadius: 2,
                              )
                            ],
                            borderRadius: BorderRadius.circular(2),
                            shape: BoxShape.rectangle,
                            border: Border.all(
                              color: const Color(0xFF060B0D),
                              width: 2,
                            ),
                          ),





                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children:  [


                              const Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                child: Text(
                                  'DOLAR',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize:15.0,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff000000),
                                      fontFamily: "Poppins"
                                  ),
                                ),
                              ),




                              Padding(
                                padding:
                                const EdgeInsetsDirectional.fromSTEB(0, 18, 0, 5),
                                child: Text(
                                  "R\$ $dolarValor",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize:15.0,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff044b04),
                                      fontFamily: "Poppins"
                                  ),
                                ),
                              ),




                              Text(
                                '$dolarVariacao%',
                                style: const TextStyle(fontSize:15.0,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff950000),
                                    fontFamily: "Poppins"
                                ),
                              )
                            ],
                          ),
                        ),
                      ),




                      Material(
                        color: Colors.transparent,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: const Color(0xFFC8E6C9),
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 2,
                                color: Color(0xFF9E9E9E),
                                offset: Offset(1, 1),
                                spreadRadius: 2,
                              )
                            ],
                            borderRadius: BorderRadius.circular(2),
                            shape: BoxShape.rectangle,
                            border: Border.all(
                              color: const Color(0xFF060B0D),
                              width: 2,
                            ),
                          ),




                          child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children:  [


                          const Padding(
                          padding:
                          EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                          child: Text(
                                'EURO',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize:15.0,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff000000),
                                    fontFamily: "Poppins"
                                ),
                              ),
                          ),




                              Padding(
                                padding:
                                const EdgeInsetsDirectional.fromSTEB(0, 18, 0, 5),
                                child: Text(
                                  'R\$ $euroValor',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize:15.0,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff044b04),
                                      fontFamily: "Poppins"
                                  ),
                                ),
                              ),




                              Text(
                                '$euroVariacao%',
                                style: const TextStyle(fontSize:15.0,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff950000),
                                    fontFamily: "Poppins"
                                ),
                              )
                            ],
                          ),
                        ),
                      ),



                      Material(
                        color: Colors.transparent,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: const Color(0xFFC8E6C9),
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 2,
                                color: Color(0xFF9E9E9E),
                                offset: Offset(1, 1),
                                spreadRadius: 2,
                              )
                            ],
                            borderRadius: BorderRadius.circular(2),
                            shape: BoxShape.rectangle,
                            border: Border.all(
                              color: const Color(0xFF060B0D),
                              width: 2,
                            ),
                          ),




                          child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children:  [


                          const Padding(
                          padding:
                          EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                          child: Text(
                                'BITCOIN',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize:15.0,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff000000),
                                    fontFamily: "Poppins"
                                ),
                              ),
                          ),




                              Padding(
                                padding:
                                const EdgeInsetsDirectional.fromSTEB(0, 18, 0, 5),
                                child: Text(
                                  'R\$ $bitcoinValor',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize:15.0,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff044b04),
                                      fontFamily: "Poppins"
                                  ),
                                ),
                              ),




                              Text(
                                '$bitcoinVariacao%',
                                style: const TextStyle(fontSize:15.0,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff950000),
                                    fontFamily: "Poppins"
                                ),
                              )
                            ],
                          ),
                        ),
                      ),




                      Material(
                        color: Colors.transparent,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: const Color(0xFFC8E6C9),
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 2,
                                color: Color(0xFF9E9E9E),
                                offset: Offset(1, 1),
                                spreadRadius: 2,
                              )
                            ],
                            borderRadius: BorderRadius.circular(2),
                            shape: BoxShape.rectangle,
                            border: Border.all(
                              color: const Color(0xFF060B0D),
                              width: 2,
                            ),
                          ),




                          child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children:  [


                          const Padding(
                          padding:
                          EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                          child: Text(
                                'IBOVESPA',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize:15.0,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff000000),
                                    fontFamily: "Poppins"
                                ),
                              ),
                          ),




                              Padding(
                                padding:
                                const EdgeInsetsDirectional.fromSTEB(0, 18, 0, 5),
                                child: Text(
                                  '$ibov',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize:15.0,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff044b04),
                                  fontFamily: "Poppins"
                                  ),
                                                            ),
                              ),




                              Text(
                                '$ibovVariacao%',
                                style: const TextStyle(fontSize:15.0,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff950000),
                                    fontFamily: "Poppins"
                                ),
                              )
                            ],
                          ),
                        ),
                      ),




                      Material(
                        color: Colors.transparent,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: const Color(0xFFC8E6C9),
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 2,
                                color: Color(0xFF9E9E9E),
                                offset: Offset(1, 1),
                                spreadRadius: 2,
                              )
                            ],
                            borderRadius: BorderRadius.circular(2),
                            shape: BoxShape.rectangle,
                            border: Border.all(
                              color: const Color(0xFF060B0D),
                              width: 2,
                            ),
                          ),





                          child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children:  [


                          const Padding(
                          padding:
                          EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                          child: Text(
                                'NASDAQ',
                                textAlign: TextAlign.center,
                                style:TextStyle(fontSize:15.0,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff000000),
                                fontFamily: "Poppins"
                                ),
                          ),
                                                        ),





                              Padding(
                                padding:
                                const EdgeInsetsDirectional.fromSTEB(0, 18, 0, 5),
                                child: Text(
                                  '$nasdaq',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize:15.0,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff044b04),
                                      fontFamily: "Poppins"
                                  ),
                                ),
                              ),





                              Text(
                                '$nasdaqVariacao%',
                                style: const TextStyle(fontSize:15.0,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff950000),
                                    fontFamily: "Poppins"
                                ),
                              )
                            ],
                          ),
                        ),
                      ),





                      Material(
                        color: Colors.transparent,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: const Color(0xFFC8E6C9),
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 2,
                                color: Color(0xFF9E9E9E),
                                offset: Offset(1, 1),
                                spreadRadius: 2,
                              )
                            ],
                            borderRadius: BorderRadius.circular(2),
                            shape: BoxShape.rectangle,
                            border: Border.all(
                              color: const Color(0xFF060B0D),
                              width: 2,
                            ),
                          ),




                          child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children:  [


                          const Padding(
                          padding:
                          EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                          child: Text(
                                'DOWJONES',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize:15.0,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff000000),
                                    fontFamily: "Poppins"
                                ),
                              ),
                          ),




                              Padding(
                                padding:
                                const EdgeInsetsDirectional.fromSTEB(0, 18, 0, 5),
                                child: Text(
                                  '$dowjones',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize:15.0,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff044b04),
                                      fontFamily: "Poppins"
                                  ),
                                ),
                              ),





                              Text(
                                '$dowjonesVariacao%',
                                style: const TextStyle(fontSize:15.0,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff950000),
                                    fontFamily: "Poppins"
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const Alta()),
                            );
                            },
                          child: const Text("ALTA DO ↑ DIA"),
                        ),
                      ), SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const Baixa()),
                            );
                          },
                          child: const Text("BAIXA DO ↓ DIA"),
                        ),
                      ),SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            //calcIMC();
                          },
                          child: const Text("TAXA ➲ JUROS"),
                        ),
                      ),
                    ],
                  ),
                ),

              ),
            )
          ],
        ),
      ),
    );
  }
  }
