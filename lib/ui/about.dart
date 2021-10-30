import 'dart:ui';

import 'package:app_employee_googlesign/Screens/home_screen.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 4,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.only(),
          child: Text(
            'About',
            style: TextStyle(
              fontFamily: "Biryani",
              fontSize: 18,
            ),
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(),
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              backHome(context);
            },
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 200,
                  child: Image.asset(
                    "assets/1.jpeg",
                    //fit: BoxFit.contain,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(),
                  child: Text(
                    "Fahrul Riza",
                    style: TextStyle(
                      fontFamily: "Biryani",
                      fontSize: 16,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(),
                  child: Text(
                    "Aceh",
                    style: TextStyle(
                      fontFamily: "Biryani",
                      fontSize: 16,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(),
                  child: Text(
                    "Internship Flutter of Uda Coding",
                    style: TextStyle(
                      fontFamily: "Biryani",
                      fontSize: 16,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(),
                  child: Text(
                    " Mahasiswa Politeknik Aceh",
                    style: TextStyle(
                      fontFamily: "Biryani",
                      fontSize: 16,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> backHome(BuildContext context) async {
    //await FirebaseAuth.instance.signOut();
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
  }
}
