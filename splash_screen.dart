import 'package:flutter/material.dart';
import 'package:mycupid_love/been_together.dart';

class MySplashScreen extends StatefulWidget {
  MySplashScreen({Key? key}) : super(key: key);

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  void initState() {
    super.initState();
    splashDuration();
  }

  splashDuration() async {
    await Future.delayed(Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(context,  MaterialPageRoute(builder: (context) => BeenTogether()), (route) => false,);
      // Navigator.pushReplacement(
      //     context, MaterialPageRoute(builder: (context) => BeenTogether()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.pink,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 40.0,
                      child:  Icon(
                      Icons.favorite,
                      size: 50,
                      color: Colors.pink[300],
                    ),),

                    Padding(padding:EdgeInsets.only(top: 10)),
                    Text("My love",style: TextStyle(
                      fontFamily: 'Beau Rivage',
                      color: Colors.white,
                      fontSize:24,

                    ),)
                  ],
                ),
              ),
            )
          ],
        )
      ],
    ));
  }
}
