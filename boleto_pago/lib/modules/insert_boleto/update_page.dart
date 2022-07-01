import 'dart:math';

import 'package:boleto_pago/modules/insert_boleto/update_controller.dart';
import 'package:boleto_pago/shared/models/boleto_model.dart';
import 'package:boleto_pago/shared/themes/app_colors.dart';
import 'package:boleto_pago/shared/themes/app_text_style.dart';
import 'package:boleto_pago/shared/widgets/input_text/input_text_widget.dart';
import 'package:boleto_pago/shared/widgets/set_buttons/set_label_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UpdateBoletoPage extends StatefulWidget {
  final String? barcode;
  final BoletoModel boleto;
  const UpdateBoletoPage({
    Key? key,
    this.barcode,
    required this.boleto,
  }) : super(key: key);

  @override
  _UpdateBoletoPageState createState() => _UpdateBoletoPageState();
}

class _UpdateBoletoPageState extends State<UpdateBoletoPage> {
  final controller = UpdateBoletoController();
  final formKey = GlobalKey<FormState>();
  final moneyInputTextController = MoneyMaskedTextController(
      leftSymbol: "R\$", initialValue: 0, decimalSeparator: ",");
  final dueDateInputTextController = MaskedTextController(mask: "00/00/0000");
  final name = TextEditingController();
  final observacao = TextEditingController();

  @override
  void initState() {
    name.text = widget.boleto.name!;
    dueDateInputTextController.text = widget.boleto.dueDate!;
    moneyInputTextController.text = widget.boleto.value.toString();
    observacao.text = widget.boleto.observacao!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: BackButton(
          color: AppColors.title,
        ),
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
                  "Preencha os dados do boleto",
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
                    InputTextWidget(
                      controller: name,
                      label: "Nome do Boleto",
                      icon: Icons.description_outlined,
                      validator: controller.validateName,
                      onChanged: (value) {
                        controller.onChange(name: value);
                      },
                    ),
                    InputTextWidget(
                      controller: dueDateInputTextController,
                      label: "Vencimento",
                      icon: FontAwesomeIcons.timesCircle,
                      validator: controller.validateVencimento,
                      onChanged: (value) {
                        controller.onChange(dueDate: value);
                      },
                    ),
                    InputTextWidget(
                      controller: moneyInputTextController,
                      label: "Valor",
                      icon: Icons.monetization_on_outlined,
                      validator: (_) => controller
                          .validateValor(moneyInputTextController.numberValue),
                      onChanged: (value) {
                        controller.onChange(
                            value: moneyInputTextController.numberValue);
                      },
                    ),
                    InputTextWidget(
                      controller: observacao,
                      label: "Observações",
                      icon: Icons.device_unknown_sharp,
                      onChanged: (value) {
                        controller.onChange(observacao: value);
                      },
                    )
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
            labelPrimary: "Deletar",
            onTapPrimary: () async {
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: Text('Excluir Boleto'),
                  content: Text('Tem certeza?'),
                  actions: <Widget>[
                    //elevatedButton
                    ElevatedButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: Text('Não')),
                    ElevatedButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        child: Text('Sim'))
                  ],
                ),
              ).then((confirmed) async {
                if (confirmed) {
                  await controller.deleteBoleto(widget.boleto.boletoId!);
                  Navigator.pop(context);
                }
              });
            },
            labelSecondary: "Editar Boleto",
            onTapSecondary: () async {
              controller.updateBoleto(boletoId: widget.boleto.boletoId!, name: name.text, dueDate: dueDateInputTextController.text,
               value: moneyInputTextController.text, observacao: observacao.text);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
