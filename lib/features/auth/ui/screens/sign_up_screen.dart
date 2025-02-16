import 'package:cruftybay/features/auth/ui/controller/complete_profile_Screen_controller.dart';
import 'package:cruftybay/features/auth/ui/widgets/app_logo_widget.dart';
import 'package:cruftybay/features/common/ui/screens/main_bottom_nav_screen.dart';
import 'package:cruftybay/features/common/ui/widgets/center_circular_progress_indicator.dart';
import 'package:cruftybay/features/common/ui/widgets/snackbar_message.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});



  static const name = '/SignUp-Screen';

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _cityNameTEController = TextEditingController();
  // final TextEditingController _customerNameTEController = TextEditingController();
  // final TextEditingController _customerAddressTEController = TextEditingController();
  // final TextEditingController _customerMobileTEController = TextEditingController();
  // final TextEditingController _customerFaxTEController = TextEditingController();
  // final TextEditingController _customerStateTEController = TextEditingController();
  // final TextEditingController _customerCityTEController = TextEditingController();
  // final TextEditingController _customerPostCodeTEController = TextEditingController();
  // final TextEditingController _customerCountryNameTEController = TextEditingController();
  //
  // final TextEditingController _shipPersonNameTEController = TextEditingController();
  // final TextEditingController _shipPersonAddressTEController = TextEditingController();
  // final TextEditingController _shipMobileNumberTEController = TextEditingController();
  // final TextEditingController _shipmentStateTEController = TextEditingController();
  // final TextEditingController _shipmentCityTEController = TextEditingController();
  // final TextEditingController _shipmentCountryTEController = TextEditingController();
  // final TextEditingController _shipPostCodeTEController = TextEditingController();

  final CreateProfileScreenController _createProfileScreenController = CreateProfileScreenController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                const SizedBox(height: 60),
                const AppLogoWidget(
                  width: 100,
                  height: 100,
                ),
                const SizedBox(height: 16),
                Text(
                  'Complete Profile',
                  style: Theme
                      .of(context)
                      .textTheme
                      .titleLarge,
                ),
                Text(
                  'Get started with us with your details',
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Colors.grey),
                ),
                _buildForm(),
                const SizedBox(height: 16),
                GetBuilder<CreateProfileScreenController>(
                  builder: (controller) {
                    if(controller.inProgress){
                      return const CenterCircularProgressIndicator();
                    }
                    return ElevatedButton(
                      onPressed: _onTapNextButton,
                      child: const Text('Complete'),
                    );
                  }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _firstNameTEController,
            decoration: const InputDecoration(hintText: 'First Name'),
            validator: (String? value) {
              if (value
                  ?.trim()
                  .isEmpty ?? true) {
                return "Enter your first name";
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _lastNameTEController,
            decoration: const InputDecoration(hintText: 'Last Name'),
            maxLines: 2,
            validator: (String? value) {
              if (value
                  ?.trim()
                  .isEmpty ?? true) {
                return "Enter your last name";
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _emailTEController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(
              hintText: 'Email address',
            ),
            validator: (String? value) {
              if (value?.isEmpty ?? true) {
                return 'Enter your email';
              }
              if (EmailValidator.validate(value!) == false) {
                return 'Enter a valid email address';
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _passwordTEController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(
              hintText: 'Password',
            ),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter your password';
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _mobileTEController,
            decoration: const InputDecoration(hintText: 'Mobile'),
            maxLength: 11,
            validator: (String? value) {
              final regex = RegExp(r'^01[3-9]\d{8}$');
              if (value
                  ?.trim()
                  .isEmpty ?? true) {
                return 'Enter your mobile number';
              }
              if (!regex.hasMatch(value!)) {
                return "Enter your valid mobile number !";
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _cityNameTEController,
            decoration: const InputDecoration(hintText: 'City Name'),
            validator: (String? value) {
              if (value
                  ?.trim()
                  .isEmpty ?? true) {
                return "Enter your city name";
              }
              return null;
            },
          ),
          // const SizedBox(height: 8),
          // TextFormField(
          //   controller: _customerPostCodeTEController,
          //   keyboardType: TextInputType.number,
          //   decoration: const InputDecoration(
          //     hintText: 'Post Code',
          //   ),
          //   validator: (String? value) {
          //     if (value
          //         ?.trim()
          //         .isEmpty ?? true) {
          //       return 'Enter your post code';
          //     }
          //     return null;
          //   },
          // ),
          // const SizedBox(height: 8),
          // TextFormField(
          //   controller: _customerCountryNameTEController,
          //   decoration: const InputDecoration(hintText: 'Country'),
          //   validator: (String? value) {
          //     if (value
          //         ?.trim()
          //         .isEmpty ?? true) {
          //       return "Enter your country name";
          //     }
          //     return null;
          //   },
          // ),
          // const SizedBox(height: 8),
          // Text('Shipping Address', style: Theme
          //     .of(context)
          //     .textTheme
          //     .titleMedium),
          // const SizedBox(height: 8),
          // TextFormField(
          //   autovalidateMode: AutovalidateMode.onUserInteraction,
          //   controller: _shipPersonNameTEController,
          //   decoration: const InputDecoration(hintText: 'Ship_Name'),
          //   validator: (String? value) {
          //     if (value
          //         ?.trim()
          //         .isEmpty ?? true) {
          //       return "Enter your name";
          //     }
          //     return null;
          //   },
          // ),
          // const SizedBox(height: 8),
          // TextFormField(
          //   autovalidateMode: AutovalidateMode.onUserInteraction,
          //   controller: _shipPersonAddressTEController,
          //   decoration: const InputDecoration(hintText: 'Ship_Address'),
          //   validator: (String? value) {
          //     if (value
          //         ?.trim()
          //         .isEmpty ?? true) {
          //       return "Enter your name";
          //     }
          //     return null;
          //   },
          // ),
          // const SizedBox(height: 8),
          // TextFormField(
          //   autovalidateMode: AutovalidateMode.onUserInteraction,
          //   controller: _shipMobileNumberTEController,
          //   decoration: const InputDecoration(hintText: 'Mobile number'),
          //   maxLength: 11,
          //   validator: (String? value) {
          //     final regex = RegExp(r'^01[3-9]\d{8}$');
          //     if (value
          //         ?.trim()
          //         .isEmpty ?? true) {
          //       return 'Enter your mobile number';
          //     }
          //     if (!regex.hasMatch(value!)) {
          //       return "Enter your valid mobile number !";
          //     }
          //     return null;
          //   },
          // ),
          // const SizedBox(height: 8),
          // TextFormField(
          //   autovalidateMode: AutovalidateMode.onUserInteraction,
          //   controller: _shipmentStateTEController,
          //   decoration: const InputDecoration(hintText: 'Shipment State'),
          //   validator: (String? value) {
          //     if (value
          //         ?.trim()
          //         .isEmpty ?? true) {
          //       return "Enter product shipment state";
          //     }
          //     return null;
          //   },
          // ),
          // const SizedBox(height: 8),
          // TextFormField(
          //   maxLines: 2,
          //   controller: _shipmentCityTEController,
          //   decoration: const InputDecoration(
          //     hintText: 'Shipment city',
          //   ),
          //   validator: (String? value) {
          //     if (value
          //         ?.trim()
          //         .isEmpty ?? true) {
          //       return 'Enter product shipment city';
          //     }
          //     return null;
          //   },
          // ),
          // const SizedBox(height: 8),
          // TextFormField(
          //   controller: _shipPostCodeTEController,
          //   keyboardType: TextInputType.number,
          //   decoration: const InputDecoration(hintText: 'PostCode'),
          //   validator: (String? value) {
          //     if (value
          //         ?.trim()
          //         .isEmpty ?? true) {
          //       return "Enter your postcode";
          //     }
          //     return null;
          //     //   digejoy702@kvegg.com
          //   },
          // ),
          // const SizedBox(height: 8),
          // TextFormField(
          //   controller: _shipmentCountryTEController,
          //   decoration: const InputDecoration(hintText: 'Shipment Country'),
          //   validator: (String? value) {
          //     if (value
          //         ?.trim()
          //         .isEmpty ?? true) {
          //       return "Enter product shipment country name";
          //     }
          //     return null;
          //   },
          // )
        ],
      ),
    );
  }


  Future<void> _onTapNextButton() async {
    // final bool isSuccess = await Get.find<CreateProfileScreenController>().createProfile(
    //     // cusName: _customerNameTEController.text.trim(),
    //     // cusAddress: _customerAddressTEController.text.trim(),
    //     // cusCity: _customerCityTEController.text.trim(),
    //     // cusState: _customerStateTEController.text.trim(),
    //     // cusPostCode: _customerPostCodeTEController.text.trim(),
    //     // cusCountry: _customerCountryNameTEController.text.trim(),
    //     // cusPhoneNumber: _customerMobileTEController.text.trim(),
    //     // cusFax: _customerFaxTEController.text.trim(),
    //     // shipPersonName: _shipPersonNameTEController.text.trim(),
    //     // shipAddress: _shipPersonAddressTEController.text.trim(),
    //     // shipCity: _shipmentCityTEController.text.trim(),
    //     // shipState: _shipmentStateTEController.text.trim(),
    //     // shipPostCode: _shipPostCodeTEController.text.trim(),
    //     // shipCountry: _shipmentCountryTEController.text.trim(),
    //     // shipPhone: _shipMobileNumberTEController.text.trim(),);
    //
    // if(isSuccess){
    //   if(Get.find<CreateProfileScreenController>().shouldNavigateMainBottomScreen){
    //     if(mounted){
    //       showSnackBarMessage(context, 'Profile has been created');
    //       Navigator.pushNamed(context, MainBottomNavScreen.name);
    //     }
    //   }
    //
    // }else{
    //   if(mounted){
    //     showSnackBarMessage(context, _createProfileScreenController.errorMessage!);
    //   }
    // }
  }

  @override
  void dispose() {
    _firstNameTEController.clear();
    _lastNameTEController.clear();
    _emailTEController.clear();
    _passwordTEController.clear();
    _mobileTEController.clear();
    _cityNameTEController.clear();
    super.dispose();
  }
}
