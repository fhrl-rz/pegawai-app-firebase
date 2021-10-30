import 'package:app_employee_googlesign/Screens/home_screen.dart';
import 'package:flutter/material.dart';

class FormUpdatePegawaiPage extends StatefulWidget {
  const FormUpdatePegawaiPage({Key? key}) : super(key: key);

  @override
  _FormUpdatePegawaiPageState createState() => _FormUpdatePegawaiPageState();
}

class _FormUpdatePegawaiPageState extends State<FormUpdatePegawaiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          'Update Pegawai',
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
