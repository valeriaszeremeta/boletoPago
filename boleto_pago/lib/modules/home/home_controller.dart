import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeController {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
  var currentPage = 0;

  void setPage(int index) {
    currentPage = index;
  }
  logout() async {
    await FirebaseAuth.instance.signOut();
  }

  
}
