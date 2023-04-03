import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/register.dart';
import '../providers/auth.dart';
import '../const/cont.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool passenable = true;
  Register register = Register();

  @override
  Widget build(BuildContext context) {
    final pokedexProvider = Provider.of<AuthProvider>(context);
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                margin: const EdgeInsets.only(
                    left: 30, right: 30, top: 90, bottom: 50),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset('assets/image1.png'),
                      TextFormField(
                        validator: (value) {
                          if(value!.isEmpty){
                            return 'Este campo no puede estar vacio';
                          }
                        },
                        onChanged: (value) => {register.name = value},
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                          ),
                          hintText: 'Nombre'
                        )
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        validator: (value){
                          if(value!.isEmpty){
                            return 'Este campo no puede estar vacio';
                          }
                          
                          if(!REGEX_EMAIL.hasMatch(value)){
                            return 'Debe ingresar un correo valido';
                          }
                        },
                        onChanged: (value) => {register.email = value},
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                          ),
                        hintText: 'Correo')
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        validator: (value) {
                          if(value!.isEmpty){
                            return 'Este campo no puede estar vacio';
                          }
                        },
                        onChanged: (value) => {register.nick = value},
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                          ),
                          hintText: 'Usuario'
                        )
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
                        onChanged: (value) => {register.password = value},
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            hintText: 'Contraseña',
                          )),
                      const SizedBox(height: 20),
                      TextFormField(
                        validator: (value){
                          if(value!.isEmpty){
                            return 'Este campo no puede estar vacio';
                          }

                          if(register.password_confirmation != register.password){
                            return 'Las contraseñas no coinciden';
                          }
                        },
                        onChanged: (value) =>
                            {register.password_confirmation = value},
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                          ),
                          hintText: 'Confirmar Contraseña'
                        )
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                          onPressed: () async {
                            if(_formKey.currentState!.validate()){
                              String message = '';
                              bool created = await pokedexProvider.signUp(register);
                              if(created){
                                message = 'Se ha registrado con exito.';
                              }else{
                                message = 'Error al registrarse.';
                              }
                              // ignore: use_build_context_synchronously
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Registro'),
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
                          child: Text('Registrar')),
                      const SizedBox(height: 30),
                      const Row(children: [
                        Expanded(child: Divider(color: Colors.grey, height: 40)),
                        Text('Registrate usando',
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
                        const TextSpan(
                            text: 'Ya tienes cuenta? ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                          text: 'por favor entra',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.blue),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(context, '/login');
                            },
                        ),
                      ]
                    )),
                  ],
                )))));
  }
}
