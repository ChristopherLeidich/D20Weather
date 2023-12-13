import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:palette_generator/palette_generator.dart';


class CreateCustomPage extends StatefulWidget {
  final String pageName;
  final String title;
  final String description;

  const CreateCustomPage({super.key, required this.title, required this.description, required this.pageName});

  @override
  State<CreateCustomPage> createState() => _CreateCustomPageState();
}

class _CreateCustomPageState extends State<CreateCustomPage> {
  final TextEditingController _titlecontroller = TextEditingController();
  final TextEditingController _regioncontroller = TextEditingController();
  final TextEditingController _regioneffectcontroller = TextEditingController();
  final TextEditingController _regiondescriptioncontroller = TextEditingController();

  GlobalKey<FormState> key=GlobalKey();

  final CollectionReference _reference = FirebaseFirestore.instance.collection('custom_page_data');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pageName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            IconButton(
              onPressed:  () async {
                ImagePicker imagePicker = ImagePicker();
                SimpleDialog(
                  title: const Text('Select Where to get Picture from'),
                  children: <Widget>[
                    SimpleDialogOption(
                      onPressed: () async {
                        XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);

                        String uniqueFileNameGenerator = DateTime.now().microsecondsSinceEpoch.toString();

                        Reference referenceRoot = FirebaseStorage.instance.ref();
                        Reference referenceDirImage = referenceRoot.child('Region Images');

                        Reference referenceImageToUpload = referenceDirImage.child(uniqueFileNameGenerator);

                        /*Future<void> saveDominantColorsToStorage(List<Color> dominantColors) async {
                          final Reference storageRef = FirebaseStorage.instance.ref('dominant_colors');

                          // Convert Color objects to hex strings
                          List<String> colorHexValues =
                          dominantColors.map((color) => color.toString()).toList();

                          // Upload each hex value to Firebase Storage
                          for (int i = 0; i < colorHexValues.length; i++) {
                            await storageRef.child('color_$i').putString(colorHexValues[i]);
                          }
                        }

                        Future<List<Color>> loadDominantColorsFromStorage() async {
                          final Reference storageRef = FirebaseStorage.instance.ref('dominant_colors');

                          List<Color> dominantColors = [];

                          // Download each hex value from Firebase Storage
                          for (int i = 0; i < 3; i++) {
                            final colorHexValue = await storageRef.child('color_$i').putString();

                            // Convert hex value back to Color object
                            dominantColors.add(Color(int.parse(colorHexValue as String, radix: 16)));
                          }

                          return dominantColors;
                        }

                        ImageProvider imageProvider = NetworkImage(file!.path);
                        List<Color> dominantColors = await getAndSaveDominantColors(imageProvider); // Save dominant colors to Firebase Storage
                        await saveDominantColorsToStorage(dominantColors); // Later, retrieve dominant colors from Firebase Storage
                        List<Color> retrievedColors = await loadDominantColorsFromStorage();
*/
                        referenceImageToUpload.putFile(file?.path as File);
                        },
                      child: const Text('Treasury department'),
                    ),
                    SimpleDialogOption(
                      onPressed: () async {
                        XFile? file = await imagePicker.pickImage(source: ImageSource.camera);
                        String uniqueFileNameGenerator = DateTime.now().microsecondsSinceEpoch.toString();

                        Reference referenceRoot = FirebaseStorage.instance.ref();
                        Reference referenceDirImage = referenceRoot.child('Region Images');

                        Reference referenceImageToUpload = referenceDirImage.child(uniqueFileNameGenerator);

                        referenceImageToUpload.putFile(file?.path as File);
                      },
                      child: const Text('State department'),
                    ),
                  ],
                );
            },
            icon: const Icon(Icons.camera_alt)
            ),
            TextFormField(
              controller: _titlecontroller,
              decoration: const InputDecoration(
                  labelText: 'Title',
                  hintText: 'Enter a Title'
              ),
              validator: (String? value){

                if(value==null || value.isEmpty)
                {
                  return 'Please enter the item name';
                }

                return null;
              },

            ),
            TextFormField(
              controller: _regioncontroller,
              decoration: const InputDecoration(
                  labelText: 'Region',
                  hintText: 'Enter a Region Name'
              ),
              validator: (String? value){

                if(value==null || value.isEmpty)
                {
                  return 'Please enter some Text before submitting';
                }

                return null;
              },
            ),
            TextFormField(
              controller: _regioneffectcontroller,
              decoration: const InputDecoration(
                  labelText: 'Region Effect',
                  hintText: 'Enter a Region Effect'
              ),
            ),
            TextFormField(
              controller: _regiondescriptioncontroller,
              decoration: const InputDecoration(
                  labelText: 'Description',
                  hintText: 'Enter a Description for your Region'
              ),
              validator: (String? value){

                if(value==null || value.isEmpty)
                {
                  return 'Please enter some Text before submitting';
                }

                return null;
              },
            ),
            TextFormField(
              controller: _regiondescriptioncontroller,
              decoration: const InputDecoration(
                  labelText: 'Positive Temperature Limit',
                  hintText: 'Enter a Positive Temperature Limit in Celsius'
              ),
              validator: (String? value){

                if(value==null || value.isEmpty)
                {
                  return 'Please enter some Text before submitting';
                }

                return null;
              },
            ),
            ElevatedButton(

                onPressed: () async{

                  if(key.currentState!.validate())
                  {
                    String itemName=_titlecontroller.text;
                    String regionName = _regioncontroller.text;
                    String regionEffect = _regioneffectcontroller.text;
                    String regionDescription=_regiondescriptioncontroller.text;

                    //Create a Map of data
                    Map<String,String> dataToSend={
                      'title':itemName,
                      'region_name': regionName,
                      'region_effekt':regionEffect,
                      'region_description':regionDescription,
                    };

                    //Add a new item
                    _reference.add(dataToSend);
                }
            }, child: const Text('Create Page'))


            // Your form widgets go here
          ],
        ),
      ),
    );
  }
}

/*
description "default_description"
(String)
negative_temperature false
(Boolesch)
negative_temperature_limit 1
(Zahl)
positive_temperature_limit 1
(Zahl)
region_description "default_description"
(String)
region_effekt "default_effect"
(String)
region_name "default_region"
(String)
title "default_name" */