import 'package:flutter/material.dart';
import 'package:sn_silos/models/address_model.dart';
import 'package:sn_silos/utils/loading_dialog.dart';
import 'package:sn_silos/utils/validity_methods.dart';
import 'package:sn_silos/widgets/action_button.dart';
import 'package:sn_silos/widgets/screen_page_setup.dart';

class AddEditAddressScreen extends StatefulWidget {
  static const idForAdd = "AddAddressScreenId";
  static const idForEdit = "EditAddressScreenId";
  const AddEditAddressScreen.addNew({
    super.key,
  })  : address = null,
        toAddNew = true;
  const AddEditAddressScreen.edit({
    super.key,
    required this.address,
  }) : toAddNew = false;

  final bool toAddNew;
  final AddressModel? address;
  @override
  State<AddEditAddressScreen> createState() => _AddEditAddressScreenState();
}

class _AddEditAddressScreenState extends State<AddEditAddressScreen> {
  bool toAddNew = true;
  AddressModel? am;

  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _postalCodeController = TextEditingController();
  final TextEditingController _add1Controller = TextEditingController();
  final TextEditingController _add2Controller = TextEditingController();

  GlobalKey<FormState> _key = GlobalKey();
  @override
  void initState() {
    super.initState();
    toAddNew = widget.toAddNew;

    if (!toAddNew) {
      am = widget.address;
      _countryController.text = am!.country;
      _stateController.text = am!.state;
      _districtController.text = am!.district;
      _cityController.text = am!.city;
      _postalCodeController.text = am!.postalCode.toString();
      _add1Controller.text = am!.addressLine1 ?? "";
      _add2Controller.text = am!.addressLine2 ?? "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(toAddNew ? "Add Address" : "Edit Address"),
      ),
      body: Form(
        key: _key,
        child: ScreenPageSetup(
          children: [
            const SizedBox(height: 22),
            TextFormField(
              validator: defaultValidator,
              controller: _countryController,
              decoration: const InputDecoration(labelText: "Country *"),
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 15),
            TextFormField(
              validator: defaultValidator,
              controller: _stateController,
              decoration: const InputDecoration(labelText: "State *"),
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 15),
            TextFormField(
              validator: defaultValidator,
              controller: _districtController,
              decoration: const InputDecoration(labelText: "District *"),
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: _cityController,
              validator: defaultValidator,
              decoration: const InputDecoration(labelText: "City *"),
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 15),
            TextFormField(
              validator: validatePostalCode,
              controller: _postalCodeController,
              decoration: const InputDecoration(labelText: "Postal Code *"),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 15),
            TextFormField(
              validator: defaultValidator,
              controller: _add1Controller,
              decoration: const InputDecoration(labelText: "Address 1"),
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 15),
            TextFormField(
              validator: defaultValidator,
              controller: _add2Controller,
              decoration: const InputDecoration(labelText: "Address 2"),
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 15),
            const Spacer(),
            ActionButton(
              title: toAddNew ? "Add Address" : "Edit Address",
              onPressed: toAddNew ? addAddress : editAddress,
            ),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }

  AddressModel createAddress() {
    return AddressModel(
      country: _countryController.text,
      state: _stateController.text,
      district: _districtController.text,
      city: _cityController.text,
      postalCode: int.parse(_postalCodeController.text),
      addressLine1: _add1Controller.text != "" ? _add1Controller.text : null,
      addressLine2: _add2Controller.text != "" ? _add2Controller.text : null,
    );
  }

  void addAddress() {
    if (!(_key.currentState?.validate() ?? false)) return;
    showLoadingDialog(context, title: "Adding Address");
    var a = createAddress();
  }

  void editAddress() {
    if (!(_key.currentState?.validate() ?? false)) return;
    showLoadingDialog(context, title: "Updating Address");
    var a = createAddress();
  }
}
