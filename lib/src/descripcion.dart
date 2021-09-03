import 'package:flutter/material.dart';

class Descripcion extends ModalRoute<void> {
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

  @override
  Widget buildPage(
    BuildContext contextd,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return Material(
      type: MaterialType.transparency,
      child: SafeArea(
        child: _buildOverlayContent(contextd),
      ),
    );
  }

  Widget _buildOverlayContent(BuildContext contextd) {
    return SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
            child: Center(
                child:
                    Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                    icon: Icon(
                      Icons.cancel,
                      color: Colors.white,
                      size: 26.0,
                    ),
                    onPressed: () => Navigator.pop(contextd),
                  )),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                child: _creardesc(),
              ),
              _llenardesc(),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 300.0,
                    child: RaisedButton(
                        color: Color(0xff43537e),
                        textColor: Colors.white,
                        child: Text(
                          "Actualizar descripción",
                          style: TextStyle(fontSize: 17.0),
                        ),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            showDialog<String>(
                              context: contextd,
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
                                            '¿Esta seguro de actualizar informacion de la descripción?',
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
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      5, 0, 5, 0),
                                              child: Text(
                                                'Aceptar',
                                                style: TextStyle(
                                                  fontSize: 16.0,
                                                ),
                                              ),
                                              onPressed: () =>
                                                  showDialog<String>(
                                                context: contextd,
                                                builder:
                                                    (BuildContext context) =>
                                                        AlertDialog(
                                                  content:
                                                      SingleChildScrollView(
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
                                                                color: Colors
                                                                    .black,
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
                                                                    80,
                                                                    0,
                                                                    80,
                                                                    0),
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
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      16.0,
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
                                        )
                                      ],
                                    )
                                  ]),
                            );
                          }
                        }),
                  ),
                ),
              ),
            ]))));
  }

  Widget _creardesc() {
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
                "Descripción",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ],
        )));
  }

  Widget _llenardesc() {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
        child: Column(
          children: <Widget>[
            Form(
              key: _formKey,
              child: TextFormField(
                decoration:
                    InputDecoration(labelText: 'Pon tu descripción aquí: '),
                maxLines: 10,
                // ignore: missing_return
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Por favor inserte una descripción';
                  }
                },
              ),
            ),
          ],
        ));
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
