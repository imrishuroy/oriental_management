import 'package:flutter/material.dart';

Container greetingWidget() {
  return Container(
    child: Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(15.0, 95.0, 0.0, 0.0),
          child: Text(
            'Hello',
            style: TextStyle(
              fontSize: 80.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(17.0, 175.0, 0.0, 0.0),
          child: Text(
            'There',
            style: TextStyle(
              fontSize: 80.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(230.0, 203.0, 0.0, 0.0),
          child: Text(
            ' !',
            style: TextStyle(
              fontSize: 50.0,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
        )
      ],
    ),
  );
}
