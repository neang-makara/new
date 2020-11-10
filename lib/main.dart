import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool chang = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          //Images
          Container(
          child: chang?Image.asset('assets/images/1.Beutiful.jpeg'):Image.asset('assets/images/2.Beutiful.jpeg')
          ),
          //Button
          RaisedButton(
            color: Colors.blue,
              child: Text("Change",style: TextStyle(color: Colors.white,fontSize: 20),),
              onPressed: (){
              setState(() {
                chang =! chang;
                print('$chang');
              });
          }),
          Center(
            child: Text("Hello day jhdhsifs"),
          ),
          RaisedButton(
              color: Colors.blue,
              child: Text("Change",style: TextStyle(color: Colors.white,fontSize: 20),),
              onPressed: (){
                setState(() {
                  chang =! chang;
                  print('$chang');
                });
              }),
        ],
      ),
    );
  }
}

