import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  final bool enableAcceptButton;
  final Function() onAccept;
  final Function()? onCancel;

  const ActionButtons({
    super.key,
    required this.enableAcceptButton,
    required this.onAccept,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () => onCancel ?? Navigator.pop(context),
          child: Text('Cancel'),
        ),
        const SizedBox(width: 20.0),
        TextButton(
          onPressed: enableAcceptButton ? onAccept : null,
          child: Text('Accept'),
        ),
      ],
    );
  }
}
