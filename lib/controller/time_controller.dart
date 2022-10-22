import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import  'package:intl/intl.dart';
import '../core/function/getdate.dart';
import '../data/model/prayertime.dart';

class TimesController extends GetxController{
    String time(){
      var time1 = DateFormat("hh:mm:ss a").format(DateTime.now());
      return time1;
    }
    //********************* get date
    late Future<PrayersTime> future;
    late Future<PrayersTime> future3;
    List apis=[];
    void otherdayes(){
      for(int i=0;i<=6;i++){
        future3=  otherdaytimes(i) ;
        apis.add(future3);
      }
    }
 @override
  void onInit() {
   otherdate();
   otherdayes();
   getprayertime();
   print(apis.length);
   future= getprayertime();
   super.onInit();
  }



}
