import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fantasy_weather_app/Widgets/expandables/randomizer.dart';
import 'package:flutter/material.dart';

class RegionJumpDialog extends StatefulWidget {
  const RegionJumpDialog({super.key});

  @override
  State<RegionJumpDialog> createState() => _RegionJumpDialogState();
}

enum RegionLabel {
  jungle("Jungle", 0),
  glacier("Glacier", 1),
  ocean("Ocean", 2),
  beach("Beach", 3),
  forest("Forest", 4),
  desert("Desert", 5);

  const RegionLabel(this.label, this.regionIndex);
  final String label;
  final int regionIndex;
}

class _RegionJumpDialogState extends State<RegionJumpDialog> {
  final TextEditingController jumpController = TextEditingController();
  late final CarouselController carouselController;
  RegionLabel? selectedRegion;

  @override
  void dispose() {
    jumpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: DropdownMenu<RegionLabel>(
                  initialSelection: RegionLabel.beach,
                  controller: jumpController,
                  requestFocusOnTap: true,
                  label: const Text('Region'),
                  onSelected: (RegionLabel? regionLabel) {
                    setState(() {
                      selectedRegion = regionLabel;
                    });
                  },
                  dropdownMenuEntries: RegionLabel.values
                      .map<DropdownMenuEntry<RegionLabel>>(
                          (RegionLabel region) {
                    return DropdownMenuEntry<RegionLabel>(
                      value: region,
                      label: region.label,
                    );
                  }).toList()),
            ),
            if (selectedRegion != null)
              Text('selected region climate: ${selectedRegion?.label}')
            else
              const Text('Please select a region climate.')
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => [
            Navigator.of(context).setState(
              () {
                randIndex = selectedRegion!.regionIndex;
                randomizeTemp();
              },
            ),
            Navigator.of(context).pop()
          ],
          child: const Text('JUMP'),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('CLOSE'),
        ),
      ],
    );
  }
}
