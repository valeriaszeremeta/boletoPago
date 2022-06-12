import 'package:boleto_pago/shared/themes/app_colors.dart';
import 'package:boleto_pago/shared/themes/app_images.dart';
import 'package:boleto_pago/shared/themes/app_text_style.dart';
import 'package:flutter/material.dart';

class SocialLogin extends StatelessWidget {
  final VoidCallback onTap;
  const SocialLogin({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 56,
        decoration: BoxDecoration(
            color: AppColors.shape,
            borderRadius: BorderRadius.circular(30),
            border: Border.fromBorderSide(BorderSide(color: AppColors.stroke))),
        child: Row(
          children: [
            Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppImages.google),
                    SizedBox(width: 16),
                    Container(height: 56, width: 1, color: AppColors.stroke)
                  ],
                )),
            Expanded(
                flex: 6,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Entrar com Google",
                      style: TextStyles.buttonGoogle,
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
