import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class Producto extends ModalRoute<void> {
  @override
  Duration get transitionDuration => Duration(milliseconds: 500);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor => Colors.black.withOpacity(0.5);

  @override
  String get barrierLabel =>
      null; //PENDIENTE-------------------------------------

  @override
  bool get maintainState => true;

  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();

  final _formKey4 = GlobalKey<FormState>();
  final _formKey5 = GlobalKey<FormState>();
  final _formKey6 = GlobalKey<FormState>();

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return Material(
      type: MaterialType.transparency,
      child: SafeArea(
        child: _buildOverlayContent(context),
      ),
    );
  }

  Widget _buildOverlayContent(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                  icon: Icon(Icons.cancel, color: Colors.white, size: 26.0),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                child: _crearProoSer(),
              ),
              _crearImagen(),
              _crearImag(),
              _crearInfo(),
              Container(
                color: Colors.white,
                child: Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 300.0,
                    child: RaisedButton(
                        color: Color(0xff43537e),
                        textColor: Colors.white,
                        child: Text(
                          'Actualizar Informacion',
                          style: TextStyle(
                            fontSize: 17.0,
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState.validate() &&
                              _formKey2.currentState.validate() &&
                              _formKey3.currentState.validate()) {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                content: SingleChildScrollView(
                                  child: ListBody(
                                    children: <Widget>[
                                      Image.asset(
                                        'assets/img/duda.png',
                                        height: 130,
                                        width: 500,
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          '¿Esta seguro de actualizar informacion del producto o servicio?',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 17),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                actions: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              8, 0, 8, 0),
                                          // ignore: deprecated_member_use
                                          child: RaisedButton(
                                            color: Color(0xff43537e),
                                            textColor: Colors.white,
                                            padding: const EdgeInsets.fromLTRB(
                                                5, 0, 5, 0),
                                            child: Text(
                                              'Aceptar',
                                              style: TextStyle(
                                                fontSize: 16.0,
                                              ),
                                            ),
                                            onPressed: () => showDialog<String>(
                                              context: context,
                                              builder: (BuildContext context) =>
                                                  AlertDialog(
                                                content: SingleChildScrollView(
                                                  child: ListBody(
                                                    children: <Widget>[
                                                      Image.asset(
                                                        'assets/img/aceptado.png',
                                                        height: 130,
                                                        width: 500,
                                                      ),
                                                      Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text(
                                                          '¡Actualizado con Exito!',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 22),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                actions: <Widget>[
                                                  Row(
                                                    children: <Widget>[
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .fromLTRB(
                                                                  80, 0, 80, 0),
                                                          // ignore: deprecated_member_use
                                                          child: RaisedButton(
                                                            color: Color(
                                                                0xff43537e),
                                                            textColor:
                                                                Colors.white,
                                                            padding:
                                                                const EdgeInsets
                                                                        .fromLTRB(
                                                                    50,
                                                                    0,
                                                                    50,
                                                                    0),
                                                            child: Text(
                                                              'OK',
                                                              style: TextStyle(
                                                                fontSize: 16.0,
                                                              ),
                                                            ),
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pushNamed(
                                                                      'registro');
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 0, 0, 0),
                                          // ignore: deprecated_member_use
                                          child: RaisedButton(
                                            color: Colors.red,
                                            textColor: Colors.white,
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 0, 0, 0),
                                            child: Text(
                                              'Cancelar',
                                              style: TextStyle(
                                                fontSize: 16.0,
                                              ),
                                            ),
                                            onPressed: () =>
                                                Navigator.pop(context),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          }
                          return 'Llena los datos porfavor';
                        }),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 05),
                child: _crearProoSer2(),
              ),
              _crearImagen2(),
              _crearImag2(),
              _crearInfo2(),
              Container(
                color: Colors.white,
                child: Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 300.0,
                    child: RaisedButton(
                        color: Color(0xff43537e),
                        textColor: Colors.white,
                        child: Text(
                          'Actuializar Informacion',
                          style: TextStyle(
                            fontSize: 17.0,
                          ),
                        ),
                        onPressed: () {
                          if (_formKey4.currentState.validate() &&
                              _formKey5.currentState.validate() &&
                              _formKey6.currentState.validate()) {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                content: SingleChildScrollView(
                                  child: ListBody(
                                    children: <Widget>[
                                      Image.asset(
                                        'assets/img/duda.png',
                                        height: 130,
                                        width: 500,
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          '¿Esta seguro de actualizar informacion del producto o servicio?',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 17),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                actions: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              8, 0, 8, 0),
                                          // ignore: deprecated_member_use
                                          child: RaisedButton(
                                            color: Color(0xff43537e),
                                            textColor: Colors.white,
                                            padding: const EdgeInsets.fromLTRB(
                                                5, 0, 5, 0),
                                            child: Text(
                                              'Aceptar',
                                              style: TextStyle(
                                                fontSize: 16.0,
                                              ),
                                            ),
                                            onPressed: () => showDialog<String>(
                                              context: context,
                                              builder: (BuildContext context) =>
                                                  AlertDialog(
                                                content: SingleChildScrollView(
                                                  child: ListBody(
                                                    children: <Widget>[
                                                      Image.asset(
                                                        'assets/img/aceptado.png',
                                                        height: 130,
                                                        width: 500,
                                                      ),
                                                      Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text(
                                                          '¡Actualizado con Exito!',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 22),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                actions: <Widget>[
                                                  Row(
                                                    children: <Widget>[
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .fromLTRB(
                                                                  80, 0, 80, 0),
                                                          // ignore: deprecated_member_use
                                                          child: RaisedButton(
                                                            color: Color(
                                                                0xff43537e),
                                                            textColor:
                                                                Colors.white,
                                                            padding:
                                                                const EdgeInsets
                                                                        .fromLTRB(
                                                                    50,
                                                                    0,
                                                                    50,
                                                                    0),
                                                            child: Text(
                                                              'OK',
                                                              style: TextStyle(
                                                                fontSize: 16.0,
                                                              ),
                                                            ),
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pushNamed(
                                                                      'registro');
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 0, 0, 0),
                                          // ignore: deprecated_member_use
                                          child: RaisedButton(
                                            color: Colors.red,
                                            textColor: Colors.white,
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 0, 0, 0),
                                            child: Text(
                                              'Cancelar',
                                              style: TextStyle(
                                                fontSize: 16.0,
                                              ),
                                            ),
                                            onPressed: () =>
                                                Navigator.pop(context),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          }
                        }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _crearProoSer() {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Color(0xff5880aa), Color(0xff43537e)]),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Center(
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Text(
                'Producto o Servicio',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ignore: avoid_init_to_null
  PlatformFile objFile =
      null; //PENDIENTE----------------------------------------------------------------
  void chooseFileUsingFilePicker() async {
    //-----pick file by file picker,
    var result = await FilePicker.platform.pickFiles(
      withReadStream:
          true, // this will return PlatformFile object with read stream
    );
    if (result != null) {
      setState(() {
        objFile = result.files.single;
      });
    }
  }

  Widget _crearImagen() {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  width: 320,
                  height: 153,
                  alignment: Alignment.center,
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Subir Foto',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Divider(
                        thickness: 2,
                        indent: 0,
                        endIndent: 0,
                      ),
                      Expanded(
                        child: Image.network(
                            'https://datademia.es/wp-content/uploads/2020/03/que-es-python1-1024x576.png',
                            height: 400,
                            width: 400),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _crearImag() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  'Archivo Imagen:',
                  style: TextStyle(fontSize: 14),
                ),
              ),
              Expanded(
                child: RaisedButton(
                    child: Text("Seleccionar Archivo"),
                    onPressed: () => chooseFileUsingFilePicker()),
              ),
            ],
          ),
          if (objFile != null)
            Text(
                "Nombre del Archivo: ${objFile.name}"), //PENDIENTE-------------------------------------
        ],
      ),
    );
  }

  Widget _crearInfo() {
    return Container(
      padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Form(
            key: _formKey,
            child: TextFormField(
              decoration: InputDecoration(labelText: 'Producto o Servicio: '),
              // ignore: missing_return
              validator: (value) {
                if (value.isEmpty) {
                  return 'Por favor inserte el nombre del producto o servicio';
                }
              },
            ),
          ),
          Form(
            key: _formKey2,
            child: TextFormField(
              decoration: InputDecoration(labelText: 'Titulo:'),
              // ignore: missing_return
              validator: (value) {
                if (value.isEmpty) {
                  return 'Por favor inserte el titulo del producto o servicio ';
                }
              },
            ),
          ),
          Form(
            key: _formKey3,
            child: TextFormField(
              decoration: InputDecoration(labelText: 'Descripcion:'),
              // ignore: missing_return
              validator: (value) {
                if (value.isEmpty) {
                  return 'Por favor inserte la descripción';
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _crearProoSer2() {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Color(0xff5880aa), Color(0xff43537e)]),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Center(
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Text(
                'Producto o Servicio 2',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _crearImagen2() {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  width: 320,
                  height: 153,
                  alignment: Alignment.center,
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Subir Foto',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Divider(
                        thickness: 2,
                        indent: 0,
                        endIndent: 0,
                      ),
                      Expanded(
                        child: Image.network(
                          'https://classes.engineering.wustl.edu/cse231/core/images/2/26/Java.png',
                          height: 300,
                          width: 300,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _crearImag2() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  'Archivo Imagen:',
                  style: TextStyle(fontSize: 14),
                ),
              ),
              Expanded(
                child: RaisedButton(
                    child: Text("Seleccionar Archivo"),
                    onPressed: () => chooseFileUsingFilePicker()),
              ),
            ],
          ),
          if (objFile != null)
            Text(
                "Nombre del Archivo: ${objFile.name}"), //PENDIENTE-------------------------------------
        ],
      ),
    );
  }

  Widget _crearInfo2() {
    return Container(
      padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Form(
            key: _formKey4,
            child: TextFormField(
              decoration: InputDecoration(labelText: 'Producto o Servicio: '),
              // ignore: missing_return
              validator: (value) {
                if (value.isEmpty) {
                  return 'Por favor inserte el nombre del producto o servicio';
                }
              },
            ),
          ),
          Form(
            key: _formKey5,
            child: TextFormField(
              decoration: InputDecoration(labelText: 'Titulo:'),
              // ignore: missing_return
              validator: (value) {
                if (value.isEmpty) {
                  return 'Por favor inserte el titulo del producto o servicio ';
                }
              },
            ),
          ),
          Form(
            key: _formKey6,
            child: TextFormField(
              decoration: InputDecoration(labelText: 'Descripcion:'),
              // ignore: missing_return
              validator: (value) {
                if (value.isEmpty) {
                  return 'Por favor inserte la descripción';
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(
      opacity: animation,
      child: ScaleTransition(
        scale: animation,
        child: child,
      ),
    );
  }
}
