import 'package:flutter/material.dart';
void main(){
    runApp(MainView());
}

class MainView extends StatefulWidget{

  @override
  State<MainView> createState() => _MainView();
}

class _MainView extends State<MainView>{

  @override
  Widget build(BuildContext context){
    return MaterialApp(home: InfoPage());
  }
}

class InfoPage extends StatelessWidget{

  @override
  Widget build(BuildContext context){ 
    return Scaffold(
      body: Center(child: Column(
        children: [
          Image.asset('assets/image2.png'),
          Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque blandit viverra ligula et dignissim.'),
          Text('aecenas sollicitudin lectus turpis. Praesent eget ligula a urna pellentesque varius.'),
          TextButton(child: Text('Masuk')),
        ],
      ))
    );
  }
}