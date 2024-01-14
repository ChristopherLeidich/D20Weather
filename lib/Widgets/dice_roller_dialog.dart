import 'package:flutter/material.dart';
import 'package:fantasy_weather_app/Widgets/Models/lists.dart';

class DiceRollDialog extends StatefulWidget {
  const DiceRollDialog({super.key});

  @override
  State<DiceRollDialog> createState() => _DiceRollDialogState();
}

class _DiceRollDialogState extends State<DiceRollDialog> {
  final RegExp dicePattern = RegExp(r'^\b(\d+d\d+\s?(\+\s?\d+)?)\b$');
  final TextEditingController diceController = TextEditingController();
  late String diceResult = '';

  @override
  void dispose() {
    diceController.dispose();
    super.dispose();
  }

  Future<String> diceRollResult(String text) async {
    // Assuming roller is defined somewhere, you might need to adjust this part
    return roller.roll(text).toString();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(
              controller: diceController,
              maxLength: 8,
              decoration: const InputDecoration(
                  labelText: 'Dice Roller', hintText: 'Example: 1d20+1\n'),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a correct dice expression.';
                }

                Match? singleMatch = dicePattern.firstMatch(value);
                if (singleMatch == null || singleMatch[0] != value) {
                  return 'Enter a correct dice expression';
                }
                return null;
              },
            ),
            SizedBox(height: 20.0, child: Text('Result: $diceResult')),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () async {
            String tempResult = await diceRollResult(diceController.text);
            setState(() {
              diceResult = tempResult;
            });
          },
          child: const Text('ROLL'),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('CLOSE'),
        ),
      ],
    );
  }
}
