import 'package:flutter/material.dart';

class EditActionButtons extends StatelessWidget {
  final bool enableAcceptButton;
  final Function() onAccept;
  final Function() onCancel;

  const EditActionButtons({
    super.key,
    required this.enableAcceptButton,
    required this.onAccept,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: onCancel,
          child: const Text('Cancel'),
        ),
        const SizedBox(width: 20.0),
        TextButton(
          onPressed: enableAcceptButton ? onAccept : null,
          child: const Text('Accept'),
        ),
      ],
    );
  }
}
