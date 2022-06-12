import 'package:boleto_pago/modules/barcode_scanner/barcode_scanner_page.dart';
import 'package:boleto_pago/modules/home/home_page.dart';
import 'package:boleto_pago/modules/insert_boleto/insert_boleto_page.dart';
import 'package:boleto_pago/modules/recuperar_senha/recuperar_senha_page.dart';
import 'package:boleto_pago/modules/registrar_usuario/registrar_usuario_page.dart';
import 'package:boleto_pago/modules/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'modules/login/login_page.dart';
import 'shared/themes/app_colors.dart';

class AppWidget extends StatelessWidget {
  AppWidget() {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Boleto Pago',
        theme: ThemeData(
            primarySwatch: Colors.blue, primaryColor: AppColors.background),
        initialRoute: "/splash",
        routes: {
          "/splash": (context) => SplashPage(),
          "/home": (context) => HomePage(),
          "/login": (context) => LoginPage(),
          "/registrar_usuario": (context) => RegistrarUsuarioPage(),
          "/recuperar_senha": (context) => RecuperarSenhaPage(),
          "/barcode_scanner": (context) => BarcodeScannerPage(),
          "/insert_boleto": (context) => InsertBoletoPage(
                barcode: ModalRoute.of(context) != null
                    ? ModalRoute.of(context)!.settings.arguments.toString()
                    : null,
              ),
        });
  }
}
