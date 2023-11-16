import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../constants/constants.dart';
import 'form_icon.dart';

class AppFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String labelText;
  final bool enabled;

  const AppFormField({
    required this.labelText,
    required this.validator,
    required this.controller,
    required this.enabled,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const FormIcon(),
        const Gap(AppSizes.formHorizontalPadding),
        Expanded(
          child: TextFormField(
            enabled: enabled,
            controller: controller,
            validator: validator,
            decoration: InputDecoration(labelText: labelText),
          ),
        ),
      ],
    );
  }
}
