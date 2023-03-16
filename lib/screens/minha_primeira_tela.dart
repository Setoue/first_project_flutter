import 'package:flutter/material.dart';

class MyFirstWidget extends StatelessWidget {
  const MyFirstWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    color: const Color.fromARGB(110, 24, 117, 232),
                    width: 50,
                    height: 50,
                  ),
                  Container(
                    color: Colors.grey,
                    width: 50,
                    height: 50,
                  ),
                  Container(
                    color: Colors.green,
                    width: 50,
                    height: 50,
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                color: Colors.purple,
                width: 50,
                height: 50,
              ),
              Container(
                color: Colors.grey,
                width: 50,
                height: 50,
              ),
              Container(
                color: Colors.green,
                width: 50,
                height: 50,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                color: Colors.purple,
                width: 50,
                height: 50,
              ),
              Container(
                color: Colors.grey,
                width: 50,
                height: 50,
              ),
              Container(
                color: Colors.green,
                width: 50,
                height: 50,
              ),
            ],
          ),
          Container(
            color: Colors.amber,
            height: 30,
            width: 300,
            child: const Text(
              'Shigeru',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // print('Botao apertado');
            },
            child: const Text('Aperte o botao'),
          )
        ],
      ),
    );
  }
}
