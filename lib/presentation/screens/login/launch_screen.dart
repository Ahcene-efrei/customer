import 'dart:ui';

import 'package:flutter/material.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(43, 43, 43, 1),
      child: const Center(
        child: Text("JusteCut",
          style: TextStyle(
            color: Colors.amber,
            fontSize: 40
          ),
        ),
      ),
    );
  }
}
