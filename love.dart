import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Love extends StatefulWidget {
  const Love({Key? key}) : super(key: key);

  @override
  State<Love> createState() => _LoveState();
}

class _LoveState extends State<Love> {
  DateTime? showDate;

  DateTime? datenow=DateTime.now();

  DateTime? _loveDate;

  int? days;

  

  String _text1 = "Nickname1";
  String _text2 = "Nickname2";
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  @override
  initState() {
    super.initState();
  }

  _dateLoveString(){

    if(days==null){
      return 'Your Days';
    }else{
      return '${days}';
    }
  }



  _dateString(){

    if(showDate ==null){
      return 'dd/mm/yy';
    }else{
      return '${showDate?.day}/${showDate?.month}/${showDate?.year}';
    }
  }

  final ImagePicker _imagePicker1 = ImagePicker();
  final ImagePicker _imagePicker2 = ImagePicker();

  XFile? photo1;

  XFile? photo2;

  Future openDialog1() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            //title: Text('Enter your name'),
            content: TextField(
              controller: controller1,
              decoration: InputDecoration(hintText: 'Enter  Boy Name'),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {
                        setState(() {
                          this._text1 = 'Nickname1';
                        });
                        Navigator.pop(context);
                      },
                      child: Text('cancel')),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          this._text1 = controller1.text;
                        });
                        Navigator.pop(context);
                      },
                      child: Text('Ok')),
                ],
              )
            ],
          ));

  Future openDialog2() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
           // title: Text('Enter your name'),
            content: TextField(
              controller: controller2,
              decoration:
                  InputDecoration(hintText: 'Enter  Girl Name'),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {
                        setState(() {
                          this._text2 ='Nickname2';
                        });
                        Navigator.pop(context);
                      },
                      child: Text('cancel')),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          this._text2 = controller2.text;
                        });
                        Navigator.pop(context);
                      },
                      child: Text('Ok')),
                ],
              )
            ],
          ));
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            top: 10,
            left: 75,
            child: GestureDetector(
              onTap: () async {
                final result = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2030),
                );
             
              if(result !=null){
                setState(() {
                  showDate =result;
                });
              }
              setState(() {
                 days=(datenow?.difference(showDate!).inDays);
                 print("${days}");
              });

                print("nue nue press");
              },
              child: Icon(
                Icons.favorite,
                size: 200,
                color: Colors.pink[300],
              ),
            )),
        Positioned(
            top: 50,
            left: 150,
            child: Column(
              children: [
                Text(
                  'In Love',
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontFamily: 'Beau Rivage'),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  _dateLoveString().toString(),
                  style: TextStyle(
                      color: Colors.yellow,
                      fontSize:15,
                      fontFamily: 'Beau Rivage',
                      fontWeight: FontWeight.w900),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  'Days',
                  style: TextStyle(
                    fontFamily: 'Beau Rivage',
                    color: Colors.blue,
                  ),
                ),
              ],
            )),
        Padding(
          padding: const EdgeInsets.only(top: 230, left: 40),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          photo1 = await _imagePicker1.pickImage(
                              source: ImageSource.gallery);
                          setState(() {});
                        },
                        child: Container(
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white),
                            color: Colors.white12,
                            image: photo1 != null
                                ? DecorationImage(
                                    image: FileImage(File(photo1!.path)),
                                    fit: BoxFit.cover)
                                : null,
                          ),
                          alignment: Alignment.center,
                          child: photo1 != null
                              ? null
                              : Icon(
                                  Icons.camera_alt,
                                  color: Colors.white,
                                ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                          onTap: () {
                            openDialog1();
                          },
                          child: Text(
                            _text1 ==null?'Nicknmae1':_text1,
                            style: TextStyle(color: Colors.white70),
                          ))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 100),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () async {
                            photo2 = await _imagePicker2.pickImage(
                                source: ImageSource.gallery);
                            setState(() {});
                          },
                          child: Container(
                            width: 90,
                            height: 90,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white),
                              color: Colors.white12,
                              image: photo2 != null
                                  ? DecorationImage(
                                      image: FileImage(File(photo2!.path)),
                                      fit: BoxFit.cover)
                                  : null,
                            ),
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                            onTap: () {
                              openDialog2();
                            },
                            child: Text(
                              _text2,
                              style: TextStyle(color: Colors.white70),
                            ))
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 20),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: Colors.white12,
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 5,
                        left: 65,
                        child: Text(
                          "Clock  Been Love Memory",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Beau Rivage',
                              fontSize: 18),
                        ),
                      ),
                      Positioned(
                        top: 20,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Colors.white, width: 2))),
                        ),
                      ),

                      ///one love
                      Positioned(
                        top: 50,
                        child: IconButton(
                            icon: Icon(
                              Icons.favorite_border,
                              size: 45,
                              color: Colors.pink[300],
                            ),
                            onPressed: () {
                              print("Pressed");
                            }),
                      ),
                      Positioned(
                        top: 70,
                        left: 25,
                        child: Text(
                          "1",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),

                      Positioned(
                        top: 110,
                        left: 15,
                        child: Text(
                          "Years",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontFamily: 'Beau Rivage',
                          ),
                        ),
                      ),

                      ///two love
                      Positioned(
                        top: 50,
                        left: 40,
                        child: IconButton(
                            icon: Icon(
                              Icons.favorite_border,
                              size: 45,
                              color: Colors.pink[300],
                            ),
                            onPressed: () {
                              print("Pressed");
                            }),
                      ),

                      Positioned(
                        top: 70,
                        left: 65,
                        child: Text(
                          '2',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),

                      Positioned(
                        top: 110,
                        left: 53,
                        child: Text(
                          "Months",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontFamily: 'Beau Rivage',
                          ),
                        ),
                      ),

                      ///three love
                      Positioned(
                        top: 50,
                        left: 80,
                        child: IconButton(
                            icon: Icon(
                              Icons.favorite_border,
                              size: 45,
                              color: Colors.pink[300],
                            ),
                            onPressed: () {
                              print("Pressed");
                            }),
                      ),

                      Positioned(
                        top: 70,
                        left: 105,
                        child: Text(
                          "3",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),

                      Positioned(
                        top: 110,
                        left: 97,
                        child: Text(
                          "Weeks",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontFamily: 'Beau Rivage',
                          ),
                        ),
                      ),

                      ///four love
                      Positioned(
                        top: 50,
                        left: 120,
                        child: IconButton(
                            icon: Icon(
                              Icons.favorite_border,
                              size: 45,
                              color: Colors.pink[300],
                            ),
                            onPressed: () {
                              print("Pressed");
                            }),
                      ),

                      Positioned(
                        top: 70,
                        left: 145,
                        child: Text(
                          "4",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),

                      Positioned(
                        top: 110,
                        left: 140,
                        child: Text(
                          "Days",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontFamily: 'Beau Rivage',
                          ),
                        ),
                      ),

                      ///five love
                      Positioned(
                        top: 50,
                        left: 160,
                        child: IconButton(
                            icon: Icon(
                              Icons.favorite_border,
                              size: 45,
                              color: Colors.pink[300],
                            ),
                            onPressed: () {
                              print("Pressed");
                            }),
                      ),

                      Positioned(
                        top: 70,
                        left: 185,
                        child: Text(
                          "5",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),

                      Positioned(
                        top: 110,
                        left: 180,
                        child: Text(
                          "Hours",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontFamily: 'Beau Rivage',
                          ),
                        ),
                      ),

                      ///six love
                      Positioned(
                        top: 50,
                        left: 200,
                        child: IconButton(
                            icon: Icon(
                              Icons.favorite_border,
                              size: 45,
                              color: Colors.pink[300],
                            ),
                            onPressed: () {
                              print("Pressed");
                            }),
                      ),

                      Positioned(
                        top: 70,
                        left: 225,
                        child: Text(
                          "6",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),

                      Positioned(
                        top: 110,
                        left: 220,
                        child: Text(
                          "Mins",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontFamily: 'Beau Rivage',
                          ),
                        ),
                      ),

                      ///seven love
                      Positioned(
                        top: 50,
                        left: 240,
                        child: IconButton(
                            icon: Icon(
                              Icons.favorite_border,
                              size: 45,
                              color: Colors.pink[300],
                            ),
                            onPressed: () {
                              print("Pressed");
                            }),
                      ),

                      Positioned(
                        top: 70,
                        left: 265,
                        child: Text(
                          "7",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                      Positioned(
                        top: 110,
                        left: 260,
                        child: Text(
                          "Secs",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontFamily: 'Beau Rivage',
                          ),
                        ),
                      ),

                      Positioned(
                        top: 140,
                        left: 105,
                        child: Text(
                          _dateString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Beau Rivage',
                              fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
