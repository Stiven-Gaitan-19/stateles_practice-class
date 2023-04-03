import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';
import '../models/login.dart';
import '../const/cont.dart';
import '../models/user_response.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final Login _login = Login();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final pokedexProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                margin: const EdgeInsets.only(
                    left: 30, right: 30, top: 90, bottom: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset('assets/image3.png'),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            validator: (value){
                              if(value!.isEmpty){
                                return 'Este campo no puede estar vacio';
                              }
                              
                              if(!REGEX_EMAIL.hasMatch(value)){
                                return 'Debe ingresar un correo valido';
                              }
                            },
                            onChanged: (value) {_login.email = value;},
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              hintText: 'Correo')
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            validator: (value){
                              if(value!.isEmpty){
                                return 'Este campo no puede estar vacio';
                              }

                              if(value.length < 6){
                                return 'La contraseña debe tener al menos 6 caracteres';
                              }
                            },
                            onChanged: (value) {_login.password = value;},
                            obscureText: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              hintText: 'Contraseña',
                            )
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                              onPressed: () async {
                                if(_formKey.currentState!.validate()){
                                  String message = '';
                                  String title = '';
                                  bool logedIn = await pokedexProvider.login(_login);

                                  if(logedIn){
                                    UserResponse? userInfo = await pokedexProvider.getUserInfo();
                                    if(userInfo != null){
                                      message = 'Nombre: ${userInfo.data!.name}\n'+
                                      'Correo: ${userInfo.data!.email}\n'+
                                      'Usuario: ${userInfo.data!.nick}\n'+
                                      'Creado en: ${userInfo.data!.createdAt}\n';
                                    }else{
                                      message = 'No se puedo obtener informacion del usuario';
                                    }
                                    title = 'Información de Usurio';
                                  }else{
                                    title = 'Inicio de Sesión';
                                    message = 'Error en la credenciales';
                                  }

                                  // ignore: use_build_context_synchronously
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) => AlertDialog(
                                      title: Text(title),
                                      content: Text(message),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () => Navigator.pop(context, 'OK'),
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    ),
                                  );
                                }
                              },
                              style: OutlinedButton.styleFrom(
                                minimumSize: const Size.fromHeight(50),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              child: Text('Ingresar')),
                              ]
                            )
                    ),
                    const SizedBox(height: 30),
                    const Row(children: [
                      Expanded(child: Divider(color: Colors.grey, height: 40)),
                      Text('Regístrate usando',
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
                    Text.rich(TextSpan(children: [
                      const TextSpan(text: '¿Aún no tienes una cuenta? '),
                      TextSpan(
                        text: 'Registrate ',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, '/register');
                          },
                      ),
                      const TextSpan(
                        text: 'ahora',
                      )
                    ])),
                  ],
                ))));
  }
}