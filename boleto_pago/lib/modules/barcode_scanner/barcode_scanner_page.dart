import 'package:boleto_pago/modules/barcode_scanner/barcode_scanner_controller.dart';
import 'package:boleto_pago/modules/barcode_scanner/barcode_scanner_status.dart';
import 'package:boleto_pago/shared/themes/app_colors.dart';
import 'package:boleto_pago/shared/themes/app_text_style.dart';
import 'package:boleto_pago/shared/widgets/bottom_sheet/bottom_sheet.dart';
import 'package:boleto_pago/shared/widgets/set_buttons/set_label_buttons.dart';
import 'package:flutter/material.dart';

class BarcodeScannerPage extends StatefulWidget {
  const BarcodeScannerPage({Key? key}) : super(key: key);

  @override
  _BarcodeScannerPageState createState() => _BarcodeScannerPageState();
}

class _BarcodeScannerPageState extends State<BarcodeScannerPage> {
  final controller = BarcodeScannerController();

  @override
  void initState() {
    controller.getAvailableCameras();
    controller.statusNotifier.addListener(() {
      if (controller.status.hasBarcode) {
        Navigator.pushReplacementNamed(context, "/insert_boleto",
            arguments: controller.status.barcode);
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      left: true,
      right: true,
      child: Stack(
        children: [
          ValueListenableBuilder<BarcodeScannerStatus>(
              valueListenable: controller.statusNotifier,
              builder: (_, status, __) {
                if (status.showCamera) {
                  return Container(
                    color: Colors.blue,
                    child: controller.cameraController!.buildPreview(),
                  );
                } else {
                  return Container();
                }
              }),
          RotatedBox(
            quarterTurns: 1,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.black,
                title: Text(
                  "Escaneie o c??digo de barras do boleto",
                  style: TextStyles.scannerTitle,
                ),
                centerTitle: true,
                leading: BackButton(
                  color: AppColors.background,
                ),
              ),
              body: Column(
                children: [
                  Expanded(
                      child: Container(
                    color: Colors.black.withOpacity(0.6),
                  )),
                  Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.transparent,
                      )),
                  Expanded(
                      child: Container(
                    color: Colors.black.withOpacity(0.6),
                  ))
                ],
              ),
              bottomNavigationBar: SetLabelButtons(
                labelPrimary: "Inserir c??digo do boleto",
                onTapPrimary: () {
                  Navigator.pushReplacementNamed(context, "/insert_boleto");
                },
                labelSecondary: "Adicionar da galeria",
                onTapSecondary: () {},
              ),
            ),
          ),  
          ValueListenableBuilder<BarcodeScannerStatus>(
              valueListenable: controller.statusNotifier,
              builder: (_, status, __) {
                if (status.hasError) {
                  return BottomSheetWidget(
                    title: "N??o foi poss??vel identificar um c??digo de boleto",
                    subtitle: "Tente escanear novamente ou digite o c??digo",
                    labelPrimary: "Escanear Novamente",
                    onTapPrimary: () {
                      controller.scanWithCamera();
                    },
                    labelSecondary: "Digitar c??digo",
                    onTapSecondary: () {
                      Navigator.pushReplacementNamed(context, "/insert_boleto");
                    },
                  );
                } else {
                  return Container();
                }
              }),
        ],
      ),
    );
  }
}
