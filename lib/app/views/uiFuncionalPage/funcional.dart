import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<SharedMediaFile> _sharedFiles = [];
  String? _sharedText;

  @override
  void initState() {
    super.initState();

    //Para compartilhar imagens vindas de fora do aplicativo enquanto o aplicativo está minimizado
    ReceiveSharingIntent.getMediaStream().listen((List<SharedMediaFile> value) {
      setState(() {
        _sharedFiles = value;
        print('funcionou imageeem Stream');
      });
    }, onError: (err) {
      print("getIntentDataStream error: $err");
    });

    //Para compartilhar imagens vindas de fora do aplicativo enquanto o aplicativo está fechado
    ReceiveSharingIntent.getInitialMedia().then((List<SharedMediaFile> value) {
      setState(() {
        _sharedFiles = value;
        print('funcionou imageeem');
      });
    });

    //Para compartilhar ou abrir urls/texto vindos de fora do aplicativo enquanto o aplicativo está minimizado
    ReceiveSharingIntent.getTextStream().listen((String value) {
      setState(() {
        _sharedText = value;
        print('Funcionoooooou Streaaam');
      });
    }, onError: (err) {
      print("getLinkStream error: $err");
    });

    //Para compartilhar ou abrir urls/texto vindos de fora do aplicativo enquanto o aplicativo está fechado
    ReceiveSharingIntent.getInitialText().then((String? value) {
      setState(() {
        _sharedText = value;
        print('Funcionoooooooooou');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    const textStyleBold = const TextStyle(fontWeight: FontWeight.bold);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Text("Compatilhar files:", style: textStyleBold),
              Container(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _sharedFiles.length,
                  itemBuilder: (context, index){

                    final List<String> lista = _sharedFiles.map((e) => e.path).toList();
                    return Container(
                      margin: EdgeInsets.all(10),
                      height: 50,
                      width: 100,
                      color: Colors.red,
                      child: Image.file(File(lista[index]),fit: BoxFit.cover,),
                    );
                  },
                ),
              ),
              SizedBox(height: 50),
              Text("Compartilhar urls/text:", style: textStyleBold),
              Text(_sharedText ?? "")
            ],
          ),
        ),
      ),
    );
  }
}