import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  final int? maxline;
  final int? maxLength;
  final double? height;
  final double? hintSize;
  final FontWeight? fontWeight;
  final double? borderRadius;
  final double? horizontalPadding;
  final double? verticalPadding;
  final EdgeInsetsGeometry? contentPadding;
  final String? hint;
  final String? labelText;
  final String? initialValue;
  final bool? obscureText;
  final bool filled;
  final bool? isCollapsed;
  final bool? isDense;
  final bool? isEnabled;
  final bool? readOnly;
  final Color? fillColor;
  final Color? hintColor;
  final Color? inputColor;
  final Color? borderColor;
  final Color? focusBorderColor;
  final Color? cursorColor;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextInputAction? inputAction;
  final AutovalidateMode? autoValidateMode;
  final TextStyle? textStyle;
  final TextStyle? errorTextStyle;
  final InputDecoration? customDecoration;
  final String? semanticLabel;
  final List<TextInputFormatter>? inputFormatters;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final void Function(PointerDownEvent)? onTapOutside;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  const CustomTextFormField({
    super.key,
    this.maxline,
    this.maxLength,
    this.height,
    this.hintSize,
    this.fontWeight,
    this.borderRadius,
    this.horizontalPadding,
    this.verticalPadding,
    this.contentPadding,
    this.hint,
    this.labelText,
    this.initialValue,
    this.obscureText,
    this.filled = true,
    this.isCollapsed,
    this.isDense,
    this.isEnabled,
    this.readOnly,
    this.fillColor,
    this.hintColor,
    this.inputColor,
    this.borderColor,
    this.focusBorderColor,
    this.cursorColor,
    this.suffixIcon,
    this.prefixIcon,
    this.focusNode,
    this.keyboardType,
    this.inputAction,
    this.autoValidateMode,
    this.textStyle,
    this.errorTextStyle,
    this.customDecoration,
    this.semanticLabel,
    this.inputFormatters,
    this.onTap,
    this.onChanged,
    this.onFieldSubmitted,
    this.onTapOutside,
    this.validator,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 55, // Set height to 55 if not provided
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        maxLength: maxLength,
        obscureText: obscureText ?? false,
        cursorColor: cursorColor,
        maxLines: (obscureText ?? false)
            ? 1
            : (maxline ?? 1), // Ensure obscureText is single line
        textInputAction: inputAction,
        initialValue: initialValue,
        style: textStyle,
        autofocus: false,
        keyboardType: keyboardType,
        onChanged: onChanged,
        inputFormatters: inputFormatters ,
        autovalidateMode:
            autoValidateMode ?? AutovalidateMode.onUserInteraction,
        readOnly: readOnly ?? false,
        enabled: isEnabled ?? true,
        decoration: customDecoration ??
            InputDecoration(
              labelText: labelText,
              counterText: '',
              hintText: hint,
              hintStyle: TextStyle(
                  color: hintColor ?? const Color(0xff9D9E9F),
                  fontSize: hintSize ?? 12,
                  fontWeight: fontWeight ?? FontWeight.w400),
              filled: filled,
              fillColor: fillColor ?? const Color(0xffF9F9F9),
              prefixIcon: prefixIcon,
              suffixIconColor: const Color(0xff9D9E9F),
              suffixIcon: suffixIcon,
              contentPadding: contentPadding ??
                  EdgeInsets.symmetric(
                    horizontal: horizontalPadding ?? 20.0,
                    vertical: verticalPadding ?? 10,
                  ),
              errorStyle: errorTextStyle,
              errorMaxLines: 2,
              isCollapsed: isCollapsed ?? false,
              isDense: isDense,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: borderColor ?? Colors.transparent,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(borderRadius ?? 10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: focusBorderColor ?? Colors.transparent,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(borderRadius ?? 10),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: borderColor ?? Colors.transparent,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(borderRadius ?? 10),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: borderColor ?? Colors.transparent,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(borderRadius ?? 10),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: borderColor ?? Colors.transparent,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(borderRadius ?? 10),
              ),
            ),
        validator:validator ,
        onFieldSubmitted: onFieldSubmitted,
        onTapOutside: onTapOutside ??
            (event) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
      ),
    );
  }

}


