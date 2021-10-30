import 'package:app_employee_googlesign/Screens/home_screen.dart';
import 'package:flutter/material.dart';

class FormEditPegawaiPage extends StatefulWidget {
  const FormEditPegawaiPage({Key? key}) : super(key: key);

  @override
  _FormEditPegawaiPageState createState() => _FormEditPegawaiPageState();
}

class _FormEditPegawaiPageState extends State<FormEditPegawaiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          'Edit Pegawai',
          style: TextStyle(fontFamily: "Biryani"),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            //kembali ke page menu utama
            BackHome(context);
          },
        ),
      ),
    );
  }

  Future<void> BackHome(BuildContext context) async {
    //  await FirebaseAuth.instance.signOut();
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
  }
}
