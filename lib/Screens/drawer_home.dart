import 'package:app_employee_googlesign/Screens/home_screen.dart';
import 'package:app_employee_googlesign/Screens/login_screen.dart';
import 'package:app_employee_googlesign/ui/about.dart';
import 'package:app_employee_googlesign/ui/formAddPegawai.dart';
import 'package:app_employee_googlesign/ui/formEditPegawai.dart';
import 'package:app_employee_googlesign/ui/formUpdatePegawai.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DrawerHome extends StatelessWidget {
  const DrawerHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Drawer(
            child: SingleChildScrollView(
      child: Column(children: <Widget>[
        Padding(
          padding: EdgeInsets.only(),
          child: ListTile(
            //  leading: Icon(Icons.home),
            title: Text(
              "App Employee",
              style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Biryani",
                  color: Colors.blueGrey),
            ),
          ),
        ),
        Divider(),
        // Padding(
        //   padding: EdgeInsets.only(),
        //   child: ListTile(
        //     leading: Icon(Icons.add_circle),
        //     title: Text(
        //       "Add Pegawai",
        //       style: TextStyle(
        //         fontSize: 14.0,
        //         fontWeight: FontWeight.bold,
        //         fontFamily: "Allerta",
        //       ),
        //     ),
        //     onTap: () {
        //       AddPegawai(context);
        //     },
        //   ),
        // ),
        // Padding(
        //   padding: EdgeInsets.only(),
        //   child: ListTile(
        //     leading: Icon(Icons.add_circle),
        //     title: Text(
        //       "Edit Pegawai",
        //       style: TextStyle(
        //         fontSize: 14.0,
        //         fontWeight: FontWeight.bold,
        //         fontFamily: "Allerta",
        //       ),
        //     ),
        //     onTap: () {
        //       EditPegawai(context);
        //     },
        //   ),
        // ),
        // Padding(
        //   padding: EdgeInsets.only(),
        //   child: ListTile(
        //     leading: Icon(Icons.add_circle),
        //     title: Text(
        //       "Update Pegawai",
        //       style: TextStyle(
        //         fontSize: 14.0,
        //         fontWeight: FontWeight.bold,
        //         fontFamily: "Allerta",
        //       ),
        //     ),
        //     onTap: () {
        //       UpdatePegawai(context);
        //     },
        //   ),
        // ),
        Padding(
          padding: EdgeInsets.only(),
          child: ListTile(
            leading: Icon(Icons.security_update_warning),
            title: Text(
              "About",
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                fontFamily: "Allerta",
              ),
            ),
            onTap: () {
              _about(context);
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(),
          child: ListTile(
            leading: Icon(Icons.exit_to_app_rounded),
            title: Text(
              "LogOut",
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                fontFamily: "Allerta",
              ),
            ),
            onTap: () {
              Logout(context);
            },
          ),
        ),
        Divider(),
      ]),
    )));
  }

  Future<void> AddPegawai(BuildContext context) async {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => formAddPegawai()));
  }

  Future<void> _about(BuildContext context) async {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => AboutPage()));
  }

  Future<void> EditPegawai(BuildContext context) async {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => FormEditPegawaiPage()));
  }

  Future<void> UpdatePegawai(BuildContext context) async {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => FormUpdatePegawaiPage()));
  }

  Future<void> Logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
  }
}

