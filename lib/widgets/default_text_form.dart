import 'package:flutter/material.dart';

Widget defaultFormText(
        {required TextEditingController control,
        required TextInputType type,
        required dynamic validator,
        Function? onSubmit,
        bool isPassword = false,
        required String label,
        r}) =>
    TextFormField(
        autofocus: true,
        controller: control,
        keyboardType: type,
        validator: validator,
        onFieldSubmitted: (s) {
          onSubmit!(s);
        },
        decoration: InputDecoration(
          label: Text(
            label,
          ),
        ));
