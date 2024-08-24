import 'package:contact_app/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';

class MainInformationCard extends StatelessWidget {
  final String fullName;
  final String letterIdentifier;
  final String phoneNumber;

  const MainInformationCard({
    super.key,
    required this.fullName,
    required this.letterIdentifier,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.0,
      child: Stack(
        children: [
          Positioned.fill(
            top: 50.0,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              padding: const EdgeInsets.only(top: 60.0),
              decoration: BoxDecoration(
                color: AppContextColors.contactCardBackground,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      fullName,
                      style: const TextStyle(fontSize: 22.0),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (phoneNumber.isNotEmpty) ...[
                    const SizedBox(height: 5.0),
                    Text(phoneNumber),
                  ],
                  const SizedBox(height: 20.0),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _ActionButton(
                        iconData: Icons.call,
                        backgroundColor: AppContextColors.actionCall,
                      ),
                      _ActionButton(
                        iconData: Icons.sms,
                        backgroundColor: AppContextColors.actionSms,
                      ),
                      _ActionButton(
                        iconData: Icons.mail,
                        backgroundColor: AppContextColors.actionEmail,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: CircleAvatar(
              radius: 50.0,
              backgroundColor: AppContextColors.contactAvatar,
              child: Text(
                letterIdentifier,
                style: const TextStyle(
                  fontSize: 34,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData iconData;
  final Color backgroundColor;

  const _ActionButton({
    required this.iconData,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      style: IconButton.styleFrom(
        backgroundColor: backgroundColor,
      ),
      icon: Icon(
        iconData,
        size: 28.0,
        color: Colors.white,
      ),
    );
  }
}
