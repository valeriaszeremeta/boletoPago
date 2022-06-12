import 'package:boleto_pago/modules/recuperar_senha/recuperar_senha_controller.dart';
import 'package:boleto_pago/shared/themes/app_colors.dart';
import 'package:boleto_pago/shared/themes/app_text_style.dart';
import 'package:boleto_pago/shared/widgets/set_buttons/set_label_buttons.dart';
import 'package:flutter/material.dart';

class RecuperarSenhaPage extends StatefulWidget {
  const RecuperarSenhaPage({Key? key}) : super(key: key);

  @override
  State<RecuperarSenhaPage> createState() => _RecuperarSenhaPageState();
}

class _RecuperarSenhaPageState extends State<RecuperarSenhaPage> {
  final controller = RecuperarSenhaController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Text(
                  "Recupere sua senha",
                  style: TextStyles.labelTitle,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyles.input,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Insira seu email",
                        labelStyle: TextStyles.input,
                        icon: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 18),
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
                        controller.onChange(senha: value);
                      },
                    ),
                    Divider(
                      height: 1,
                      thickness: 1,
                      color: AppColors.stroke,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(
            height: 1,
            thickness: 1,
            color: AppColors.stroke,
          ),
          SetLabelButtons(
            enableSecondaryColor: true,
            labelPrimary: "Cancelar",
            onTapPrimary: () {
              Navigator.pushReplacementNamed(context, "/login");
            },
            labelSecondary: "Recuperar Senha",
            onTapSecondary: () async {
              await controller.recuperarSenha();
              Navigator.pushReplacementNamed(context, "/login");
            },
          ),
        ],
      ),
    );
  }
}
