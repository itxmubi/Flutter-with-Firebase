import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class EnterPhoneNumberScreen extends StatefulWidget {
  const EnterPhoneNumberScreen({Key? key}) : super(key: key);

  @override
  State<EnterPhoneNumberScreen> createState() => _EnterPhoneNumberScreenState();
}

class _EnterPhoneNumberScreenState extends State<EnterPhoneNumberScreen> {
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
        SizedBox(
          width: 90.w,
          child: TextFormField(
            onChanged: (s) {},
            // controller: loginController.signUpemailController,SSS
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
              // errorText: loginController.isValid.value ? errorText : "",
              hintText: "Enter Email",
            ),
          ),
        ),
        ElevatedButton(onPressed: () {}, child: Text("sign"))
      ]),
    );
  }
}
