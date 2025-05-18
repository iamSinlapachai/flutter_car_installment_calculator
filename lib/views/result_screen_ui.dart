import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ResultScreenUI extends StatefulWidget {
  // สร้างตัวแปรรับค่าที่จะส่งมา
  double? carPrice;
  double? payPerMonth;
  int? month;

  // เอาตัวแปรที่สร้างมารอรับค่าที่ส่งมา
  ResultScreenUI({super.key, this.carPrice, this.payPerMonth, this.month});

  // const ResultScreenUI({super.key});

  @override
  State<ResultScreenUI> createState() => _ResultScreenUIState();
}

class _ResultScreenUIState extends State<ResultScreenUI> {
  @override
  Widget build(BuildContext context) {
    // กำหนดรูปแบบของตัวเลข ณ ที่นี้คั่นหลักพัน/ล้าน และทศนิยม 2 ตัว
    NumberFormat fm = NumberFormat("#,###,##0.00");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "CI Calculator",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text.rich(
              TextSpan(
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(text: 'ผ่อนทั้งหมด '),
                  TextSpan(
                    text: '${widget.month}',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w900,
                    ), // เปลี่ยนเป็นสีแดง
                  ),
                  TextSpan(text: ' เดือน'),
                ],
              ),
            ),
            Text(
              ' ราคารถ ${widget.carPrice} เดือน',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            Text(
              'ค่างวดรถต่อเดือน',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            Text(
              fm.format(widget.payPerMonth),
              style: TextStyle(
                  fontSize: 30, fontWeight: FontWeight.bold, color: Colors.red),
            ),
            Text(
              'บาท',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
