import 'package:contact_app/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';

class InformationRow extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool disableColor;
  final bool showDivider;

  const InformationRow({
    super.key,
    required this.text,
    required this.icon,
    this.disableColor = false,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppContextColors.contactInfoRowBackground,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 20.0),
                Icon(icon),
                const SizedBox(width: 15.0),
                Expanded(
                  child: Text(
                    text,
                    overflow: TextOverflow.ellipsis,
                    style: disableColor
                        ? const TextStyle(
                            color: AppContextColors.emptyInfoField,
                          )
                        : null,
                  ),
                ),
                const SizedBox(width: 20.0),
              ],
            ),
          ),
          if (showDivider)
            const Padding(
              padding: EdgeInsets.only(
                left: 55.0,
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
