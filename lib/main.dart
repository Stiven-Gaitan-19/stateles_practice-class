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
    return MaterialApp(
      initialRoute: '/', 
      routes: {
        '/': (context) => InfoPage(),
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage()
      }
    );
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
                    onPressed: () => {
                          Navigator.pushNamed(context, '/login')
                        },
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    child: Text('Masuk')),
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
                    child: const Text('Mendaftar'))
              ],
            )));
  }
}

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool passenable = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                margin: const EdgeInsets.only(
                    left: 30, right: 30, top: 90, bottom: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset('assets/image1.png'),
                    TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            hintText: 'Nama Lengkap')),
                    const SizedBox(height: 20),
                    TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            hintText: 'Email')),
                    const SizedBox(height: 20),
                    TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            hintText: 'Nomor HP')),
                    const SizedBox(height: 20),
                    TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: 'Password',
                        )),
                    const SizedBox(height: 20),
                    TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            hintText: 'Konfirmasi Password')),
                    const SizedBox(height: 20),
                    ElevatedButton(
                        onPressed: () => {
                            Navigator.pushNamed(context, '/login')
                        },
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size.fromHeight(50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        child: Text('Mendaftar')),
                    const SizedBox(height: 30),
                    const Row(children: [
                      Expanded(child: Divider(color: Colors.grey, height: 40)),
                      Text('Atau daftar menggunakan',
                          style: TextStyle(color: Colors.grey)),
                      Expanded(child: Divider(color: Colors.grey, height: 40)),
                    ]),
                    const SizedBox(height: 30),
                    OutlinedButton.icon(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                        side: const BorderSide(width: 2.0, color: Colors.red),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      label: const Text('Google',
                          style: TextStyle(color: Colors.red)),
                      icon: Image.asset('assets/google icon 1.png', scale: 1.2),
                    ),
                    const SizedBox(height: 20),
                    OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size.fromHeight(50),
                          side:
                              const BorderSide(width: 2.0, color: Colors.blue),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        onPressed: () {},
                        icon: Image.asset('assets/Vector.png', scale: 1.2),
                        label: const Text('Facebook')),
                    const SizedBox(height: 30),
                    const Text.rich(TextSpan(children: [
                      TextSpan(
                          text: 'Sudah punya akun? ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                        text: 'silahkan masuk',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue),
                      )
                    ])),
                  ],
                ))));
  }
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                margin: const EdgeInsets.only(
                    left: 30, right: 30, top: 90, bottom: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset('assets/image3.png'),
                    TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            hintText: 'Email')),
                    const SizedBox(height: 20),
                    TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: 'Password',
                        )),
                    const SizedBox(height: 20),
                    ElevatedButton(
                        onPressed: () => {
                            Navigator.pushNamed(context, '/register')
                        },
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size.fromHeight(50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        child: Text('Masuk')),
                    const SizedBox(height: 30),
                    const Row(children: [
                      Expanded(child: Divider(color: Colors.grey, height: 40)),
                      Text('Atau daftar menggunakan',
                          style: TextStyle(color: Colors.grey)),
                      Expanded(child: Divider(color: Colors.grey, height: 40)),
                    ]),
                    const SizedBox(height: 30),
                    OutlinedButton.icon(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                        side: const BorderSide(width: 2.0, color: Colors.red),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      label: const Text('Google',
                          style: TextStyle(color: Colors.red)),
                      icon: Image.asset('assets/google icon 1.png', scale: 1.2),
                    ),
                    const SizedBox(height: 20),
                    OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size.fromHeight(50),
                          side:
                              const BorderSide(width: 2.0, color: Colors.blue),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        onPressed: () {},
                        icon: Image.asset('assets/Vector.png', scale: 1.2),
                        label: const Text('Facebook')),
                    const SizedBox(height: 30),
                    const Text.rich(TextSpan(children: [
                      TextSpan(text: 'Belum punya akun? '),
                      TextSpan(
                        text: 'Medaftar ',
                        style: TextStyle(color: Colors.blue),
                      ),
                      TextSpan(
                        text: 'sekranag',
                      )
                    ])),
                  ],
                ))));
  }
}
