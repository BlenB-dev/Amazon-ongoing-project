// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../../constant/common_function.dart';
import '../../../constant/constants.dart';
import '../../../controller/services/auth_services/user_data_crud_services/user_data_CRUD_services.dart';
import '../../../model/address_model.dart';
import '../../../utils/colors.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController houseController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController landmarkController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController townController = TextEditingController();
  TextEditingController stateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(width, height * 0.1),
        child: Container(
          padding: EdgeInsets.only(
              left: width * 0.03,
              right: width * 0.03,
              bottom: height * 0.012,
              top: height * 0.045),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: appBarGradientColor,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image(
                image: const AssetImage(
                  'assets/images/amazon_black_logo.png',
                ),
                height: height * 0.04,
              ),
            ],
          ),
        ),
      ),
      body: Container(
        width: width,
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.03,
          vertical: height * 0.02,
        ),
        child: SingleChildScrollView(
          child: Column(children: [
            AddressScreenTextField(
                title: 'Enter your name',
                hintText: 'Enter your name',
                textTheme: textTheme,
                nameController: nameController,
                width: width),
            CommonFunctions.blankSpace(height * 0.02, 0),
            AddressScreenTextField(
                title: 'Enter our Mobile Number',
                hintText: 'Enter your Mobile Number',
                textTheme: textTheme,
                nameController: mobileController,
                width: width),
            CommonFunctions.blankSpace(height * 0.02, 0),
            AddressScreenTextField(
                title: 'Enter your House No',
                hintText: 'Enter your house number ',
                textTheme: textTheme,
                nameController: houseController,
                width: width),
            CommonFunctions.blankSpace(height * 0.02, 0),
            AddressScreenTextField(
                title: 'Enter your Area',
                hintText: 'Area',
                textTheme: textTheme,
                nameController: areaController,
                width: width),
            CommonFunctions.blankSpace(height * 0.02, 0),
            AddressScreenTextField(
                title: 'Enter your LandMark',
                hintText: 'Landmark',
                textTheme: textTheme,
                nameController: landmarkController,
                width: width),
            CommonFunctions.blankSpace(height * 0.02, 0),
            AddressScreenTextField(
                title: 'Enter your PINCODE',
                hintText: 'pincode',
                textTheme: textTheme,
                nameController: pincodeController,
                width: width),
            CommonFunctions.blankSpace(height * 0.02, 0),
            AddressScreenTextField(
                title: 'Enter your Town',
                hintText: 'Town',
                textTheme: textTheme,
                nameController: townController,
                width: width),
            CommonFunctions.blankSpace(height * 0.02, 0),
            AddressScreenTextField(
                title: 'Enter your State',
                hintText: 'State',
                textTheme: textTheme,
                nameController: stateController,
                width: width),
            CommonFunctions.blankSpace(height * 0.04, 0),
            ElevatedButton(
                onPressed: () {
                  Uuid uuid = Uuid();
                  String docID = uuid.v1();
                  AddressModel addressModel = AddressModel(
                    name: nameController.text.trim(),
                    mobileNumber: mobileController.text.trim(),
                    authenticatedMobileNumber: auth.currentUser!.phoneNumber,
                    houseNumber: houseController.text.trim(),
                    area: areaController.text.trim(),
                    landMark: landmarkController.text.trim(),
                    pincode: pincodeController.text.trim(),
                    town: townController.text.trim(),
                    state: stateController.text.trim(),
                    docID: docID,
                    isDefault: true,
                  );
                  UserDataCRUD.addUserAddress(
                      context: context,
                      addressModel: addressModel,
                      docID: docID);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: amber,
                    minimumSize: Size(width, height * 0.06)),
                child: Text(
                  'Add Address',
                  style: textTheme.bodyMedium,
                )),
            CommonFunctions.blankSpace(height * 0.02, 0)
          ]),
        ),
      ),
    );
  }
}

class AddressScreenTextField extends StatelessWidget {
  const AddressScreenTextField(
      {super.key,
      required this.textTheme,
      required this.nameController,
      required this.width,
      required this.hintText,
      required this.title});

  final TextTheme textTheme;
  final TextEditingController nameController;
  final double width;
  final String title;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: textTheme.bodyMedium,
        ),
        TextField(
          controller: nameController,
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(vertical: 0, horizontal: width * 0.03),
            hintText: hintText,
            hintStyle: textTheme.bodySmall,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: grey,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                color: secondaryColor,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: grey,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: grey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
