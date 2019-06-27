import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';

class Rico extends StatefulWidget {
  @override
  _RicoState createState() => _RicoState();
}
//classe interna do tipo State, que recebe a Class Rico
class _RicoState extends State<Rico> {

  double _contador = 10;

  void _showDialog()
  {
    showDialog(
          context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: Text("GAME OVER"),
            content: Text("voce perdeu play boy"),
            actions: <Widget>[
        new FlatButton(onPressed: () => exit(0),
            child: Text("Fechar")
               ),
        ],
        );
      },
    );
  }

  void _maisMoney()
  {
    setState(() {
      Random sorteio = new Random();

      int min = 1;
      int max = 10;
      int r = min + sorteio.nextInt(max - min);

      if (r == 1) {
        _contador = _contador * 0;
      }
      else if (r == 2) {
        _contador = _contador / 2;
      }
      else if (r == 3) {
        _contador = _contador + 200;
      }
      else if (r == 4)
        {
        _contador = _contador * 2;
        }
        else if (r == 5)
          {
            _contador = _contador + 10;
          }
          else if (r == 6)
            {
              _contador = _contador + 5;
            }
            else if (r == 7)
              {
                _contador = _contador +25;
              }

              if(_contador <= 0)
                {
                  _showDialog();
                  _contador = 10;
                }


      });
   //_contador += 10;
  }
  @override
  Widget build(BuildContext context) {
    //Cria a tela(ui)
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: Center(child: Text("Rico App",
          style: TextStyle(color: Colors.black),
        )),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            children: <Widget>[
              //titulo do App
          Expanded (
              child: Center (
                child: Text("Venha ficar rico!!!",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                      color: Colors.lightGreen
                  ),
                ),
              ),
          ),
              //Valor em dinhero
              Expanded(
                child: Center(
                  child: Text("R\$ $_contador",
                    style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.w900,
                    color: _contador >= 100 ? Colors.red : Colors.lightGreen


                    ),
                  ),
                ),
              ),
              //Botão de ação
              Expanded(
                child: Center(
                  child: FlatButton(
                      onPressed: _maisMoney,
                      color: Colors.lightGreen,
                      textColor: Colors.black,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text("Mais MoNeY!!!",
                        style: TextStyle(
                          fontSize: 20,

                        ),),
                      ),
                  ),
                ),
              )

            ],
          ),
        ),
      )
    );
  }
}
