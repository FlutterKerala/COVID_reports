import 'package:flutter/material.dart';

class AllStatesStatitics extends StatelessWidget {
  AllStatesStatitics({
    @required this.statesData,
  });
  final List statesData;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: statesData.length,
        itemBuilder: (BuildContext context, int index) {
          if (statesData[index]['active'] != '0') {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    decoration:
                        BoxDecoration(color: Color.fromRGBO(242, 242, 242, 1)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(statesData[index]['state']),
                        Container(
                          child: Row(
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Text('Active'),
                                  Text(statesData[index]['active']),
                                ],
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: <Widget>[
                                  Text('Confirmed'),
                                  Text(statesData[index]['confirmed']),
                                ],
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: <Widget>[
                                  Text('Deaths'),
                                  Text(statesData[index]['deaths']),
                                ],
                              ),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(),
                ],
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
