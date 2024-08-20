import 'package:contact_app/features/contact_info/presentation/utils/enums.dart';
import 'package:flutter/material.dart';

class InformationHeader extends StatelessWidget {
  final bool enableEditButton;
  final ContactInfoPageType pageType;
  final Function() onUpdateTapped;
  final Function() onDeleteTapped;

  const InformationHeader({
    super.key,
    required this.enableEditButton,
    required this.pageType,
    required this.onUpdateTapped,
    required this.onDeleteTapped,
  });

  @override
  Widget build(BuildContext context) {
    final pageHasData = pageType == ContactInfoPageType.withData;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
        const SizedBox(width: 10.0),
        Text(
          pageHasData ? 'Contact information' : 'New contact',
          style: const TextStyle(fontSize: 22.0),
        ),
        const Spacer(),
        if (pageHasData) ...[
          IconButton(
            onPressed: enableEditButton ? onUpdateTapped : null,
            icon: const Icon(Icons.edit_outlined),
          ),
          IconButton(
            onPressed: onDeleteTapped,
            icon: const Icon(Icons.delete_outlined),
          ),
        ]
      ],
    );
  }
}
