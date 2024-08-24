import 'package:contact_app/features/contact_info/presentation/widgets/edit_contact/edit_row.dart';
import 'package:flutter/material.dart';

class EditGroup extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final IconData icon;

  const EditGroup({
    super.key,
    required this.controller,
    required this.hint,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: EditRow(
          controller: controller,
          hint: hint,
          icon: icon,
          showDivider: false,
        ),
      ),
    );
  }
}
