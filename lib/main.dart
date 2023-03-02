import 'package:flutter/material.dart';

void main() {
  runApp(MainView());
}

class MainView extends StatefulWidget {
  @override
  State<MainView> createState() => _MainView();
}

class _MainView extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: InfoPage());
  }
}

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
                const Text('Mudah dalam bertransaksi, dengan Jumot',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                const Text(
                    'Beli kendaraan sesuai minatmu dan dengan harga negosiasi terbaik',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16)),
                ElevatedButton(
                    onPressed: () => {},
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    child: Text('Masuk')),
                OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => RegisterPage()));
                    },
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      side: const BorderSide(width: 2.0, color: Colors.blue),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    child: const Text('Mendaftar'))
              ],
            )));
  }
}

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
          child: const Text('back'))
    ]));
  }
}
