//import 'dart:async';

//import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:fantasy_weather_app/Widgets/themes.dart';
import 'package:flutter/material.dart';
//import 'package:carousel_slider/carousel_slider.dart';
//import 'package:flutter/services.dart';
//import 'package:google_fonts/google_fonts.dart';
//import 'package:qr_flutter/qr_flutter.dart';

import 'dart:math';

void main() {
  runApp(const MyApp(title: '',));
}
class MyApp extends StatefulWidget {
  const MyApp({ super.key, required this.title });

  final String title;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isSwitched = false;
  int _counter = 0;
  double _doubleValue = 0.0;
  String _printableValue = '0.0';
  String _preSymbol = '+';

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
      //external factory Random([int? seed]);
      var boolValue = Random().nextBool();
      if(boolValue == true){
        _preSymbol ='+';
      }else{
        _preSymbol ='-';
      }
      _doubleValue = Random().nextDouble() * 6;
      _printableValue = _doubleValue.toStringAsFixed(1);
    });
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context)  => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: isSwitched ? ThemeClass.darkTheme : ThemeClass.lightTheme,
        home:  Scaffold(
          appBar: AppBar(title: const Text('The Ultimate Switch'), actions: [
           Switch(
             activeColor: Colors.greenAccent,
             value: isSwitched,
             onChanged: (value){
                setState((){
                  isSwitched = !isSwitched;
                });
             })
        ]),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const Text(
                'The Current Temperature is '
            ),
            Text(
              _preSymbol + _printableValue,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const Text(
                '° C'
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    ),
  );
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//   double _doubleValue = 0.0;
//   String _printableValue = '0.0';
//   String _preSymbol = '+';
//
//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//       //external factory Random([int? seed]);
//       var boolValue = Random().nextBool();
//       if(boolValue == true){
//         _preSymbol ='+';
//       }else{
//         _preSymbol ='-';
//       }
//       _doubleValue = Random().nextDouble() * 6;
//       _printableValue = _doubleValue.toStringAsFixed(1);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//             const Text(
//               'The Current Temperature is '
//             ),
//             Text(
//               _preSymbol + _printableValue,
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//             const Text(
//               '° C'
//             )
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
