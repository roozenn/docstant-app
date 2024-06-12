import 'package:flutter/material.dart';
import 'package:healthcare/widgets/belumkepake/chat_sample.dart';

class PengobatanOnline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: AppBar(
          backgroundColor: Color.fromRGBO(0, 81, 138, 1),
          leadingWidth: 30,
          title: const Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(
                  "images/doctor1.jpg",
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "Dr. Doctor Name",
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 80),
        children: [
          ChatSample(),
        ],
      ),
      bottomSheet: Container(
        height: 65,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ]),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Container(
                alignment: Alignment.centerRight,
                width: 270,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Type Something",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(
                Icons.send,
                size: 30,
                color: Colors.indigo,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
