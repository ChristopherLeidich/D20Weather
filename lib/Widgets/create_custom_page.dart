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
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _regionController = TextEditingController();

  final TextEditingController _regionDescriptionController = TextEditingController();
  final TextEditingController _regionEffectTitleController = TextEditingController();
  final TextEditingController _regionEffectController = TextEditingController();
  final TextEditingController _positiveTemperatureLimit = TextEditingController();
  final TextEditingController _negativeTemperatureLimit = TextEditingController();

  GlobalKey<FormState> key=GlobalKey();

  final CollectionReference _reference = FirebaseFirestore.instance.collection('custom_page_data');

  bool cold = false;
  String imageUrl = 'https://static.thenounproject.com/png/4974686-200.png'; /// Static Default Image that is royalty free

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
                controller: _titleController,
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
                controller: _regionController,
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
                controller: _regionDescriptionController,
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
                maxLines: null,
                controller: _regionEffectTitleController,
                decoration: const InputDecoration(
                    labelText: 'Region Effect Title',
                    hintText: 'Enter a Title for your custom Regional Effect'
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                controller: _regionEffectController,
                decoration: const InputDecoration(
                    labelText: 'Description',
                    hintText: 'Enter a Description for your Regional Effect\nYou may use Dice Roll Notations like "[[1d4]]" etc'
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
                      String itemName = _titleController.text;
                      String regionName = _regionController.text;
                      String regionEffectTitle = _regionEffectTitleController.text;
                      String regionEffect = _regionEffectController.text;
                      String regionDescription = _regionDescriptionController.text;

                      double positiveTemperatureLimit = 0;
                      double negativeTemperatureLimit = 0;

                      // Convert positive temperature limit
                      try {
                        if (_positiveTemperatureLimit.text.isNotEmpty) {
                          positiveTemperatureLimit = double.parse(_positiveTemperatureLimit.text);
                        }
                      } catch (e) {
                        // Handle invalid input for positive temperature limit
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Invalid positive temperature limit input: ${_positiveTemperatureLimit.text}')));
                        }
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
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Invalid positive temperature limit input: ${_negativeTemperatureLimit.text}')));
                          }
                          return;
                        }
                      }

                      bool isCold = cold;
                      String image = imageUrl;

                      // Create a Map of data
                      _reference.add({
                        'title': itemName,
                        'region_name': regionName,
                        'region_effect_name': regionEffectTitle,
                        'region_effect': regionEffect,
                        'region_description': regionDescription,
                        'positive_temperature_limit': positiveTemperatureLimit,
                        'negative_temperature': isCold,
                        'negative_temperature_limit': negativeTemperatureLimit,
                        'ImageURL': image,
                      }).then(
                          (value) => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Upload Successful'))),
                      );
                      // Add a new item
                  },
                  child: const Text('Create Page', style: TextStyle(color: Colors.white),))


              // Your form widgets go here
            ],
          ),
        ),
      ),
    );
  }
}