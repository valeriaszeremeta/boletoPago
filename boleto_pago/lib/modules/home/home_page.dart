import 'package:boleto_pago/modules/home/home_controller.dart';
import 'package:boleto_pago/modules/meus_boletos/meus_boletos_page.dart';
import 'package:boleto_pago/shared/themes/app_colors.dart';
import 'package:boleto_pago/shared/themes/app_text_style.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();
  final pages = [
    MeusBoletosPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(152),
        child: Container(
          height: 152,
          color: AppColors.appBar,
          child: Center(
            child: ListTile(
              title: Text.rich(
                  TextSpan(text: "Olá", style: TextStyles.homeTitle, children: [
                // TextSpan(
                //     text: "${widget.user.nome}",
                //     style: TextStyles.homeTitleName)
              ])),
              subtitle: Text(
                "Mantenha suas contas em dia",
                style: TextStyles.homeSubtitle,
              ),
              trailing: Container(
                height: 48,
                width: 48,
                child: IconButton(
                  icon: Icon(Icons.logout),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, "/login");
                  },
                ),
              ),
            ),
          ),
        ),
      ),
      body: pages[controller.currentPage],
      bottomNavigationBar: Container(
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                controller.setPage(0);
                setState(() {});
              },
              icon: Icon(Icons.home,
                  color: controller.currentPage == 0
                      ? AppColors.menu
                      : AppColors.menu),
            ),
            GestureDetector(
              onTap: () async {
                await Navigator.pushNamed(context, "/barcode_scanner");
                setState(() {});
              },
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                    color: AppColors.menu,
                    borderRadius: BorderRadius.circular(5)),
                child: Icon(
                  Icons.add_box_outlined,
                  color: AppColors.shape,
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
