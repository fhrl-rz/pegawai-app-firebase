// import 'package:flutter/material.dart';

// class BottomNavigationBarEmployee extends StatefulWidget {
//   const BottomNavigationBarEmployee({Key? key}) : super(key: key);

//   @override
//   _BottomNavigationBarEmployeeState createState() =>
//       _BottomNavigationBarEmployeeState();
// }

// class _BottomNavigationBarEmployeeState
//     extends State<BottomNavigationBarEmployee> {

//       int _selectedIndex =0;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 64,
//       decoration: BoxDecoration(
//         color: Colors.amberAccent,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.3),
//             spreadRadius: 2,
//             blurRadius: 15,
//             offset: Offset(0, 5)
//           )
//         ],
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(24), 
//           topRight: Radius.circular(24),
//           ),
//       ),
//       child: BottomNavigationBar(items: <BottomNavigationBarItem>[
//         BottomNavigationBarItem(
//           icon: _selectedIndex == 0
//         ? new SvgPicture.asset('assets/icons/home.svg')
//         : new SvgPicture.asset('assets/icons/home(1).svg'),
//         title: Text('Home')
//         )
//       ]),
//     );
//   }
// }


// body: Padding(
      //   padding: const EdgeInsets.all(16.0),
      //   child: Column(
      //     children: <Widget>[
      //       Padding(
      //         padding: const EdgeInsets.only(bottom: 5.0),
      //         child: TextFormField(
      //           decoration: InputDecoration(
      //             labelText: "Nama Pegawai",
      //             fillColor: Colors.white,
      //             focusedBorder: OutlineInputBorder(
      //               borderSide: BorderSide(
      //                 color: Colors.blue,
      //                 width: 2.0,
      //               ),
      //             ),
      //           ),
      //           onChanged: (String name) {
      //             getEmployeeName(name);
      //           },
      //         ),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.only(bottom: 5.0),
      //         child: TextFormField(
      //           decoration: InputDecoration(
      //             labelText: "Email Pegawai",
      //             fillColor: Colors.white,
      //             focusedBorder: OutlineInputBorder(
      //               borderSide: BorderSide(
      //                 color: Colors.blue,
      //                 width: 2.0,
      //               ),
      //             ),
      //           ),
      //           onChanged: (String email) {
      //             getEmployeeEmail(email);
      //           },
      //         ),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.only(bottom: 5.0),
      //         child: TextFormField(
      //           keyboardType: TextInputType.number,
      //           decoration: InputDecoration(
      //             labelText: "NIP Pegawai",
      //             fillColor: Colors.white,
      //             focusedBorder: OutlineInputBorder(
      //               borderSide: BorderSide(
      //                 color: Colors.blue,
      //                 width: 2.0,
      //               ),
      //             ),
      //           ),
      //           onChanged: (String nip) {
      //             getEmployeeNip(nip);
      //           },
      //         ),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.only(bottom: 5.0),
      //         child: TextFormField(
      //           keyboardType: TextInputType.number,
      //           decoration: InputDecoration(
      //             labelText: "No.Hp Pegawai",
      //             fillColor: Colors.white,
      //             focusedBorder: OutlineInputBorder(
      //               borderSide: BorderSide(
      //                 color: Colors.blue,
      //                 width: 2.0,
      //               ),
      //             ),
      //           ),
      //           onChanged: (String hp) {
      //             getEmployeeHP(hp);
      //           },
      //         ),
      //       ),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //         children: <Widget>[
      //           RaisedButton(
      //             color: Colors.green,
      //             shape: RoundedRectangleBorder(
      //                 borderRadius: BorderRadius.circular(16)),
      //             child: Text(
      //               "create",
      //               style: TextStyle(
      //                 fontFamily: "Biryani",
      //                 color: Colors.white,
      //               ),
      //             ),
      //             onPressed: () {
      //               createemployee();
      //             },
      //           ),
      //           RaisedButton(
      //             color: Colors.red,
      //             shape: RoundedRectangleBorder(
      //                 borderRadius: BorderRadius.circular(16)),
      //             child: Text(
      //               "Delete",
      //               style: TextStyle(
      //                 fontFamily: "Biryani",
      //                 color: Colors.white,
      //               ),
      //             ),
      //             onPressed: () {
      //               deleteemployee();
      //             },
      //           ),
      //           RaisedButton(
      //             color: Colors.yellow,
      //             shape: RoundedRectangleBorder(
      //                 borderRadius: BorderRadius.circular(16)),
      //             child: Text(
      //               "Read",
      //               style: TextStyle(
      //                 fontFamily: "Biryani",
      //                 color: Colors.white,
      //               ),
      //             ),
      //             onPressed: () {
      //               //  reademployee();
      //             },
      //           ),
      //           // Row(
      //           //   crossAxisAlignment: CrossAxisAlignment.start,
      //           //   children: <Widget>[
      //           //     RaisedButton(
      //           //       color: Colors.blue,
      //           //       shape: RoundedRectangleBorder(
      //           //           borderRadius: BorderRadius.circular(16)),
      //           //       child: Text(
      //           //         "delete",
      //           //         style: TextStyle(
      //           //           fontFamily: "Biryani",
      //           //           color: Colors.white,
      //           //         ),
      //           //       ),
      //           //       onPressed: () {},
      //           //     ),
      //           //   ],
      //           // ),
      //         ],
      //       ),
      //       Padding(
      //         padding: EdgeInsets.all(8.0),
      //         child: Row(
      //           textDirection: TextDirection.ltr,
      //           children: <Widget>[
      //             Expanded(
      //               child: Text("Name"),
      //             ),
      //             Expanded(
      //               child: Text("Email"),
      //             ),
      //             Expanded(
      //               child: Text("Nip"),
      //             ),
      //             Expanded(
      //               child: Text("Hp"),
      //             ),
      //           ],
      //         ),
      //       ),
            // StreamBuilder(
            //     stream:
            //         FirebaseFirestore.instance.collection("add").snapshots(),
            //     builder: (context, snapshot) {
            //       if (snapshot.hasData) {
            //         return ListView.builder(
            //           itemCount: snapshot.data!.doc.length,

            //           itemBuilder: (context, snapshot) {
            //             DocumentReference documentReference = snapshot.data.doc[index];
            //           },
            //         );
            //       }
            //     })
      //     ],
      //   ),
      // ),