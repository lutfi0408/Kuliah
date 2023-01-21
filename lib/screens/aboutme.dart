import 'package:daftar_tugas/screens/home.dart';
import 'package:flutter/material.dart';
import '../constants/colors.dart';

class About extends StatefulWidget {
  @override
  _About createState() => _About();
}

class _About extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget> [
        FractionallySizedBox(
          alignment: Alignment.topCenter,
          heightFactor: 0.8,
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/me.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),

        FractionallySizedBox(
          alignment: Alignment.bottomCenter,
          heightFactor: 0.4,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(
                color: Colors.grey.withOpacity(0.5), //color of shadow
                spreadRadius: 5, //spread radius
                blurRadius: 7, // blur radius
                offset: Offset(0, 2),
              )],
              borderRadius: new BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:<Widget> [
                Column(
                  children: <Widget>[
                    Text(
                      'LUTFI NUR ALFIANDRI',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    SizedBox(),
                    Text(
                      'Teknik Informatika',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    SizedBox(),
                    Text(
                      '43A87006180168 - TI/7/K/P',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    SizedBox(),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                    ),
                    ElevatedButton(
                      child: Text('Home', style: TextStyle(fontSize: 20,),),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home()));
                      },
                      style: ElevatedButton.styleFrom(
                        primary: tdBLue,
                        minimumSize: Size(80, 50)
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}