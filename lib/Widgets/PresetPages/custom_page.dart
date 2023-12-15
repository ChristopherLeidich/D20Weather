import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:palette_generator/palette_generator.dart';

import '../drawer_widget.dart';

class ItemDetails extends StatefulWidget{


  ItemDetails(this.itemId, {super.key}) {
    final reference =
    FirebaseFirestore.instance.collection('custom_page_data').doc(itemId);
    _futureData = reference.get();

  }
  late final Future<DocumentSnapshot> _futureData;
  final String itemId;

  @override
  State<ItemDetails> createState() => _ItemdetailState();
}

class _ItemdetailState extends State<ItemDetails> {


  late final String itemId;
  late final DocumentReference reference;

  late final Map data;

  late final List<PaletteColor> colors;
  final List<Color> invertedColors = [];

  Color getInvertedColor(Color color) {
    return Color.fromARGB(
      color.alpha,
      255 - color.red,
      255 - color.green,
      255 - color.blue,
    );
  }



  @override
  void initState(){
    super.initState();
    colors = [];
    _updatePalettes();
  }

  _updatePalettes() async{
      final PaletteGenerator generator =
      await PaletteGenerator.fromImageProvider(
          NetworkImage(data['ImageURL']),
          size: const Size(200, 100)
      );
      colors.add(generator.lightMutedColor != null    //0
          ? generator.lightMutedColor!
          : PaletteColor(Colors.blue, 2));

      colors.add(generator.darkMutedColor != null     //1
          ? generator.darkMutedColor!
          : PaletteColor(Colors.blue, 2));

      colors.add(generator.darkVibrantColor != null   //2
          ? generator.darkVibrantColor!
          : PaletteColor(Colors.blue, 2));

      colors.add(generator.lightVibrantColor != null   //3
          ? generator.lightVibrantColor!
          : PaletteColor(Colors.blue, 2));

      colors.add(generator.dominantColor != null      //4
          ? generator.dominantColor!
          : PaletteColor(Colors.blue, 2));

      colors.add(generator.vibrantColor != null       //5
          ? generator.vibrantColor!
          : PaletteColor(Colors.blue, 2));

      for (PaletteColor paletteColor in colors) {
        Color invertedColor = getInvertedColor(paletteColor.color);
        invertedColors.add(invertedColor);
      }

      setState(() {});
  }



  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: widget._futureData,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('An error occurred ${snapshot.error}'));
        }

        if (snapshot.hasData) {
          //Get the data
          DocumentSnapshot documentSnapshot = snapshot.data;
          data = documentSnapshot.data() as Map;

          //display the data
          return Scaffold(
            appBar: AppBar(
              toolbarHeight: 36,
              flexibleSpace: Container(
                decoration:  BoxDecoration(
                  gradient:  LinearGradient(
                    colors: [
                      colors[4].color,
                      colors[5].color,
                      colors[0].color
                    ], // Your gradient colors
                  ),
                ),
              ),
              title: Align(
                alignment: Alignment.centerRight,
                child: Text('${data['title']}',
                  style: TextStyle(
                    color: invertedColors[3]
                  ),
                ),
              ),
              leading: Builder(
                builder: (context) =>
                    IconButton(
                      icon: const Icon(
                        Icons.list_outlined, color: Colors.grey,),
                      onPressed: () => Scaffold.of(context).openDrawer(),
                    ),
              ),
            ),
            drawer: const MyDrawer(),
            body: Column(
              children: [
                Image.asset('${data['Region Images']}',
                    height: MediaQuery.of(context).size.height / 4,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fill),
                Text('${data['region_name']}'),
                Text('${data['region_description']}'),
                Text('${data['region_effekt']}'),
              ],
            ),
          );
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}