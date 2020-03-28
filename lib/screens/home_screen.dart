import 'package:coronareport/provider/data_fetch.dart';
import 'package:coronareport/widgets/all_states_statitics.dart';
import 'package:coronareport/widgets/top_bar_section.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isloading = true;
  Map _latestDataOfAllIndia;
  List _statesData;

  Future<void> dataController() async {
    await Provider.of<DataFetch>(context, listen: false).fetchDataAndStore();
    _latestDataOfAllIndia =
        Provider.of<DataFetch>(context, listen: false).allIndiaTrakerLatest();
    _statesData =
        Provider.of<DataFetch>(context, listen: false).allStatesStats();
    // print(_latestDataOfAllIndia);
    setState(() {
      _isloading = false;
    });
   
  }

  @override
  void didChangeDependencies() {
    dataController();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
  

    return Scaffold(
      body: _isloading
          ? Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.red,
              ),
            )
          : SingleChildScrollView(
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TopSectionBar(
                    latestDataOfAllIndia: _latestDataOfAllIndia,
                    screenWidth: screenWidth),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'All States of India Statitics',
                      ),
                      Text(
                        'These Datas are updating Recently',
                        style: TextStyle(color: Colors.black45),
                      ),
                    ],
                  ),
                ),
                AllStatesStatitics(
                  statesData: _statesData,
                ),
                Container(
                    padding: EdgeInsets.all(10),
                    color: Colors.black45,
                    width: double.infinity,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              width: double.infinity,
                              child: Text(
                                'This app is build with Flutter',
                                style: TextStyle(color: Colors.white),
                              )),
                          Container(
                              padding: EdgeInsets.only(top: 10),
                              width: double.infinity,
                              child: Text(
                                'Developed By Mohammed Fayez (BCA sem 4) of MES College Marampally',
                                style: TextStyle(color: Colors.white),
                              )),
                          Container(
                              padding: EdgeInsets.only(top: 10),
                              width: double.infinity,
                              child: Text(
                                'For any queries fayezmohammed23@gmail.com',
                                style: TextStyle(color: Colors.white),
                              )),
                               Container(
                              padding: EdgeInsets.only(top: 10),
                              width: double.infinity,
                              child: Text(
                                'Data are provided by COVID19-India Ops Groups ',
                                style: TextStyle(color: Colors.white),
                              )),

                        ],
                      ),
                    ))
              ],
            )),
    );
  }
}
