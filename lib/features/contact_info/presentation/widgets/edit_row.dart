import 'package:contact_app/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';

class EditRow extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final IconData icon;
  final bool showDivider;
  final bool useTextInputActionDone;

  const EditRow({
    super.key,
    required this.controller,
    required this.hint,
    required this.icon,
    this.showDivider = true,
    this.useTextInputActionDone = false,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppContextColors.editRow,
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
          if (showDivider)
            const Padding(
              padding: EdgeInsets.only(
                left: 80.0,
                right: 20.0,
              ),
              child: Divider(
                height: 0,
                indent: 0,
                thickness: 1,
              ),
            ),
        ],
      ),
    );
  }
}
