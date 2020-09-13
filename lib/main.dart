import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';


void main() async => runApp (MaterialApp(
  debugShowCheckedModeBanner: false,
  home:Skin()
)
);



class Skin extends StatefulWidget {
  @override
  _SkinState createState() => _SkinState();
}

class _SkinState extends State<Skin> {

  File image_file;
  Future  get_image(ImageSource source) async{
    var image= await ImagePicker.pickImage(source: source);
    setState(() {
      image_file=image;

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gallery and camera access in flutter',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            fontFamily: 'Raleway',
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[700],
      ),
      body:Center(
        child: image_file == null ? Text("Please select the image",style: TextStyle(fontSize: 25.0),): Image.file(image_file,height: 350.0,width: 350.0),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FloatingActionButton.extended(
            onPressed: (){get_image(ImageSource.camera);} ,
            label: Text('Camera'),
            heroTag: UniqueKey(),
            icon: Icon(Icons.camera),
          ),
          SizedBox(
            width: 20.0,
          ),
          FloatingActionButton.extended(
            onPressed: (){get_image(ImageSource.gallery);} ,
            label: Text('Gallery'),
            heroTag: UniqueKey(),
            icon: Icon(Icons.photo_library),
          ),
        ],
      ),
    );
  }
}








