// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutterimageapp/src/ProdyServ.dart';
import 'package:flutterimageapp/src/contactos.dart';
import 'package:flutterimageapp/src/descripcion.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

// import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

void _showOverlay(BuildContext context) {
  Navigator.of(context).push(Producto());
}

void _showOverlaydesc(BuildContext context) {
  Navigator.of(context).push(Descripcion());
}

void _showOverlaycontact(BuildContext context) {
  Navigator.of(context).push(Contactos());
}

class _ProfilePageState extends State<ProfilePage> {
  File _image;
  File _imag;
  final picker = ImagePicker();
  final picker2 = ImagePicker();

  @override
  Widget build(BuildContext context) {
    Future getImageFromcameraheader() async {
      final pickedImage = await picker.getImage(source: ImageSource.gallery);

      setState(() {
        if (pickedImage != null) {
          _image = File(pickedImage.path);
        } else {
          print("No Image Selected");
        }
      });
    }

    Future getImageFromcameraperfil() async {
      final pickedImage2 = await picker2.getImage(source: ImageSource.gallery);

      setState(() {
        if (pickedImage2 != null) {
          _imag = File(pickedImage2.path);
        } else {
          print("No Image Selected");
        }
      });
    }

    return Scaffold(
      body: Stack(
        children: <Widget>[
          SizedBox.expand(
            child: (_imag != null)
                ? Image.file(_imag, fit: BoxFit.fill)
                : Image.asset(
                    'assets/img/teclado.jpg',
                    fit: BoxFit.cover,
                  ),
          ),
          Align(
            alignment: Alignment.center,
            child: IconButton(
              color: Colors.white.withOpacity(0.2),
              icon: Icon(
                FontAwesomeIcons.camera,
                size: 30,
              ),
              onPressed: () {
                getImageFromcameraperfil();
              },
            ),
          ),
          DraggableScrollableSheet(
            minChildSize: 0.35,
            initialChildSize: 0.40,
            builder: (context, scrollController) {
              return SingleChildScrollView(
                controller: scrollController,
                child: Container(
                  constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SizedBox(
                              height: 120,
                              width: 120,
                              child: ClipOval(
                                child: (_image != null)
                                    ? Image.file(_image, fit: BoxFit.fill)
                                    : Image.asset(
                                        'assets/img/user2.jpg',
                                        fit: BoxFit.cover,
                                      ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Carlos Rivera Perez',
                                    style: TextStyle(
                                        color: Colors.grey[800],
                                        fontFamily: 'Roboto',
                                        fontSize: 30,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    'Frontend Developer',
                                    style: TextStyle(
                                        color: Colors.grey[500],
                                        fontFamily: 'Roboto',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    'Santiago Queretaro',
                                    style: TextStyle(
                                        color: Colors.grey[500],
                                        fontFamily: 'Roboto',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              color: Color(0xff43537e),
                              icon: Icon(
                                Icons.sms,
                                size: 40,
                              ),
                              onPressed: () =>
                                  _showOverlaycontact(this.context),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 60),
                        child: IconButton(
                          color: Color(0xff43537e),
                          icon: Icon(
                            FontAwesomeIcons.camera,
                            size: 30,
                          ),
                          onPressed: () {
                            getImageFromcameraheader();
                          },
                        ),
                      ),

                      //Performace bar
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: _crearAcercade(),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: _crearProducto(),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: _crearReputacion(),
                      ),
                      _crearTextComentarios(),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: _crearContenComentarios(),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _crearAcercade() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: <Widget>[
          Divider(
            thickness: 1,
            indent: 0,
            endIndent: 0,
            color: Colors.grey,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Acerca de...',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.topRight,
                  child: FlatButton(
                    onPressed: () => _showOverlaydesc(this.context),
                    child: new Text(
                      'Editar descripcion',
                      style: TextStyle(fontSize: 13, color: Colors.blue[900]),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Divider(
            thickness: 0,
            indent: 10,
            endIndent: 10,
            color: Colors.grey[850],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Descripcion: Desarrollador con experiencia en negocios ',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          Divider(
            height: 25,
            thickness: 1.5,
            indent: 0,
            endIndent: 0,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget _crearProducto() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: <Widget>[
          Divider(
            thickness: 1,
            indent: 0,
            endIndent: 0,
            color: Colors.grey,
          ),
          Row(
            children: <Widget>[
              Divider(
                thickness: 1.5,
                indent: 0,
                endIndent: 0,
                color: Colors.grey,
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Productos o Servicios',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.topRight,
                  child: FlatButton(
                    onPressed: () => _showOverlay(this.context),
                    child: new Text(
                      'Editar Seccion',
                      style: TextStyle(fontSize: 13, color: Colors.blue[900]),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Divider(
            thickness: 1,
            indent: 10,
            endIndent: 10,
            color: Colors.grey,
          ),
          Divider(
            height: 10,
            thickness: 1.5,
            indent: 0,
            endIndent: 0,
            color: Colors.white,
          ),
          Image.network(
            'https://datademia.es/wp-content/uploads/2020/03/que-es-python1-1024x576.png',
            height: 95,
            width: 180,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              'Servicio: Curso Python',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              'Descripcion: Curso Python',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ),
          Divider(
            thickness: 0,
            indent: 40,
            endIndent: 40,
            color: Colors.grey,
          ),
          Image.network(
            'https://classes.engineering.wustl.edu/cse231/core/images/2/26/Java.png',
            height: 70,
            width: 80,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              'Servicio: Curso Java',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              'Descripcion: Curso Java',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _crearReputacion() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: <Widget>[
          Divider(
            thickness: 1.5,
            indent: 0,
            endIndent: 0,
            color: Colors.grey,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Reputacion',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Divider(
            thickness: 1,
            indent: 10,
            endIndent: 10,
            color: Colors.grey,
          ),
          Divider(
            height: 25,
            thickness: 1.5,
            indent: 0,
            endIndent: 0,
            color: Colors.white,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              '3.0',
              style: TextStyle(
                fontSize: 27,
                color: Colors.black,
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.star,
                color: Colors.yellow,
                size: 35.0,
              ),
              Icon(
                Icons.star,
                color: Colors.yellow,
                size: 35.0,
              ),
              Icon(
                Icons.star,
                color: Colors.yellow,
                size: 35.0,
              ),
              Icon(
                Icons.star,
                color: Colors.black,
                size: 35.0,
              ),
              Icon(
                Icons.star,
                color: Colors.black,
                size: 35.0,
              ),
            ],
          ),
          Align(
            alignment: Alignment.center,
            child: FlatButton(
              onPressed: () {},
              child: new Text(
                'Numero de Evaluaciones 3',
                style: TextStyle(fontSize: 14.5, color: Colors.blue[900]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _crearTextComentarios() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: <Widget>[
          Divider(
            thickness: 1.5,
            indent: 0,
            endIndent: 0,
            color: Colors.grey,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Comentarios',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Divider(
            thickness: 1,
            indent: 10,
            endIndent: 10,
            color: Colors.grey,
          ),
          Divider(
            height: 25,
            thickness: 1.5,
            indent: 0,
            endIndent: 0,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget _crearContenComentarios() {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        width: 500,
        height: 250,
        child: Container(
          child: Center(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 120, right: 0, top: 0),
                      child: Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 28.0,
                      ),
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 28.0,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 28.0,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.black,
                      size: 28.0,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.black,
                      size: 28.0,
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Prueba',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                ),
                Divider(
                  thickness: 0,
                  indent: 10,
                  endIndent: 5,
                  color: Colors.grey,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 120, right: 0, top: 0),
                      child: Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 28.0,
                      ),
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 28.0,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 28.0,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.black,
                      size: 28.0,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.black,
                      size: 28.0,
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Regular',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                ),
                Divider(
                  thickness: 0,
                  indent: 10,
                  endIndent: 5,
                  color: Colors.grey,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 120, right: 0, top: 0),
                      child: Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 28.0,
                      ),
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 28.0,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 28.0,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.black,
                      size: 28.0,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.black,
                      size: 28.0,
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Simple',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                ),
                Divider(
                  height: 15,
                  thickness: 1.5,
                  indent: 0,
                  endIndent: 0,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
