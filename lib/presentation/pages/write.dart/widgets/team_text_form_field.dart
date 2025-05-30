import 'package:flutter/material.dart';

class TeamTextFormField extends StatelessWidget {
  final TextEditingController controller;

  const TeamTextFormField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      maxLength: 20,
      style: TextStyle(
        color: Color(0xff222222),
      ),
      decoration: InputDecoration(
          labelText: '팀',
          labelStyle: TextStyle(
            color: Color(0xff222222),
          )),
      validator: (value) {
        if (value?.trim().isEmpty ?? true) {
          return '팀을 입력해 주세요';
        }

        return null;
      },
    );
  }
}
