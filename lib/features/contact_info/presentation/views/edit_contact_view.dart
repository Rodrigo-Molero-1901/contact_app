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
  late final List<TextEditingController> _txtControllers;
  bool _isFirstNameEmpty = true;

  get _firstNameCtrl => _txtControllers[0];
  get _lastNameCtrl => _txtControllers[1];
  get _phoneNumberCtrl => _txtControllers[2];
  get _address1Ctrl => _txtControllers[3];
  get _address2Ctrl => _txtControllers[4];
  get _cityCtrl => _txtControllers[5];
  get _stateCtrl => _txtControllers[6];
  get _zipCodeCtrl => _txtControllers[7];

  void _createTextEditingControllers() {
    _txtControllers = List.generate(
      AppConstants.contactFields,
      (_) => TextEditingController(),
    );
  }

  void _populateTextEditingControllers() {
    _firstNameCtrl.text = widget.viewModel.firstName;
    _lastNameCtrl.text = widget.viewModel.lastName;
    _phoneNumberCtrl.text = widget.viewModel.phoneNumber;
    _address1Ctrl.text = widget.viewModel.streetAddress1;
    _address2Ctrl.text = widget.viewModel.streetAddress2;
    _cityCtrl.text = widget.viewModel.city;
    _stateCtrl.text = widget.viewModel.state;
    _zipCodeCtrl.text = widget.viewModel.zipCode;
  }

  void _disposeTextEditingControllers() {
    _firstNameCtrl.dispose();
    _lastNameCtrl.dispose();
    _phoneNumberCtrl.dispose();
    _address1Ctrl.dispose();
    _address2Ctrl.dispose();
    _cityCtrl.dispose();
    _stateCtrl.dispose();
    _zipCodeCtrl.dispose();
  }

  ContactInfoModel _setContactInfoModel() {
    return ContactInfoModel(
      objectId: widget.viewModel.objectId,
      contactId: widget.viewModel.contactId,
      firstName: _firstNameCtrl.text,
      lastName: _lastNameCtrl.text,
      phoneNumber: _phoneNumberCtrl.text,
      streetAddress1: _address1Ctrl.text,
      streetAddress2: _address2Ctrl.text,
      city: _cityCtrl.text,
      state: _stateCtrl.text,
      zipCode: _zipCodeCtrl.text,
    );
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
              controller: _address1Ctrl,
              hint: 'Address #1',
              icon: Icons.location_on_outlined,
            ),
            EditRow(
              controller: _address2Ctrl,
              hint: 'Address #2',
              icon: Icons.location_on_outlined,
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
            const SizedBox(height: 20.0),
            EditActionButtons(
              enableAcceptButton: enableAcceptButton,
              onAccept: () {
                widget.cubit.setContact(_setContactInfoModel());
                isEditContact
                    ? widget.cubit.updateContact()
                    : widget.cubit.createContact();
                Navigator.pop(context, true);
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
