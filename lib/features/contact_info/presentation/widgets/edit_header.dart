import 'package:contact_app/features/contact_info/presentation/utils/enums.dart';
import 'package:flutter/material.dart';

class EditHeader extends StatelessWidget {
  final ContactInfoPageType pageType;
  final Function() onBackTapped;

  const EditHeader({
    super.key,
    required this.pageType,
    required this.onBackTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onBackTapped,
          icon: const Icon(Icons.arrow_back),
        ),
        const SizedBox(width: 10.0),
        Text(
          pageType == ContactInfoPageType.withData
              ? 'Edit contact'
              : 'New contact',
          style: const TextStyle(fontSize: 22.0),
        ),
      ],
    );
  }
}
