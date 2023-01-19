import 'package:flutter/material.dart';
import 'package:mycupid_love/been_together.dart';


class LoveCalculate extends StatefulWidget {
  LoveCalculate({Key? key}) : super(key: key);

  @override
  State<LoveCalculate> createState() => _LoveCalculateState();
}

class _LoveCalculateState extends State<LoveCalculate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            
            backgroundColor: Colors.black38,
            leading: GestureDetector(
              onTap: (){
                Navigator.pushReplacement(
                       context, MaterialPageRoute(builder: (context) => BeenTogether()));
              },
              child: Icon(Icons.arrow_back_ios_new)),
            title: Text("Let Calculate our Love",
            style: TextStyle(
             // fontStyle: FontStyle.italic,
              fontSize: 25,
              fontFamily: 'Beau Rivage',
              color: Colors.pink[200],
              
            ),),
        
            
            ),
           body: Container(
           constraints: BoxConstraints.expand(),
           decoration: BoxDecoration(
               image: DecorationImage(
                   image: AssetImage("images/kuku.jpg"),
                   fit: BoxFit.cover)),
           child: Center(
             child: Column(
               children: [

                 Padding(
                   padding: const EdgeInsets.only(top: 50,left: 20,right: 20),
                   child: TextField(
                             decoration: InputDecoration(
                             // icon: Icon(Icons.send),
                              hintText: 'Enter Boy Name',
                              //helperText: 'Helper Text',
                              //counterText: '0 characters',
                              border: OutlineInputBorder(),
                            ),
                         ),
                        ),

                   Padding(
                   padding: const EdgeInsets.only(top: 50,left: 20,right: 20),
                   child: TextField(
                             decoration: InputDecoration(
                             // icon: Icon(Icons.send),
                              hintText: 'Enter Girl Name',
                              //helperText: 'Helper Text',
                              //counterText: '0 characters',
                              border: OutlineInputBorder(),
                            ),
                         ),
                        ),     
                
                  SizedBox(height:30,), 
                 ElevatedButton(
                   onPressed: (){},
                  child: Text('Calculate',style: TextStyle(color: Colors.white),),)
                  
               ],
             ),
           )
             
             )
                
                
                );
  }
}