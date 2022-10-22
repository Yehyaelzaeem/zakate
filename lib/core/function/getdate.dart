import 'dart:convert';
import 'package:zakate/core/constant/api_Prayers.dart';
import '../../data/model/prayertime.dart';
import 'package:http/http.dart' as http;
import  'package:intl/intl.dart';
String date(){
  String cdate = DateFormat("dd-MM-yyyy").format(DateTime.now());
  return cdate;
}
Future<PrayersTime> getprayertime ()async{
  var res = await http.get(Uri.parse(APPAPI.getApi('Cairo',date())));
  return PrayersTime.fromJson(jsonDecode(res.body));
}

//************************
List dateAllday=[];
List otherdate(){
  final today = DateTime.now();
  for(int i=-1;i<=5;i++){
    final d1 = today.add(Duration(days: i));
    var y1 =DateFormat("dd-MM-yyyy").format(d1);
    dateAllday.add(y1);
  }
  return dateAllday;
}

Future<PrayersTime> otherdaytimes (int x)async{
  List alldaysApi=[];
  for(int i=0;i<=6;i++){
    var res = await http.get(Uri.parse(APPAPI.getApi('Cairo',dateAllday[i])));
     alldaysApi.add(res);
  }
  return PrayersTime.fromJson(jsonDecode(alldaysApi[x].body));
}



