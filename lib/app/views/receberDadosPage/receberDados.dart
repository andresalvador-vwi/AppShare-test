import 'package:flutter/material.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';
import 'package:testeapp/app/util/models/message_model.dart';
import 'package:testeapp/app/views/detalhePage/detalhe.dart';
import 'package:testeapp/app/views/homePage/widgets/cardMessage.dart';
import 'package:testeapp/app/views/receberDadosPage/widgets/cardMessageDados.dart';

class ReceberDados extends StatefulWidget {
  final List<SharedMediaFile> midia;
  ReceberDados(this.midia);
  @override
  _ReceberDadosState createState() => _ReceberDadosState();
}

class _ReceberDadosState extends State<ReceberDados> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Center(
                  child: Text(
                    'Escolha para quem deseja enviar esse arquivo',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white
                    ),
                  )
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: ListView.builder(
                itemCount: chats.length,
                itemBuilder: (BuildContext context, int index) {
                  final Message chat = chats[index];
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_)=>DetalhesPage(chat,midia: widget.midia,))
                      );
                    },
                    child: CardMessageDados(chat: chat));
                },
              ),
            ),

          ],
        )
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Arquivos(${widget.midia.length})'),
        onPressed: null,
      ),
    );
  }
}