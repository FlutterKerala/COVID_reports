import 'package:coronareport/screens/previos_all_india_data_page.dart';
import 'package:flutter/material.dart';

class TopSectionBar extends StatelessWidget {
  const TopSectionBar({
    Key key,
    @required Map latestDataOfAllIndia,
    @required this.screenWidth,
  })  : _latestDataOfAllIndia = latestDataOfAllIndia,
        super(key: key);

  final Map _latestDataOfAllIndia;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 70,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'INDIA COVID-19 TRACKER',
                  style: TextStyle(
                      fontSize: 20,
                      color: Color.fromRGBO(242, 41, 58, 1),
                      fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Covid-19 Datas',
                  style: TextStyle(color: Colors.black54),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text('All India Statitics'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          '${_latestDataOfAllIndia['date']} DATA',
                          style: TextStyle(color: Colors.black54),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.red)),
                        color: Color.fromRGBO(242, 41, 58, 1),
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(PreviousAllIndiaDatas.routeName);
                        },
                        child: Text(
                          'Previous Datas',
                          style: TextStyle(color: Colors.white),
                        )),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: screenWidth * 0.3,
                    child: Column(
                      children: <Widget>[
                        Text(
                          'CONFIRMED',
                          style: TextStyle(
                              color: Color.fromRGBO(242, 41, 58, 1),
                              fontSize: 20),
                        ),
                        Text(
                          (int.parse(_latestDataOfAllIndia['totalconfirmed']) +
                                  int.parse(
                                      _latestDataOfAllIndia['totalrecovered']) +
                                  int.parse(
                                      _latestDataOfAllIndia['totaldeceased']))
                              .toString(),
                          style: TextStyle(
                              color: Color.fromRGBO(242, 41, 58, 1),
                              fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: screenWidth * 0.3,
                    child: Column(
                      children: <Widget>[
                        Text(
                          'ACTIVE',
                          style: TextStyle(
                              color: Color.fromRGBO(123, 119, 242, 1),
                              fontSize: 20),
                        ),
                        Text(
                          _latestDataOfAllIndia['totalconfirmed'],
                          style: TextStyle(
                              color: Color.fromRGBO(123, 119, 242, 1),
                              fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: screenWidth * 0.3,
                    child: Column(
                      children: <Widget>[
                        Text(
                          'RECOVERED',
                          style: TextStyle(
                              color: Color.fromRGBO(138, 222, 170, 1),
                              fontSize: 20),
                        ),
                        Text(
                          _latestDataOfAllIndia['totalrecovered'],
                          style: TextStyle(
                              color: Color.fromRGBO(138, 222, 170, 1),
                              fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: screenWidth * 0.3,
                    child: Column(
                      children: <Widget>[
                        Text(
                          'DECEASED',
                          style: TextStyle(
                              color: Color.fromRGBO(49, 89, 89, 1),
                              fontSize: 20),
                        ),
                        Text(
                          _latestDataOfAllIndia['totaldeceased'],
                          style: TextStyle(
                              color: Color.fromRGBO(49, 89, 89, 1),
                              fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
