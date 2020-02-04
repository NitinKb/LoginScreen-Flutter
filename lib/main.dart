import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextEditingController namectrl, passctrl;

void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: MyApp(),
        ),
      ),
    )
  );
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  void checkInput(){
    String name = namectrl.text;
    String pass = passctrl.text;

    if(name.length >0 && pass.length >0){
      showFlushBar('You are logged in');
    }else{
      showFlushBar('Please enter all the details');
    }
  }

  void showFlushBar(String msg){
    Flushbar(
      padding: EdgeInsets.all(15.0),
      flushbarPosition: FlushbarPosition.TOP,
      message: msg,
      duration: Duration(seconds: 3),
      backgroundColor: Colors.grey,
    ).show(context);

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    namectrl = new TextEditingController();
    passctrl = new TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            //#6950fb
            //#dd41ff

            Color(0xffb6950fb),
            Color(0xffbdd41ff),
          ]
        )
      ),

      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[

          Text('Account \nLogin', textAlign: TextAlign.center,
            style: GoogleFonts.varelaRound(
                fontSize: 45.0, color: Colors.black38),),

          Container(
            child: UserInput(),
          ),

          OutlineButton(
            onPressed: (){checkInput();},
            child: Icon(Icons.arrow_forward,color: Colors.white,),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            highlightedBorderColor: Colors.white,
          )
        ],
      ),
    );
  }

  Widget UserInput(){
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        TextField(
          controller: namectrl,
          cursorColor: Colors.white,
          showCursor: true,
          autofocus: false,
          style: GoogleFonts.varelaRound(fontSize: 23.0,color: Colors.white),
          decoration: InputDecoration.collapsed(hintText: 'Email'),
        ),

        Align(
          alignment: Alignment.centerLeft,
          child: Text('ACCOUNT MAIL', style: GoogleFonts.varelaRound(
              fontSize: 11.0, color: Colors.white),),
        ),

        Padding(
          padding: EdgeInsets.symmetric(vertical: 7.0),
          child: TextField(
            controller: passctrl,
            cursorColor: Colors.white,
            showCursor: false,
            autofocus: false,
            style: GoogleFonts.varelaRound(fontSize: 23.0,color: Colors.white),
            decoration: InputDecoration.collapsed(hintText: 'Password'),
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('ACCOUNT PASSWORD', style: GoogleFonts.varelaRound(
                fontSize: 11.0, color: Colors.white),),

            Text('Forgot ?', style: GoogleFonts.varelaRound(
                fontSize: 11.0, color: Colors.white),)
          ],
        )
      ],
    );
  }
}
