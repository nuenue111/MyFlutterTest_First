import 'package:flutter/material.dart';
import 'package:mycupid_love/love_calculate.dart';
import 'package:mycupid_love/widgets/love.dart';

class BeenTogether extends StatefulWidget {
  BeenTogether({Key? key}) : super(key: key);

  @override
  State<BeenTogether> createState() => _BeenTogetherState();
}

class _BeenTogetherState extends State<BeenTogether> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.black38,
            leading: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(Icons.arrow_back_ios_new)),
            title: Text(
              "Been Together love Memory",
              style: TextStyle(
                // fontStyle: FontStyle.italic,
                fontSize: 25,
                fontFamily: 'Beau Rivage',
                color: Colors.pink[200],
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoveCalculate()));
                    },
                    child: Icon(Icons.favorite_border_rounded)),
              )
            ],
          ),
          body: Container(
              constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/kuku.jpg"), fit: BoxFit.cover)),
              child: Love())),
    );
  }
}
