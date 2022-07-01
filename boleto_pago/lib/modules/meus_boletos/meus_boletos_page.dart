import 'package:boleto_pago/modules/insert_boleto/update_page.dart';
import 'package:boleto_pago/shared/models/boleto_model.dart';
import 'package:boleto_pago/shared/themes/app_text_style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class MeusBoletosPage extends StatefulWidget {
  MeusBoletosPage({Key? key}) : super(key: key);

  @override
  _MeusBoletosPageState createState() => _MeusBoletosPageState();
}

class _MeusBoletosPageState extends State<MeusBoletosPage> {
  final dueDateInputTextController = MaskedTextController(mask: "00/00/0000");
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  BoletoModel boletos = BoletoModel();
  var uid = '';
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Meus Boletos', style: TextStyles.titleBoletos),
        ),
        body: StreamBuilder<List<BoletoModel>>(
            stream: getBoletos(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('data! ${snapshot.error}');
              } else if (snapshot.hasData) {
                final boletos = snapshot.data!;
                return ListView(
                  children: boletos.map(buildBoletos).toList(),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
      );
  Widget buildBoletos(BoletoModel boleto) => ListTile(
        contentPadding:
            EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 3),
        title: Text(
          '${boleto.name}',
          style: TextStyles.trailingBold,
        ),
        subtitle: Text(
          "Vence em ${boleto.dueDate}",
          style: TextStyles.trailingLight,
        ),
        trailing: Text.rich(TextSpan(
          text: "R\$ ",
          style: TextStyles.trailingLight,
          children: [
            TextSpan(
              text: "${boleto.value!.toStringAsFixed(2).replaceAll('.', ',')}",
              style: TextStyles.trailingBold,
            ),
          ],
        )),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => UpdateBoletoPage(boleto: boleto)));
        },
      );

  Stream<List<BoletoModel>> getBoletos() => FirebaseFirestore.instance
      .collection('boletos')
      .where("userId", isEqualTo: this._auth.currentUser!.uid)
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => BoletoModel.fromJson(doc.data()))
          .toList());
}
