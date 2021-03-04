import 'package:flutter/material.dart';

class LeactureScreeen extends StatelessWidget {
  static String routeName = '/lectues-screeen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Lectures'),
      ),
      body: ListView(
        children: [
          Text('Monday'),
          Expanded(
            child: Row(
              //   scrollDirection: Axis.horizontal,
              children: [Card()],
            ),
          )
        ],
      ),
    );
  }
}
