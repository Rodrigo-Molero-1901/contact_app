import 'package:contact_app/features/contact_info/presentation/widgets/edit_row.dart';
import 'package:flutter/material.dart';

class AddressGroup extends StatelessWidget {
  final List<TextEditingController> streetAddrControllers;
  final List<TextEditingController> cityControllers;
  final List<TextEditingController> stateControllers;
  final List<TextEditingController> zipCodeControllers;
  final Function(int) onRemove;

  const AddressGroup({
    super.key,
    required this.streetAddrControllers,
    required this.cityControllers,
    required this.stateControllers,
    required this.zipCodeControllers,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(streetAddrControllers.length, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: EditRow(
                        controller: streetAddrControllers[index],
                        hint: 'Street Address ${index + 1}',
                        icon: Icons.location_on_outlined,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.remove_circle_outline),
                      onPressed: () => onRemove(index),
                    ),
                  ],
                ),
                EditRow(
                  controller: cityControllers[index],
                  hint: 'City',
                  icon: Icons.location_city_outlined,
                ),
                EditRow(
                  controller: stateControllers[index],
                  hint: 'State',
                  icon: Icons.map_outlined,
                ),
                EditRow(
                  controller: zipCodeControllers[index],
                  hint: 'Zip Code',
                  icon: Icons.markunread_mailbox_outlined,
                  showDivider: false,
                  useTextInputActionDone: true,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
