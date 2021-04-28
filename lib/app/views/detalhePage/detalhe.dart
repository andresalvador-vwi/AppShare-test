import 'dart:io';

import 'package:flutter/material.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';
import 'package:testeapp/app/util/models/message_model.dart';

class DetalhesPage extends StatefulWidget {
  final Message chat;
  final List<SharedMediaFile>? midia;
  DetalhesPage(this.chat,{this.midia});
  @override
  _DetalhesPageState createState() => _DetalhesPageState();
}

class _DetalhesPageState extends State<DetalhesPage> {
  TextEditingController mensagem = TextEditingController();
  GlobalKey<FormState> validacao = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.chat.sender!.name.toString()),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.keyboard_arrow_left_outlined),
          onPressed: (){
            Navigator.popAndPushNamed(context, '/home');
          }
        ),
      ),

      body: Column(
        children: [
          widget.midia != null 
          ? Expanded(
            child:ListView.builder(
              itemCount: widget.midia!.length,
              itemBuilder: (context, index){

                final List<String> lista = widget.midia!.map((e) => e.path).toList();
                return Container(
                  margin: EdgeInsets.only(left: 100,top: 20,right: 10),
                  height: 250,
                  color: Colors.red,
                  child: Image.file(File(lista[index]),fit: BoxFit.cover,),
                );
              },
            ),
          )
          :
          Expanded(
            child: ListView(
              children: [

              ],
            )
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    controller: mensagem,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      hintText: 'Enviar uma mensagem',
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return "Campo vazio!!";
                      }
                    },
                  )),
                IconButton(
                  icon: Icon(Icons.send),
                    onPressed: (){},
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}