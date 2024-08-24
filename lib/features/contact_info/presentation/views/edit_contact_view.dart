import 'package:contact_app/features/contact_info/data/models/address_model.dart';
import 'package:contact_app/features/contact_info/data/models/contact_info_model.dart';
import 'package:contact_app/features/contact_info/presentation/blocs/contact_info_cubit.dart';
import 'package:contact_app/features/contact_info/presentation/utils/enums.dart';
import 'package:contact_app/features/contact_info/presentation/viewmodels/contact_info_view_model.dart';
import 'package:contact_app/features/contact_info/presentation/widgets/edit_action_buttons.dart';
import 'package:contact_app/features/contact_info/presentation/widgets/edit_header.dart';
import 'package:contact_app/features/contact_info/presentation/widgets/edit_row.dart';
import 'package:contact_app/shared/constants/app_constants.dart';
import 'package:flutter/material.dart';

class EditContactView extends StatefulWidget {
  final ContactInfoViewModel viewModel;
  final ContactInfoCubit cubit;

  const EditContactView({
    super.key,
    required this.viewModel,
    required this.cubit,
  });

  @override
  State<EditContactView> createState() => _EditContactViewState();
}

class _EditContactViewState extends State<EditContactView> {
  late List<TextEditingController> _fieldsControllers;
  late List<TextEditingController> _addressesControllers;
  bool _isFirstNameEmpty = true;

  get _firstNameCtrl => _fieldsControllers[0];
  get _lastNameCtrl => _fieldsControllers[1];
  get _phoneNumberCtrl => _fieldsControllers[2];
  get _cityCtrl => _fieldsControllers[3];
  get _stateCtrl => _fieldsControllers[4];
  get _zipCodeCtrl => _fieldsControllers[5];

  void _createTextEditingControllers() {
    _fieldsControllers = List.generate(
      AppConstants.contactFields,
      (_) => TextEditingController(),
    );
    _addressesControllers = [TextEditingController()];
  }

  void _populateTextEditingControllers() {
    _firstNameCtrl.text = widget.viewModel.firstName;
    _lastNameCtrl.text = widget.viewModel.lastName;
    _phoneNumberCtrl.text = widget.viewModel.phoneNumber;
    _cityCtrl.text = widget.viewModel.city;
    _stateCtrl.text = widget.viewModel.state;
    _zipCodeCtrl.text = widget.viewModel.zipCode;

    if (widget.viewModel.addresses.isNotEmpty) {
      _addressesControllers = widget.viewModel.addresses
          .map((address) => TextEditingController(text: address))
          .toList();
    }
  }

  void _addAddressField() {
    setState(() {
      _addressesControllers.add(TextEditingController());
    });
  }

  void _removeAddressField(int index) {
    setState(() {
      if (index > 0) {
        _addressesControllers.removeAt(index);
      } else {
        _addressesControllers[0].clear();
      }
    });
  }

  ContactInfoModel _setContactInfoModel() {
    final noAddresses = _addressesControllers.length == 1 &&
        _addressesControllers[0].text.isEmpty;

    return ContactInfoModel(
      objectId: widget.viewModel.objectId,
      contactId: widget.viewModel.contactId,
      firstName: _firstNameCtrl.text,
      lastName: _lastNameCtrl.text,
      phoneNumber: _phoneNumberCtrl.text,
      city: _cityCtrl.text,
      state: _stateCtrl.text,
      zipCode: _zipCodeCtrl.text,
      addresses: noAddresses
          ? []
          : _addressesControllers
              .map((ctrl) => AddressModel(addressName: ctrl.text))
              .toList(),
    );
  }

  void _disposeTextEditingControllers() {
    for (var fieldCtrl in _fieldsControllers) {
      fieldCtrl.dispose();
    }
    for (var addressCtrl in _addressesControllers) {
      addressCtrl.dispose();
    }
  }

  @override
  void initState() {
    super.initState();
    _createTextEditingControllers();
    _populateTextEditingControllers();
    _firstNameCtrl.addListener(() {
      setState(() {
        _isFirstNameEmpty = _firstNameCtrl.text.isEmpty;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _disposeTextEditingControllers();
  }

  @override
  Widget build(BuildContext context) {
    final infoPageType = widget.viewModel.contactInfoPageType;
    final isEditContact = infoPageType == ContactInfoPageType.withData;
    final enableAcceptButton = isEditContact ? true : !_isFirstNameEmpty;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusScope.of(context).unfocus(),
      child: SingleChildScrollView(
        child: Column(
          children: [
            EditHeader(
              pageType: infoPageType,
              onBackTapped: () => isEditContact
                  ? widget.cubit.goToContactInfoView()
                  : Navigator.pop(context),
            ),
            const SizedBox(height: 10.0),
            EditRow(
              controller: _firstNameCtrl,
              hint: 'First name',
              icon: Icons.person_outline,
            ),
            EditRow(
              controller: _lastNameCtrl,
              hint: 'Last name',
              icon: Icons.person_outline,
            ),
            EditRow(
              controller: _phoneNumberCtrl,
              hint: 'Phone number',
              icon: Icons.phone_outlined,
            ),
            EditRow(
              controller: _cityCtrl,
              hint: 'City',
              icon: Icons.location_city_outlined,
            ),
            EditRow(
              controller: _stateCtrl,
              hint: 'State',
              icon: Icons.map_outlined,
            ),
            EditRow(
              controller: _zipCodeCtrl,
              hint: 'Zip code',
              icon: Icons.pin_drop_outlined,
              useTextInputActionDone: true,
            ),
            Column(
              children: List.generate(_addressesControllers.length, (index) {
                return Row(
                  children: [
                    Expanded(
                      child: EditRow(
                        controller: _addressesControllers[index],
                        hint: 'Address ${index + 1}',
                        icon: Icons.location_on_outlined,
                      ),
                    ),
                    if (index > 0)
                      IconButton(
                        icon: const Icon(Icons.remove_circle_outline),
                        onPressed: () => _removeAddressField(index),
                      ),
                  ],
                );
              }),
            ),
            IconButton(
              icon: const Icon(Icons.add_circle_outline),
              onPressed: _addAddressField,
            ),
            const SizedBox(height: 20.0),
            EditActionButtons(
              enableAcceptButton: enableAcceptButton,
              onAccept: () {
                widget.cubit.setContactAndAddresses(_setContactInfoModel());
                if (isEditContact) {
                  widget.cubit.updateContact();
                  widget.cubit.goToContactInfoView();
                } else {
                  widget.cubit.createContact();
                  Navigator.pop(context);
                }
              },
              onCancel: () => isEditContact
                  ? widget.cubit.goToContactInfoView()
                  : Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}
