import 'package:flutter/material.dart';

Widget searchView() {
  final cari = TextEditingController();
  return Container(
    margin: EdgeInsets.only(top: 10, right: 10, left: 10),
    child: TextFormField(
      controller: cari,
      decoration: InputDecoration(
        fillColor: Colors.white,
          hintText: "Search",
          // prefix: Icon(Icons.search),
          hintStyle: TextStyle(
            color: Colors.green,
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    ),
  );
}
