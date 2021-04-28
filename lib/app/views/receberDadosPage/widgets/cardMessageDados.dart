import 'package:flutter/material.dart';
import 'package:testeapp/app/util/models/message_model.dart';
import 'package:testeapp/app/views/detalhePage/detalhe.dart';

class CardMessageDados extends StatelessWidget {
  final Message chat;
  CardMessageDados({required this.chat});

  @override
  Widget build(BuildContext context) {
          return Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                            ),
                          ],
                        ),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(chat.sender!.imageUrl!),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.65,
                  padding: EdgeInsets.only(
                    left: 20,
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                chat.sender!.name!,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}