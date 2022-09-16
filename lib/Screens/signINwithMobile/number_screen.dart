import 'package:flutter/material.dart';
import 'package:flutter_with_firebase/Controllers/login_controller.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class EnterPhoneNumberScreen extends StatefulWidget {
  const EnterPhoneNumberScreen({Key? key}) : super(key: key);

  @override
  State<EnterPhoneNumberScreen> createState() => _EnterPhoneNumberScreenState();
}

class _EnterPhoneNumberScreenState extends State<EnterPhoneNumberScreen> {
  final TextEditingController _phoneController = TextEditingController();
  LoginController loginController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sign In With Number")),
      body: Column(children: [
        SizedBox(height: 30.h),
        const Text("Enter Number"),
        SizedBox(
          height: 2.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: SizedBox(
            width: 90.w,
            child: TextFormField(
              controller: _phoneController,
              keyboardType: TextInputType.number,
              onChanged: (s) {},
              // controller: loginController.signUpemailController,
              decoration: InputDecoration(
                prefixIcon: Container(
                  width: 10,
                  alignment: Alignment.center,
                  child: const Text(
                    "+92",
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ),
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                // errorText: loginController.isValid.value ? errorText : "",
                hintText: "Enter Email",
              ),
            ),
          ),
        ),
        ElevatedButton(
            onPressed: () {
              loginController.phoneAuth("+92${_phoneController.text}");
              // Get.to(() => const PinCodeVerificationScreen());
            },
            child: const Text("sign"))
      ]),
    );
  }
}
