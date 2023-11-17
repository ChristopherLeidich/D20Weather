import 'package:flutter/material.dart';
import 'package:starsview/starsview.dart';

class StarsViewBackground extends StatelessWidget {
  const StarsViewBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: <Color>[
                    Colors.black,
                    Colors.indigo,
                    Colors.deepOrangeAccent,
                  ],
                )
            )
        ),
        const StarsView(
          fps: 60,
        )
      ],
    );
  }
}