import 'package:flutter/material.dart';


class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            margin:
                const EdgeInsets.only(left: 30, right: 30, top: 90, bottom: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('assets/image2.png'),
                const Text('Fácil en transacción, con viernes',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                const Text(
                    'Compra un vehículo de acuerdo a tus intereses y al mejor precio negociado',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16)),
                ElevatedButton(
                    onPressed: () => {Navigator.pushNamed(context, '/login')},
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    child: Text('Ingresar')),
                OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      side: const BorderSide(width: 2.0, color: Colors.blue),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    child: const Text('Registro'))
              ],
            )));
  }
}