import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_car_installment_calculator/views/result_screen_ui.dart';
import 'package:image_picker/image_picker.dart';

class InputScreenUI extends StatefulWidget {
  const InputScreenUI({super.key});

  @override
  State<InputScreenUI> createState() => _InputScreenUIState();
}

class _InputScreenUIState extends State<InputScreenUI> {
//สร้างตัวแปรควบคุม TextField
  TextEditingController _carPriceCtrl = TextEditingController();
  TextEditingController _interestCtrl = TextEditingController();

// สร้างตัวแปรควบคุม Radio
  int _downCtrl = 10;

// สร้างตัวแปรควบคุม Dropdown
  int _monthCtrl = 24;

// สร้าง Method แสดง Dialog แจ้งเตือน
  _warningDialog(msg) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'คําเตือน',
        ),
        content: Text(
          msg,
        ),
        actions: [
          OutlinedButton(
            //TextButton, EleveatedButton
            onPressed: () => Navigator.pop(context), // ปิด Dialog
            child: Text(
              'ตกลง',
            ),
          ),
        ],
      ),
    );
  }

// สร้างตัวแปรควบคุม Switch
  // bool _switchValue = false;

// สร้างตัวแปรเก็บรูปที่เลือกจากกล้องหรือแกลอรี่
  File? _imageFile;
// สสร้าง Method เปิดกล้อง
  _openCamera() async {
    final pickerImage = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );
    if (pickerImage == null) return;

    setState(
      () {
        _imageFile = File(pickerImage.path);
      },
    );
  }

// สร้าง Method เปิดแกลอรี่
  _openGallery() async {
    final pickerImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickerImage == null) return;

    setState(
      () {
        _imageFile = File(pickerImage.path);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text(
            "CI Calculator",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 35,
              ),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "คำนวณค่างวดรถ",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Colors.green,
                          width: 2,
                        ),
                      ),
                      child: InkWell(
                        onTap: () {
                          // เปิด Snackbar ให้ผู้ใช้เลือกเปิดกล้องหรือแกลอรี่
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                backgroundColor: Colors.green,
                                content: Column(
                                  children: [
                                    ListTile(
                                      onTap: () {
                                        _openCamera();
                                      },
                                      title: Text(
                                        'เปิดกล้อง (Open Camera)',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      leading: Icon(
                                        Icons.camera_alt,
                                        color: Colors.white,
                                      ),
                                    ),
                                    ListTile(
                                      onTap: () {
                                        _openGallery();
                                      },
                                      title: Text(
                                        'เปิดแกลอรี่ (Open Gallery)',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      leading: Icon(
                                        Icons.image,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                )),
                          );
                        },
                        child: _imageFile == null
                            ? ClipRRect(
                                //จริงทำหลังเครืองหมาย ? เท็จทำหลังเครืองหมาย :
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  'assets/images/img02.png',
                                  width: 200,
                                  height: 150,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.file(
                                  _imageFile!,
                                  width: 200,
                                  height: 150,
                                  fit: BoxFit.cover,
                                ),
                              ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'ราคารถ (บาท)',
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // TextField(
                    //   //controller: _priceController,
                    //   keyboardType: TextInputType.numberWithOptions(),
                    //   decoration: InputDecoration(
                    //     enabledBorder: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(8),
                    //       borderSide: BorderSide(
                    //         color: Colors.green,
                    //         width: 2,
                    //       ),
                    //     ),
                    //     focusedBorder: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(8),
                    //       borderSide: BorderSide(
                    //         color: Colors.green,
                    //         width: 2,
                    //       ),
                    //     ),
                    //   ),
                    // )
                    TextField(
                      controller: _carPriceCtrl,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '0.00',
                        hintStyle: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'จํานวนเงินดาวน์ (%)',
                      ),
                    ),
                    // SizedBox(
                    //   height: 5,
                    // ),
                    Wrap(
                      //Row
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Radio(
                          onChanged: (value) {
                            setState(
                              () {
                                _downCtrl = value!;
                              },
                            );
                          },
                          value: 10,
                          groupValue: _downCtrl,
                        ),
                        Text(
                          '10',
                        ),
                        Radio(
                          onChanged: (value) {
                            setState(
                              () {
                                _downCtrl = value!;
                              },
                            );
                          },
                          value: 20,
                          groupValue: _downCtrl,
                        ),
                        Text(
                          '20',
                        ),
                        Radio(
                          onChanged: (value) {
                            setState(
                              () {
                                _downCtrl = value!;
                              },
                            );
                          },
                          value: 30,
                          groupValue: _downCtrl,
                        ),
                        Text(
                          '30',
                        ),
                        Radio(
                          onChanged: (value) {
                            setState(
                              () {
                                _downCtrl = value!;
                              },
                            );
                          },
                          value: 40,
                          groupValue: _downCtrl,
                        ),
                        Text(
                          '40',
                        ),
                        Radio(
                          onChanged: (value) {
                            setState(
                              () {
                                _downCtrl = value!;
                              },
                            );
                          },
                          value: 50,
                          groupValue: _downCtrl,
                        ),
                        Text(
                          '50',
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'ระยะเวลา (เดือน)',
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10.0,
                        ),
                        child: DropdownButton<int>(
                          value: _monthCtrl,
                          isExpanded: true,
                          underline: Container(),
                          onChanged: (int? value) {
                            setState(() {
                              _monthCtrl = value!;
                            });
                          },
                          items: <int>[
                            24,
                            36,
                            48,
                            60,
                            72,
                          ].map<DropdownMenuItem<int>>((int value) {
                            return DropdownMenuItem<int>(
                              value: value,
                              child: Text(
                                'ผ่อน $value เดือน',
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'อัตรดอกเบี่บ (%/ปี)',
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: _interestCtrl,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '0.00',
                        hintStyle: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    ElevatedButton(
                      onPressed: () {
                        // Validate UI หากมีปัญหาให้แสดง Dialog แจ้งเตือน
                        if (_carPriceCtrl.text.isEmpty) {
                          _warningDialog('ป้อนราคารถด้วย!');
                        } else if (_interestCtrl.text.isEmpty) {
                          _warningDialog('ป้อนอัตรดอกเบี่ยด้วย!');
                        } else {
                          //พร้อมคำนวณแล้วส่งไปแสดงผลที่หน้า ResultScreenUI
                          // แปลงราคากับอัตราดอกเบี้ยเป็นตัวเลขก่อน
                          double carPrice = double.parse(_carPriceCtrl.text);
                          double interest = double.parse(_interestCtrl.text);
                          // ยอดจัด = ราคารถ - เงินดาวน์
                          double balance =
                              carPrice - (carPrice * _downCtrl / 100);

                          // ดอกเบี้ยที่ต้องจ่ายทั้งหมด = ยอดจัด * (อัตราดอกเบี้ย / 100 / 12) * จำนวนเดือนผ่อน
                          double totalInterest =
                              (balance * interest / 100 / 12) * _monthCtrl;

                          // ยอดที่ต้องผ่อนต่อเดือ = (ยอดจัด + ดอกเบี้ยที่ต้องจ่ายทั้งหมด) / จำนวนเดือนผ่อน
                          double payPerMonth =
                              (balance + totalInterest) / _monthCtrl;

                          // ส่งไปหน้า ResultScreenUI แบบย้อนกลับได้
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResultScreenUI(
                                carPrice: carPrice,

                                month: _monthCtrl,

                                payPerMonth: payPerMonth,
                                // interest: interest,
                                // balance: balance,
                                // totalInterest: totalInterest,
                                // down: _downCtrl,
                              ),
                            ),
                          );
                        }
                      },
                      child: Text(
                        'คำนวณ',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        minimumSize: Size(
                          double.infinity,
                          55,
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _carPriceCtrl.text = '';
                          _interestCtrl.text = '';
                          _downCtrl = 10;
                          _monthCtrl = 24;
                        });
                      },
                      child: Text(
                        'ยกเลิก',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        minimumSize: Size(
                          double.infinity,
                          55,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
