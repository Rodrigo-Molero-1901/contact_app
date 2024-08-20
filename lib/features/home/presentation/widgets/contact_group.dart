import 'package:contact_app/features/home/presentation/blocs/home_cubit.dart';
import 'package:contact_app/features/home/presentation/viewmodels/contact_view_model.dart';
import 'package:contact_app/features/home/presentation/widgets/contact_row.dart';
import 'package:flutter/material.dart';

class ContactGroup extends StatelessWidget {
  final Map<String, List<ContactViewModel>> contactListViewModel;
  final HomeCubit cubit;

  const ContactGroup({
    super.key,
    required this.contactListViewModel,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: contactListViewModel.length,
      itemBuilder: (context, index) {
        final letter = contactListViewModel.keys.toList()[index];
        final contacts = contactListViewModel[letter] ??= [];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 20.0,
              ),
              child: Text(
                letter,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Column(
                children: List.generate(
                  contacts.length,
                  (index) {
                    final contact = contacts[index];
                    final contactId = contact.contactId;
                    final showDivider = index != contacts.length - 1;

                    return ContactRow(
                      onContactTapped: () => cubit.onContactTapped(contactId),
                      onCall: () => cubit.onCall(contactId),
                      onMessage: () => cubit.onMessage(contactId),
                      showDivider: showDivider,
                      contact: contact,
                    );
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
