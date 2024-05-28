import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? errorMessage;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final Icon icon;
  final bool? obscureText;

  const CustomTextFormField({
    super.key, 
    this.label, 
    this.hint, 
    this.errorMessage, 
    this.onChanged, 
    this.validator, 
    required this.icon, 
    this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final border = OutlineInputBorder(
      //borderSide: BorderSide(color: colors.primary),
      borderRadius: BorderRadius.circular(30)
    );
    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText != null ? obscureText! : false,
      decoration: InputDecoration(
        enabledBorder: border,
        focusedBorder: border.copyWith(borderSide: BorderSide(color: colors.primary)),
        errorBorder: border.copyWith(borderSide: const BorderSide(color: Colors.red)),
        focusedErrorBorder: border.copyWith(borderSide: const BorderSide(color: Colors.red)),
        

        isDense: true,
        label: label != null ? Text(label!) : null,
        hintText: hint,
        suffixIcon: icon,
        focusColor: colors.primary,
        errorText: errorMessage//'No se ha diligenciado este campo',
      ),
    );
  }
}