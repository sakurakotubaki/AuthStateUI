import 'package:flutter/material.dart';

class PageA extends StatelessWidget {
  const PageA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hello World',
              style: TextStyle(fontSize: 30),
            )
          ],
        ),
      ),
    );
  }
}
