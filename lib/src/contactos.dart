import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Contactos extends ModalRoute<void> {
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
                "Contactar mediante",
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.normal),
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Icon(
                    FontAwesomeIcons.whatsapp,
                    size: 30,
                    color: Color(0xff43537e),
                  ),
                  Icon(
                    FontAwesomeIcons.instagram,
                    color: Color(0xff43537e),
                    size: 30,
                  ),
                  Icon(FontAwesomeIcons.twitter,
                      size: 30, color: Color(0xff43537e))
                ],
              ),
            )
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
