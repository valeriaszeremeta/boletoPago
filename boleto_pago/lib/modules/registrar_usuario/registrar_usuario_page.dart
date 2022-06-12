import 'package:boleto_pago/modules/registrar_usuario/registrar_usuario_controller.dart';
import 'package:boleto_pago/shared/themes/app_colors.dart';
import 'package:boleto_pago/shared/themes/app_text_style.dart';
import 'package:boleto_pago/shared/widgets/set_buttons/set_label_buttons.dart';
import 'package:flutter/material.dart';

class RegistrarUsuarioPage extends StatefulWidget {
  const RegistrarUsuarioPage({
    Key? key,
  }) : super(key: key);

  @override
  _RegistrarUsuarioPageState createState() => _RegistrarUsuarioPageState();
}

class _RegistrarUsuarioPageState extends State<RegistrarUsuarioPage> {
  final controller = RegistrarUsuarioController();
  final _formKey = GlobalKey<FormState>();

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
                  "Insira seus dados e crie sua conta",
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
                      keyboardType: TextInputType.text,
                      validator: controller.validateName,
                      style: TextStyles.input,
                      decoration: InputDecoration(
                        labelText: "Nome Completo",
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
                        controller.onChange(nome: value);
                      },
                    ),
                    Divider(
                      height: 1,
                      thickness: 1,
                      color: AppColors.stroke,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyles.input,
                      validator: controller.validateEmail,
                      decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle: TextStyles.input,
                        icon: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 18),
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
                      obscureText: true,
                      style: TextStyles.input,
                      validator: controller.validateSenha,
                      decoration: InputDecoration(
                        labelText: "Senha",
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
                    TextFormField(
                      keyboardType: TextInputType.text,
                      style: TextStyles.input,
                      validator: controller.validateSenha,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Repita sua senha",
                        labelStyle: TextStyles.input,
                        icon: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 18),
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
            labelSecondary: "Criar Conta",
            onTapSecondary: () {
              if (controller.cadastrarUsuario()) {
                Navigator.pop(context);
              }
            },
          ),
        ],
      ),
    );
  }
}
