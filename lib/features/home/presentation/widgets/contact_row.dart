import 'package:contact_app/features/home/presentation/viewmodels/contact_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ContactRow extends StatelessWidget {
  final Function() onContactTapped;
  final Function()? onCall;
  final Function()? onMessage;
  final ContactViewModel contact;

  const ContactRow({
    super.key,
    required this.onContactTapped,
    this.onCall,
    this.onMessage,
    required this.contact,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: const ValueKey(0),
      startActionPane: ActionPane(
        motion: const BehindMotion(),
        openThreshold: 0.25,
        children: [
          SlidableAction(
            onPressed: (_) => onCall?.call(),
            backgroundColor: Colors.greenAccent,
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
            backgroundColor: Colors.lightBlueAccent,
            foregroundColor: Colors.white,
            icon: Icons.sms,
            label: 'SMS',
          ),
        ],
      ),
      child: InkWell(
        onTap: onContactTapped,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            children: [
              const SizedBox(width: 20.0),
              CircleAvatar(
                backgroundColor: ([...Colors.primaries]..shuffle()).first,
                child: Text(contact.letterIdentifier),
              ),
              const SizedBox(width: 20.0),
              Text(contact.fullName)
            ],
          ),
        ),
      ),
    );
  }
}
