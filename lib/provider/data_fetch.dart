import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class DataFetch with ChangeNotifier {
  Map fetchData;
  Future<void> fetchDataAndStore() async {
    const url = 'https://api.covid19india.org/data.json';
    final response = await http.get(url);
     print('datas ${response.body}');
    fetchData = json.decode(response.body) as Map<String, dynamic>;
    //  print('datas ${fetchData['cases_time_series']}');
    // print('cases_time_series ${fetchData['cases_time_series'].length}');
  }

  Map allIndiaTrakerLatest() {
    Map latestDataFetched;
    for (var i = fetchData['cases_time_series'].length - 1; i >= 0; i--) {
      if (fetchData['cases_time_series'][i]['totalconfirmed'] != '') {
        // print(fetchData['cases_time_series'][i]['totalconfirmed']);
        latestDataFetched = {
          'date': fetchData['cases_time_series'][i]['date'],
          'totalconfirmed': fetchData['cases_time_series'][i]['totalconfirmed'],
          'totaldeceased': fetchData['cases_time_series'][i]['totaldeceased'],
          'totalrecovered': fetchData['cases_time_series'][i]['totalrecovered'],
        };
        break;
      }
    }

    // print(latestDataFetched);
    return latestDataFetched;
  }

  List allStatesStats() {
    List statesData;
    statesData = fetchData['statewise'];
    return statesData;
  }
}
