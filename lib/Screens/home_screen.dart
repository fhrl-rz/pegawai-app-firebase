import 'package:app_employee_googlesign/Navigation_home/button_navigation_home.dart';
import 'package:app_employee_googlesign/Screens/drawer_home.dart';
import 'package:app_employee_googlesign/Screens/login_screen.dart';
import 'package:app_employee_googlesign/model/user_model.dart';
import 'package:app_employee_googlesign/ui/akun.dart';
import 'package:app_employee_googlesign/ui/formAddPegawai.dart';
import 'package:app_employee_googlesign/widget/menu.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController namaPegawaiCont = new TextEditingController();
  final TextEditingController emailPegawaiCont = new TextEditingController();
  final TextEditingController nipPegawaiCont = new TextEditingController();
  final TextEditingController noHpCont = new TextEditingController();
  // User? user = FirebaseAuth.instance.currentUser;
  // UserModel loggedInUser = UserModel();

  // @override
  // void initState() {
  //   super.initState();
  //   FirebaseFirestore.instance
  //       .collection("user")
  //       .doc(user!.uid)
  //       .get()
  //       .then((value) {
  //     this.loggedInUser = UserModel.fromMap(value.data());
  //     setState(() {});
  //   });
  // }

  String? namaPegawai, emailPegawai, nipPegawai, hpPegawai;
  late final List<DocumentSnapshot> document;

  getEmployeeName(name) {
    this.namaPegawai = name;
  }

  getEmployeeEmail(email) {
    this.emailPegawai = email;
  }

  getEmployeeNip(nip) {
    this.nipPegawai = nip;
  }

  getEmployeeHP(hp) {
    this.hpPegawai = hp;
  }

  createemployee() {
    print("created");

    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("add").doc(namaPegawai);

    //create Map
    Map<String, dynamic> addPegawai = {
      "namaPegawai": namaPegawai,
      "emailPegawai": emailPegawai,
      "nipPegawai": nipPegawai,
      "hpPegawai": hpPegawai
    };

    documentReference.set(addPegawai).whenComplete(() {
      print("$namaPegawai created");
    });
  }

  deleteemployee() {
    print("deleted");
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("add").doc(namaPegawai);

    documentReference.delete().whenComplete(() {
      print("$namaPegawai deleted");
    });
  }

  // // reademployee() {
  // //   DocumentReference documentReference =
  // //       FirebaseFirestore.instance.collection("add").doc(namaPegawai);

  // //   documentReference.get().then((datasnapshot) {
  // //     print(datasnapshot.data[""]);
  // //   });
  // // }
  updateemployee() {
    // print("updated");

    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("add").doc(namaPegawai);

    // documentReference.get().then((datasnapshot) {
    //   print(datasnapshot.data);
    // });

    //create Map
    Map<String, dynamic> addPegawai = {
      "namaPegawai": namaPegawai,
      "emailPegawai": emailPegawai,
      "nipPegawai": nipPegawai,
      "hpPegawai": hpPegawai
    };

    documentReference.set(addPegawai).whenComplete(() {
      print("$namaPegawai updated");
    }); // updateemployee() {
  }

  @override
  Widget build(BuildContext context) {
    final NamaPegawaiField = TextFormField(
      autofocus: false,
      controller: namaPegawaiCont,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("Name cannot be empty");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid name (Min. 3 Character)");
        }
        return null;
      },
      onChanged: (String name) {
        getEmployeeName(name);
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: " Nama Pegawai",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    final EmailPegawaiField = TextFormField(
      autofocus: false,
      controller: emailPegawaiCont,
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
      onChanged: (String email) {
        getEmployeeEmail(email);
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: " Email Pegawai",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    final NipPegawaiField = TextFormField(
      autofocus: false,
      controller: nipPegawaiCont,
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
      onChanged: (String nip) {
        getEmployeeNip(nip);
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: " NIP Pegawai",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    final hpPegawaiField = TextFormField(
      autofocus: false,
      controller: noHpCont,
      keyboardType: TextInputType.number,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{12,}$');
        if (value!.isEmpty) {
          return ("No Hp is required for Add Employee");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid NIP (Min.12 Character)");
        }
      },
      onChanged: (String hp) {
        getEmployeeHP(hp);
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: " No HP Pegawai",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    final createButton = RaisedButton(
      color: Colors.green,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      onPressed: () {
        createemployee();
      },
      child: Text(
        "Create",
        style: TextStyle(
          fontFamily: "Biryani",
          color: Colors.black,
        ),
      ),
    );

    final deleteButton = RaisedButton(
      color: Colors.red,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      onPressed: () {
        deleteemployee();
      },
      child: Text(
        "Delete",
        style: TextStyle(
          fontFamily: "Biryani",
          color: Colors.black,
        ),
      ),
    );
    final updateButton = RaisedButton(
      color: Colors.yellow.shade400,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      onPressed: () {
        updateemployee();
      },
      child: Text(
        "Read",
        style: TextStyle(
          fontFamily: "Biryani",
          color: Colors.black,
        ),
      ),
    );

    return Scaffold(
      drawer: DrawerHome(),
      appBar: _buildAppBar(),
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              color: Colors.white,
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    NamaPegawaiField,
                    SizedBox(height: 8),
                    EmailPegawaiField,
                    SizedBox(height: 8),
                    NipPegawaiField,
                    SizedBox(height: 8),
                    hpPegawaiField,
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        createButton,
                        deleteButton,
                        updateButton,
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        textDirection: TextDirection.ltr,
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              "Nama",
                              style: TextStyle(
                                fontFamily: "Allerta",
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "Email",
                              style: TextStyle(
                                fontFamily: "Allerta",
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "NIP",
                              style: TextStyle(
                                fontFamily: "Allerta",
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "No HP",
                              style: TextStyle(
                                fontFamily: "Allerta",
                              ),
                            ),
                          ),
                          // StreamBuilder(
                          //   stream: FirebaseFirestore.instance
                          //       .collection("add")
                          //       .snapshots(),
                          //   builder: (context,
                          //       AsyncSnapshot<QuerySnapshot> snapshots) {
                          //     if (!snapshots.hasData) {
                          //       return ListView.builder(
                          //           itemCount: snapshots.data!.document.Length,
                          //           itemBuilder: (context, index) {
                          //             DocumentSnapshot documentSnapshot =
                          //                 snapshots.data!.document[index];
                          //             return Row(
                          //               children: <Widget>[
                          //                 Expanded(
                          //                     child: documentSnapshot[
                          //                         "namaPegawai"]),
                          //                 Expanded(
                          //                     child: documentSnapshot[
                          //                         "emailPegawai"]),
                          //                 Expanded(
                          //                     child: documentSnapshot[
                          //                         "nipPegawai"]),
                          //                 Expanded(
                          //                     child: documentSnapshot[
                          //                         "hpPegawai"]),
                          //               ],
                          //             );
                          //           });
                          //     }
                          //   },
                          // )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.blueGrey,
      elevation: 4,
      titleSpacing: 0,
      title: Text(
        "App Employee",
        style: TextStyle(
          fontFamily: "Biryani",
          fontSize: 16,
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {
            Akun(context);
          },
          icon: Icon(Icons.account_circle),
        ),
      ],
    );
  }

  Future<void> Akun(BuildContext context) async {
    // await FirebaseAuth.instance.signOut();
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => AkunPage()));
  }
}
