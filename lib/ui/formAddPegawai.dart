import 'package:app_employee_googlesign/Screens/home_screen.dart';
import 'package:flutter/material.dart';

class formAddPegawai extends StatefulWidget {
  const formAddPegawai({Key? key}) : super(key: key);

  @override
  _formAddPegawaiState createState() => _formAddPegawaiState();
}

class _formAddPegawaiState extends State<formAddPegawai> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController namapegawaiController =
      new TextEditingController();
  final TextEditingController emailpegawaiController =
      new TextEditingController();
  final TextEditingController nippegawaiController =
      new TextEditingController();
  // final TextEditingController passwordpegawaiController =
  //     new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final NamapegawaiField = TextFormField(
      autofocus: false,
      controller: namapegawaiController,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("First Name cannot be empty");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid name (Min. 3 Character)");
        }
        return null;
      },
      onSaved: (value) {
        namapegawaiController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.account_circle),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "nama pegawai",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    final EmailpegawaiField = TextFormField(
      autofocus: false,
      controller: emailpegawaiController,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Your Email");
        }

        //req expression for email  validation
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Please Enter a valid email");
        }
        return null;
      },
      onSaved: (value) {
        emailpegawaiController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.mail),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Email",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
    final NippegawaiField = TextFormField(
      autofocus: false,
      controller: nippegawaiController,
      keyboardType: TextInputType.number,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{9,}$');
        if (value!.isEmpty) {
          return ("NIP is required for Register");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid NIP (Min.9 Character)");
        }
      },
      onSaved: (value) {
        nippegawaiController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.mail),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "NIP Pegawai",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
    // final PasspegawaiField = TextFormField();

    final KirimDataPegawai = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blueGrey,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        // onPressed: () {
        //   signUp(emailController.text, passwordController.text);
        // },
        onPressed: () {},
        child: Text(
          "Add Pegawai",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          'Add Pegawai',
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
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 20),
                  NamapegawaiField,
                  SizedBox(height: 20),
                  EmailpegawaiField,
                  SizedBox(height: 20),
                  NippegawaiField,
                  SizedBox(height: 20),
                  // KirimDataPegawai,

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      RaisedButton(
                        color: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        child: Text(
                          "create",
                          style: TextStyle(
                            fontFamily: "Biryani",
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
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
