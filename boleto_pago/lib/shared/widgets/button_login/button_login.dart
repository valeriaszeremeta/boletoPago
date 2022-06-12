import 'package:boleto_pago/shared/themes/app_colors.dart';
import 'package:boleto_pago/shared/themes/app_text_style.dart';
import 'package:flutter/material.dart';

class ButtonLogin extends StatelessWidget {
  final VoidCallback onTap;
  const ButtonLogin({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 56,
        decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(30),
            border:
                Border.fromBorderSide(BorderSide(color: AppColors.boletoInfo))),
        child: Row(
          children: [
            Expanded(
                flex: 6,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Entrar",
                      style: TextStyles.titleLogin,
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
