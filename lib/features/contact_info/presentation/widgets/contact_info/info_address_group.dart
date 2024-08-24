import 'package:contact_app/features/contact_info/presentation/viewmodels/address_view_model.dart';
import 'package:contact_app/features/contact_info/presentation/widgets/contact_info/info_row.dart';
import 'package:flutter/material.dart';

class InformationAddressGroup extends StatelessWidget {
  final List<AddressViewModel> addressViewModels;

  const InformationAddressGroup({
    super.key,
    required this.addressViewModels,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(addressViewModels.length, (index) {
        final address = addressViewModels[index];

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Column(
              children: [
                InformationRow(
                  text: address.displayStreetAddress,
                  icon: Icons.location_on_outlined,
                  disableColor: address.streetAddress.isEmpty,
                ),
                InformationRow(
                  text: address.displayCity,
                  icon: Icons.location_city_outlined,
                  disableColor: address.city.isEmpty,
                ),
                InformationRow(
                  text: address.displayState,
                  icon: Icons.map_outlined,
                  disableColor: address.state.isEmpty,
                ),
                InformationRow(
                  text: address.displayZipCode,
                  icon: Icons.markunread_mailbox_outlined,
                  disableColor: address.zipCode.isEmpty,
                  showDivider: false,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
