import 'package:contact_app/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';

class EditRow extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final IconData icon;
  final bool useTextInputActionDone;

  const EditRow({
    super.key,
    required this.controller,
    required this.hint,
    required this.icon,
    this.useTextInputActionDone = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: AppContextColors.infoRow,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              children: [
                const SizedBox(width: 20.0),
                Icon(icon),
                const SizedBox(width: 15.0),
                Expanded(
                  child: TextFormField(
                    controller: controller,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: hint,
                    ),
                    textInputAction: useTextInputActionDone
                        ? TextInputAction.done
                        : TextInputAction.next,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
