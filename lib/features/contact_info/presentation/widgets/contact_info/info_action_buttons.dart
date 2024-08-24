import 'package:flutter/material.dart';

class InformationActionButtons extends StatelessWidget {
  final Function() onEditButtonTapped;
  final Function() onDeleteButtonTapped;

  const InformationActionButtons({
    super.key,
    required this.onEditButtonTapped,
    required this.onDeleteButtonTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton.icon(
          onPressed: onEditButtonTapped,
          label: const Text('Edit'),
          icon: const Icon(Icons.edit_outlined),
        ),
        const SizedBox(width: 20.0),
        TextButton.icon(
          onPressed: onDeleteButtonTapped,
          label: const Text('Delete'),
          icon: const Icon(Icons.delete_outlined),
        )
      ],
    );
  }
}
