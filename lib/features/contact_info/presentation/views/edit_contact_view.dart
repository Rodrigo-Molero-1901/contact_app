import 'package:contact_app/features/contact_info/data/models/address_model.dart';
import 'package:contact_app/features/contact_info/data/models/contact_info_model.dart';
import 'package:contact_app/features/contact_info/presentation/blocs/contact_info_cubit.dart';
import 'package:contact_app/features/contact_info/presentation/utils/enums.dart';
import 'package:contact_app/features/contact_info/presentation/viewmodels/contact_info_view_model.dart';
import 'package:contact_app/features/contact_info/presentation/widgets/address_group.dart';
import 'package:contact_app/features/contact_info/presentation/widgets/edit_action_buttons.dart';
import 'package:contact_app/features/contact_info/presentation/widgets/edit_header.dart';
import 'package:contact_app/features/contact_info/presentation/widgets/edit_info_group.dart';
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

  late List<TextEditingController> _streetAddrControllers;
  late List<TextEditingController> _cityControllers;
  late List<TextEditingController> _stateControllers;
  late List<TextEditingController> _zipCodeControllers;

  bool _firstNameIsEmpty = true;

  get _firstNameCtrl => _fieldsControllers[0];
  get _lastNameCtrl => _fieldsControllers[1];
  get _phoneNumberCtrl => _fieldsControllers[2];

  void _createTextEditingControllers() {
    _fieldsControllers = List.generate(
      AppConstants.contactFields,
      (_) => TextEditingController(),
    );
    _streetAddrControllers = [];
    _cityControllers = [];
    _stateControllers = [];
    _zipCodeControllers = [];
  }

  void _populateTextEditingControllers() {
    _firstNameCtrl.text = widget.viewModel.firstName;
    _lastNameCtrl.text = widget.viewModel.lastName;
    _phoneNumberCtrl.text = widget.viewModel.phoneNumber;

    if (widget.viewModel.addressesViewModels.isNotEmpty) {
      for (var address in widget.viewModel.addressesViewModels) {
        _streetAddrControllers
            .add(TextEditingController(text: address.streetAddress));
        _cityControllers.add(TextEditingController(text: address.city));
        _stateControllers.add(TextEditingController(text: address.state));
        _zipCodeControllers.add(TextEditingController(text: address.zipCode));
      }
    }
  }

  void _addAddressField() {
    setState(() {
      _streetAddrControllers.add(TextEditingController());
      _cityControllers.add(TextEditingController());
      _stateControllers.add(TextEditingController());
      _zipCodeControllers.add(TextEditingController());
    });
  }

  void _removeAddressField(int index) {
    setState(() {
      if (index >= 0) {
        _streetAddrControllers[index].dispose();
        _cityControllers[index].dispose();
        _stateControllers[index].dispose();
        _zipCodeControllers[index].dispose();

        _streetAddrControllers.removeAt(index);
        _cityControllers.removeAt(index);
        _stateControllers.removeAt(index);
        _zipCodeControllers.removeAt(index);
      }
    });
  }

  ContactInfoModel _setContactInfoModel() {
    return ContactInfoModel(
      objectId: widget.viewModel.objectId,
      contactId: widget.viewModel.contactId,
      firstName: _firstNameCtrl.text,
      lastName: _lastNameCtrl.text,
      phoneNumber: _phoneNumberCtrl.text,
      addresses: List.generate(_streetAddrControllers.length, (index) {
        return AddressModel(
          streetAddress: _streetAddrControllers[index].text,
          city: _cityControllers[index].text,
          state: _stateControllers[index].text,
          zipCode: _zipCodeControllers[index].text,
        );
      }).where((address) => !address.isEmpty).toList(),
    );
  }

  void _disposeTextEditingControllers() {
    for (var controller in _fieldsControllers) {
      controller.dispose();
    }
    for (var controller in _streetAddrControllers) {
      controller.dispose();
    }
    for (var controller in _cityControllers) {
      controller.dispose();
    }
    for (var controller in _stateControllers) {
      controller.dispose();
    }
    for (var controller in _zipCodeControllers) {
      controller.dispose();
    }
  }

  @override
  void initState() {
    super.initState();
    _createTextEditingControllers();
    _populateTextEditingControllers();
    _firstNameCtrl.addListener(() {
      setState(() {
        _firstNameIsEmpty = _firstNameCtrl.text.isEmpty;
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
            EditInfoGroup(
              controller: _firstNameCtrl,
              hint: 'First name',
              icon: Icons.person_outline,
            ),
            EditInfoGroup(
              controller: _lastNameCtrl,
              hint: 'Last name',
              icon: Icons.person_outline,
            ),
            EditInfoGroup(
              controller: _phoneNumberCtrl,
              hint: 'Phone number',
              icon: Icons.phone_outlined,
            ),
            AddressGroup(
              streetAddrControllers: _streetAddrControllers,
              cityControllers: _cityControllers,
              stateControllers: _stateControllers,
              zipCodeControllers: _zipCodeControllers,
              onRemove: _removeAddressField,
            ),
            TextButton.icon(
              onPressed: _addAddressField,
              icon: const Icon(Icons.add_circle_outline),
              label: const Text('Add address'),
            ),
            const SizedBox(height: 20.0),
            EditActionButtons(
              enableAcceptButton: isEditContact ? true : !_firstNameIsEmpty,
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
