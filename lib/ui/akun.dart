import 'package:app_employee_googlesign/Screens/home_screen.dart';
import 'package:app_employee_googlesign/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AkunPage extends StatefulWidget {
  const AkunPage({Key? key}) : super(key: key);

  @override
  _AkunPageState createState() => _AkunPageState();
}

class _AkunPageState extends State<AkunPage> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("user")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "akun",
          style: TextStyle(fontFamily: "Biryani"),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            BackHome(context);
          },
        ),
      ),
      body: Container(
        height: 170,
        width: double.infinity,
        decoration: BoxDecoration(
            // image: DecorationImage(
            //   image: new AssetImage("assets/R.jpg"), fit: BoxFit.contain),
            // boxShadow: [
            //   new BoxShadow(
            //     color: Colors.black,
            //     blurRadius: 8.0,
            //   )
            // ],
            ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Image.asset("assets/user.png"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(),
              child: Text(
                "Nama Pegawai : ${loggedInUser.firstName} ${loggedInUser.secondName}",
                style: TextStyle(
                  color: Colors.black87,
                  fontFamily: "Biryani",
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(),
              child: Text(
                "Email : ${loggedInUser.email}",
                style: TextStyle(
                  color: Colors.black87,
                  fontFamily: "Biryani",
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(),
              child: Text(
                "NIP : ${loggedInUser.NipPegawai}",
                style: TextStyle(
                  color: Colors.black87,
                  fontFamily: "Biryani",
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> BackHome(BuildContext context) async {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
  }
}
