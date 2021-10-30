import 'package:flutter/material.dart';

class MenuList {
  IconData? iconData;
  String? title;
  Color? bgColor;
  Color? IconColor;
  Color? btnColor;
  num? letf;
  num? done;
  bool? isLast;

  MenuList(
      {this.iconData,
      this.title,
      this.bgColor,
      this.btnColor,
      this.IconColor,
      this.letf,
      this.done,
      this.isLast = false});

  static List<MenuList> generateMenu() {
    return [
      MenuList(
        iconData: Icons.person_rounded,
        title: 'Add Pegawai',
        bgColor: Colors.blueAccent,
        IconColor: Colors.lightBlueAccent,
        btnColor: Colors.blueGrey,
        letf: 3,
        done: 1,
      ),
      MenuList(
        iconData: Icons.person_rounded,
        title: 'Input Pegawai',
        bgColor: Colors.redAccent,
        IconColor: Colors.red,
        btnColor: Colors.pinkAccent,
        letf: 0,
        done: 0,
      ),
      MenuList(
        iconData: Icons.person_rounded,
        title: 'Delete Pegawai',
        bgColor: Colors.yellow,
        IconColor: Colors.yellowAccent,
        btnColor: Colors.blueGrey,
        letf: 3,
        done: 1,
      ),
      MenuList(
        iconData: Icons.person_rounded,
        title: 'Add Pegawai',
        bgColor: Colors.blueAccent,
        IconColor: Colors.lightBlueAccent,
        btnColor: Colors.blueGrey,
        letf: 3,
        done: 1,
      ),
      MenuList(isLast: true),
    ];
  }
}
