import 'package:flutter/material.dart';

class TaxiButton extends StatelessWidget {

  final String title;
  final Color color;
  final Function onPressed;

  TaxiButton({this.title, this.onPressed, this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Center(
        child: Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'Brand-Bold'),
        ),
      ),
      style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25)
            ),
          ),
          backgroundColor:
          MaterialStateProperty.resolveWith((states) {
            if(states.contains(MaterialState.pressed))
              return Colors.green;
            return color;
          })),
    );
  }
}