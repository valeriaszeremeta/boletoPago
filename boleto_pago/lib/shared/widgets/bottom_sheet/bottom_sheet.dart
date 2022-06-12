import 'package:boleto_pago/shared/themes/app_colors.dart';
import 'package:boleto_pago/shared/themes/app_text_style.dart';
import 'package:boleto_pago/shared/widgets/set_buttons/set_label_buttons.dart';
import 'package:flutter/material.dart';

class BottomSheetWidget extends StatelessWidget {
  final String labelPrimary;
  final VoidCallback onTapPrimary;
  final String labelSecondary;
  final VoidCallback onTapSecondary;
  final String title;
  final String subtitle;

  const BottomSheetWidget(
      {Key? key,
      required this.labelPrimary,
      required this.onTapPrimary,
      required this.labelSecondary,
      required this.onTapSecondary,
      required this.title,
      required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RotatedBox(
        quarterTurns: 1,
        child: Material(
          child: Container(
            color: AppColors.shape,
            child: Column(
              children: [
                Expanded(
                    child: Container(color: Colors.black.withOpacity(0.6))),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(40),
                      child: Text.rich(
                        TextSpan(
                            text: title,
                            style: TextStyles.textLabelBold,
                            children: [
                              TextSpan(
                                  text: "\n$subtitle",
                                  style: TextStyles.textLabel),
                            ]),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(height: 1, color: AppColors.stroke),
                    SetLabelButtons(
                      enablePrimaryColor: true,
                      labelPrimary: labelPrimary,
                      onTapPrimary: onTapPrimary,
                      labelSecondary: labelSecondary,
                      onTapSecondary: onTapSecondary,
                    ),
                    SizedBox(height: 2),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
