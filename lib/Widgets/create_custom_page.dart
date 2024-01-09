import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';



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
  final TextEditingController _positiveTemperatureLimit = TextEditingController();
  final TextEditingController _negativeTemperatureLimit = TextEditingController();

  GlobalKey<FormState> key=GlobalKey();

  final CollectionReference _reference = FirebaseFirestore.instance.collection('custom_page_data');

  bool cold = false;
  String imageUrl = '';

  final MaterialStateProperty<Icon?> thumbIcon =
  MaterialStateProperty.resolveWith<Icon?>(
        (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Icon(Icons.check);
      }
      return const Icon(Icons.close);
    },
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pageName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              IconButton(
                onPressed:  () async {
                  ImagePicker imagePicker = ImagePicker();

                          XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);

                          String uniqueFileNameGenerator = DateTime.now().microsecondsSinceEpoch.toString();

                          Reference referenceRoot = FirebaseStorage.instance.ref();
                          Reference referenceDirImage = referenceRoot.child('Region Images');

                          Reference referenceImageToUpload = referenceDirImage.child(uniqueFileNameGenerator);

                          try {
                            await referenceImageToUpload.putFile(File(file!.path));

                            imageUrl = await referenceImageToUpload.getDownloadURL();

                          }catch(error){
                            //
                          }
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
                keyboardType: TextInputType.multiline,
                maxLines: null,
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
                keyboardType: TextInputType.multiline,
                controller: _regioneffectcontroller,
                decoration: const InputDecoration(
                    labelText: 'Region Effect',
                    hintText: 'Enter a Region Effect'
                ),
              ),
              TextFormField(
                controller: _positiveTemperatureLimit,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: 'Positive Temperature Limit',
                    hintText: 'Enter a Positive Temperature Limit in Celsius'
                ),
                validator: (String? value){

                  if(value==null || value.isEmpty)
                  {
                    return 'A Number above 0';
                  }

                  if(value != num as String)
                  {
                    return 'Must be a Number';
                  }

                  return null;
                },
              ),
              Switch(
                thumbIcon: thumbIcon,
                value: cold,
                onChanged: (bool value) {
                  setState(() {
                    cold = value;
                  });
                },
              ),
              Visibility(
                  visible: cold,
                  child: TextFormField(
                    controller: _negativeTemperatureLimit,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        labelText: 'Positive Temperature Limit',
                        hintText: 'Enter a Positive Temperature Limit in Celsius'
                    ),
                    validator: (String? value){
                      if(value != num as String)
                      {
                        return 'Must be a Number';
                      }

                      return null;
                    },
                  ),

              ),
              ElevatedButton(

                  onPressed: () async {
                    if (key.currentState!.validate()) {
                      String itemName = _titlecontroller.text;
                      String regionName = _regioncontroller.text;
                      String regionEffect = _regioneffectcontroller.text;
                      String regionDescription = _regiondescriptioncontroller.text;

                      double positiveTemperatureLimit = 0;
                      double negativeTemperatureLimit = 0;

                      // Convert positive temperature limit
                      try {
                        if (_positiveTemperatureLimit.text.isNotEmpty) {
                          positiveTemperatureLimit = double.parse(_positiveTemperatureLimit.text);
                        }
                      } catch (e) {
                        // Handle invalid input for positive temperature limit
                        print('Invalid positive temperature limit input: ${_positiveTemperatureLimit.text}');
                        return;
                      }

                      // Convert negative temperature limit if the switch is turned on
                      if (cold) {
                        try {
                          if (_negativeTemperatureLimit.text.isNotEmpty) {
                            negativeTemperatureLimit = double.parse(_negativeTemperatureLimit.text);
                          }
                        } catch (e) {
                          // Handle invalid input for negative temperature limit
                          print('Invalid negative temperature limit input: ${_negativeTemperatureLimit.text}');
                          return;
                        }
                      }

                      bool isCold = cold;
                      String image = imageUrl;

                      // Create a Map of data
                      Map<String, dynamic> dataToSend = {
                        'title': itemName,
                        'region_name': regionName,
                        'region_effect': regionEffect,
                        'region_description': regionDescription,
                        'positive_temperature_limit': positiveTemperatureLimit,
                        'negative_temperature': isCold,
                        'negative_temperature_limit': negativeTemperatureLimit,
                        'ImageURL': image,
                      };

                      // Add a new item
                      _reference.add(dataToSend);
                    }
                  },
                  child: const Text('Create Page'))


              // Your form widgets go here
            ],
          ),
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