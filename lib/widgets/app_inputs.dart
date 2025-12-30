import 'package:flutter/material.dart';

class AppInputs extends StatelessWidget {
  final String hint;
  final int lines;
  final Icon? inputIcon;
  final TextEditingController? data;
  final bool? read;

  final void Function()? onTap;
  Function(String)? onChanged;
  final String? Function(String?)? validator;

  AppInputs({
    super.key,
    required this.hint,
    this.data,
    this.lines = 1,
    this.onChanged,
    this.inputIcon,
    this.read,
    this.onTap,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      onChanged: onChanged,
      validator:
          validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return "this field is required";
            }
            return null;
          },
      maxLines: lines,
      readOnly: read ?? false,
      controller: data,
      onTapOutside: (value) {
        FocusScope.of(context).unfocus();
      },
      decoration: InputDecoration(
        suffixIcon: inputIcon ?? inputIcon,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFF00418A)),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        hint: Text(
          hint,
          style: const TextStyle(fontSize: 10, color: Colors.grey),
        ),
      ),
    );
  }
}
