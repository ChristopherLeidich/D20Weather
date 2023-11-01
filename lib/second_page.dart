import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/your_image.png'), // Replace with your image path
            const SizedBox(height: 20),
            const Text(
              'This is the second page',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}