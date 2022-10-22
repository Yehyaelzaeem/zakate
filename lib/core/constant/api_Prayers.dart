class APPAPI{

  static const String Apiprayerstime=
      'https://api.aladhan.com/v1/timingsByAddress/13-9-2022?address=Cairo';

 static String getApi(String city,String date){
    return 'https://api.aladhan.com/v1/timingsByAddress/$date?address=$city';
  }

}
