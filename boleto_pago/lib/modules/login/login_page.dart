import 'package:boleto_pago/modules/login/login_controller.dart';
import 'package:boleto_pago/shared/themes/app_colors.dart';
import 'package:boleto_pago/shared/themes/app_images.dart';
import 'package:boleto_pago/shared/themes/app_text_style.dart';
import 'package:boleto_pago/shared/widgets/button_login/button_login.dart';
import 'package:boleto_pago/shared/widgets/social-login/social_form_login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = LoginController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Container(
              color: AppColors.background,
              width: size.width,
              height: size.height * 0.50,
            ),
            Positioned(
              top: 55,
              left: 0,
              right: 0,
              child: Image.asset(AppImages.union, width: 208, height: 265),
            ),
            Positioned(
                top: 90,
                left: 0,
                right: 0,
                child: Column(children: [
                  Image.asset(AppImages.logo),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 70, right: 70, top: 20),
                    child: Text(
                      "Organize seus boletos em um só lugar",
                      style: TextStyles.titleLogin,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 90, left: 15, right: 15),
                    child: Form(
                        key: controller.formKey,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                validator: controller.validateEmail,
                                style: TextStyles.input,
                                decoration: InputDecoration(
                                  labelText: "Email",
                                  labelStyle: TextStyles.input,
                                  icon: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 18),
                                        child: Icon(Icons.email_outlined,
                                            color: AppColors.title),
                                      ),
                                      Container(
                                        width: 1,
                                        height: 48,
                                      )
                                    ],
                                  ),
                                  border: InputBorder.none,
                                ),
                                onChanged: (value) {
                                  controller.onChange(email: value);
                                },
                              ),
                              Divider(
                                height: 1,
                                thickness: 1,
                                color: AppColors.stroke,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.text,
                                style: TextStyles.input,
                                obscureText: true,
                                validator: controller.validateSenha,
                                decoration: InputDecoration(
                                  labelText: "Senha",
                                  labelStyle: TextStyles.input,
                                  icon: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 18),
                                        child: Icon(Icons.lock_outline_rounded,
                                            color: AppColors.title),
                                      ),
                                      Container(
                                        width: 1,
                                        height: 48,
                                      )
                                    ],
                                  ),
                                  border: InputBorder.none,
                                ),
                                onChanged: (value) {
                                  controller.onChange(senha: value);
                                },
                              ),
                              Divider(
                                height: 1,
                                thickness: 1,
                                color: AppColors.stroke,
                              ),
                            ])),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40, top: 5),
                    child: ButtonLogin(
                      onTap: () {
                        if (controller.login()) {
                          Navigator.pop(context);
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40, top: 5),
                    child: SocialLogin(
                      onTap: () {
                        controller.signInwithGoogle(context);
                      },
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10, top: 10),
                      child: Text.rich(TextSpan(
                        text: "Não tem uma conta? ",
                        style: TextStyles.textLight,
                        children: [
                          TextSpan(
                            text: "Clique Aqui",
                            style: TextStyles.textBold,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Navigator.pushReplacementNamed(
                                  context, "/registrar_usuario"),
                          ),
                        ],
                      )),
                    ),
                  ),
                  Text.rich(TextSpan(
                    text: "Esqueceu sua senha? ",
                    style: TextStyles.textLight,
                    children: [
                      TextSpan(
                        text: "Clique Aqui",
                        style: TextStyles.textBold,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Navigator.pushReplacementNamed(
                              context, "/recuperar_senha"),
                      ),
                    ],
                  ))
                ]))
          ],
        ),
      ),
    );
  }
}
