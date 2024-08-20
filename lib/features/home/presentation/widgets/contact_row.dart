import 'package:contact_app/features/home/presentation/viewmodels/contact_view_model.dart';
import 'package:contact_app/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ContactRow extends StatelessWidget {
  final Function() onContactTapped;
  final Function()? onCall;
  final Function()? onMessage;
  final bool showDivider;
  final ContactViewModel contact;

  const ContactRow({
    super.key,
    required this.onContactTapped,
    this.onCall,
    this.onMessage,
    this.showDivider = true,
    required this.contact,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(
        motion: const BehindMotion(),
        openThreshold: 0.25,
        children: [
          SlidableAction(
            onPressed: (_) => onCall?.call(),
            backgroundColor: AppContextColors.call,
            foregroundColor: Colors.white,
            icon: Icons.call,
            label: 'Call',
          ),
        ],
      ),
      endActionPane: ActionPane(
        motion: const BehindMotion(),
        openThreshold: 0.25,
        children: [
          SlidableAction(
            onPressed: (_) => onMessage?.call(),
            backgroundColor: AppContextColors.sms,
            foregroundColor: Colors.white,
            icon: Icons.sms,
            label: 'SMS',
          ),
        ],
      ),
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: AppContextColors.contactRow,
        ),
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: onContactTapped,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(width: 20.0),
                      CircleAvatar(
                        backgroundColor: AppContextColors.contactRowAvatar,
                        child: Text(contact.letterIdentifier),
                      ),
                      const SizedBox(width: 20.0),
                      Text(contact.fullName)
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
          ),
        ),
      ),
    );
  }
}
