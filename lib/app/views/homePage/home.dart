import 'package:flutter/material.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';
import 'package:testeapp/app/util/models/message_model.dart';
import 'package:testeapp/app/views/detalhePage/detalhe.dart';
import 'package:testeapp/app/views/homePage/widgets/cardMessage.dart';
import 'package:testeapp/app/views/receberDadosPage/receberDados.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
    void initState() {
      // TODO: implement initState
      super.initState();

      //Para compartilhar imagens vindas de fora do aplicativo enquanto o aplicativo está minimizado
      ReceiveSharingIntent.getMediaStream().listen((List<SharedMediaFile> value) {
        setState(() {
          if(value.isEmpty){
            print('Sem arquivos');
          }else{
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_)=> ReceberDados(value))
            );
          }
        });
      }, onError: (err) {
        print("getIntentDataStream error: $err");
      });

      //Para compartilhar imagens vindas de fora do aplicativo enquanto o aplicativo está fechado
      ReceiveSharingIntent.getInitialMedia().then((List<SharedMediaFile> value) {
        setState(() {
          if(value.isEmpty){
            print('Sem arquivos');
          }else{
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_)=> ReceberDados(value))
            );
          }
        });
      });
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        brightness: Brightness.dark,
        elevation: 8,
        leading: IconButton(
          icon: Icon(Icons.menu),
          color: Colors.white,
          onPressed: () {},
        ),
        title: Text(
          'Inbox',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (BuildContext context, int index) {
          final Message chat = chats[index];
          return InkWell(
            splashColor: Colors.red,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_)=>DetalhesPage(chat))
              );
            },
            child: CardMessage(chat: chat));
        },
      ),
    );
  }
}