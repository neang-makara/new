
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


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
  bool change = false;
  File _image;
  @override
  // Camera
  imgFromCamera() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50
    );
    setState(() {
      _image = image;
    });
  }

  //Gallery
  imgFromGallery() async {
    File image = await  ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50
    );
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Camera and Gallery",
          style: TextStyle(
            color: Colors.white,
          ),

        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          //Images
          Center(
            child:  (_image == null) == (change == false)
                ?  Padding(padding: const EdgeInsets.only(top: 300, bottom: 195), child: Text("Image isn't loaded", style: TextStyle(color: Colors.red, fontSize: 25, fontWeight: FontWeight.bold,),),)
                : Image.file(_image),
          ),

          // Button
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Camera
                RaisedButton(
                    color: Colors.blue,
                    child:
                    Text("Camera",style: TextStyle(color: Colors.white,fontSize: 20),),
                    onPressed: (){
                      setState(() {
                        imgFromCamera();
                      });
                    }),
                //Gallery
                RaisedButton(
                    color: Colors.blue,
                    // child: Text("Gallery",style: TextStyle(color: Colors.white,fontSize: 20),),
                    child:
                        Text("Gallery",style: TextStyle(color: Colors.white,fontSize: 20),),
                    onPressed: (){
                      setState(() {
                        imgFromGallery();
                      });
                    }),
                // OFF / ON
                Center(

                  child: RaisedButton(
                      color: Colors.blue,
                      child: change ? Text("ON",style: TextStyle(color: Colors.white,fontSize: 20),)
                          : Text("OFF",style: TextStyle(color: Colors.white,fontSize: 20),),
                      onPressed: () {
                       setState(() {
                         change =! change;
                         print('$change');
                       });

                      }),
                ),

              ],
            ),
          ),
        ],
      ),


    );
  }
}

