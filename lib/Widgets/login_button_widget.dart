import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LoginCardWidget extends StatelessWidget {
  final String title;
  final Icon icon;
  final Function() onpressed;
  const LoginCardWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.onpressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: InkWell(
        onTap: onpressed,
        child: Container(
          alignment: Alignment.center,
          height: 5.h,
          width: 90.w,
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              SizedBox(
                width: 5.w,
              ),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }
}
