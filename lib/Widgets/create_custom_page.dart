import 'package:flutter/material.dart';

class CreateCustomPage extends StatefulWidget {
  final String pageName;
  final String title;
  final String description;

  const CreateCustomPage({super.key, required this.title, required this.description, required this.pageName});

  @override
  State<CreateCustomPage> createState() => _CreateCustomPageState();
}

class _CreateCustomPageState extends State<CreateCustomPage> {
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
            Text(widget.description),
            TextFormField(
              initialValue: widget.pageName,
              decoration: const InputDecoration(labelText: 'PageName'),
              onChanged: (value) {
                // Handle title changes
              },
            ),
            TextFormField(
              initialValue: widget.title,
              decoration: const InputDecoration(labelText: 'Title'),
              onChanged: (value) {
                // Handle title changes
              },
            ),
            TextFormField(
              initialValue: widget.description,
              decoration: const InputDecoration(labelText: 'Description'),
              onChanged: (value) {
                // Handle description changes
              },
            ),
            // Your form widgets go here
          ],
        ),
      ),
    );
  }
}