

import 'package:flutter/material.dart';

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
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: InkWell(
        onTap: onpressed,
        child: Container(
          alignment: Alignment.center,
          height: 40,
          width: 320,
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              const SizedBox(
                width: 10,
              ),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }
}
