import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';

class PreviousAllIndiaDatas extends StatelessWidget {
  static const routeName = '/previousAllIndiaDatas';
  var data = [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 50,),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text('INDIA COVID-19 TRACKER',style: TextStyle(
                      fontSize: 20,
                      color: Color.fromRGBO(242, 41, 58, 1),
                      fontWeight: FontWeight.w500),
                  ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    height: 150,
          child: new Sparkline(
            data: data,
          ),
        ),
                ],
              ),
      ),
    );
  }
}
