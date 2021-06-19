import 'package:flutter/material.dart';

class FancyButton extends StatelessWidget {
  final String label;
  final Function onPress;
  final LinearGradient gradient;

  FancyButton(
      {required this.label, required this.onPress, required this.gradient});
  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(color: Colors.white, width: 2.0),
      ),
      padding: const EdgeInsets.all(0.0),
      child: Ink(
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Container(
          width: 120.0,
          height: 50.0,
          alignment: Alignment.center,
          child: Text(
            '$label',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'avenir',
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      onPressed: () {onPress();},
    );
  }
}
