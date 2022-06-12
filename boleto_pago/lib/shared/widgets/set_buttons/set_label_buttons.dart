import 'package:boleto_pago/shared/themes/app_colors.dart';
import 'package:boleto_pago/shared/widgets/divider/divider_widget.dart';
import 'package:boleto_pago/shared/widgets/label_button/label_button.dart';
import 'package:flutter/material.dart';

class SetLabelButtons extends StatelessWidget {
  final String labelPrimary;
  final VoidCallback onTapPrimary;
  final String labelSecondary;
  final VoidCallback onTapSecondary;
  final bool enablePrimaryColor;
  final bool enableSecondaryColor;
 
  const SetLabelButtons(
      {Key? key,
      required this.labelPrimary,
      required this.onTapPrimary,
      required this.labelSecondary,
      required this.onTapSecondary,
      this.enablePrimaryColor = false,
      this.enableSecondaryColor = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.shape,
      height: 57,
      child: Row(
          children: [
            if (enablePrimaryColor) ...[
              LabelButton.primary(
                label: labelPrimary,
                onPressed: onTapPrimary,
              ),
            ] else ...[
              LabelButton.heading(
                label: labelPrimary,
                onPressed: onTapPrimary,
              ),
            ],
            DividerWidget(
              height: 56,
            ),
            if (enableSecondaryColor) ...[
              LabelButton.primary(
                label: labelSecondary,
                onPressed: onTapSecondary,
              ),
            ] else ...[
              LabelButton.heading(
                label: labelSecondary,
                onPressed: onTapSecondary,
              ),
            ],
          ],
        ));
  }
}
