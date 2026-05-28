import 'package:flutter/material.dart';
import 'package:newst_app/core/constant/app_colors.dart';

class CustomTextFormFeild extends StatefulWidget {
  const CustomTextFormFeild({
    super.key,
    required this.hint,
    this.controller,
    this.validator,
    this.maxLines = 1,
    this.obscureText,
    this.suffixIcon,
  });
  final String hint;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final int? maxLines;
  final bool? obscureText;
  final Widget? suffixIcon;

  @override
  State<CustomTextFormFeild> createState() => _CustomTextFormFeildState();
}

class _CustomTextFormFeildState extends State<CustomTextFormFeild> {
  bool isVisable = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: widget.maxLines,
      validator: widget.validator != null
          ? (String? value) => widget.validator!(value)
          : null,
      style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 15),
      cursorColor: AppColors.primaryColor,
      obscureText: widget.obscureText == true && !isVisable,
      controller: widget.controller,
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      decoration: InputDecoration(
        suffixIcon: widget.obscureText == true
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isVisable = !isVisable;
                  });
                },
                icon: isVisable
                    ? const Icon(Icons.visibility)
                    : const Icon(Icons.visibility_off),
              )
            : null,

        hintText: widget.hint,
        hintStyle: Theme.of(
          context,
        ).textTheme.labelLarge!.copyWith(color: const Color(0xff9E9E9E)),
      ),
    );
  }
}
