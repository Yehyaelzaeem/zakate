import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zakate/core/services/myservices.dart';
import '../../../core/localization/changelanguage.dart';
import '../../../data/sourcedata/listmodel_zakat.dart';

class Zakat extends StatelessWidget {
  const Zakat({super.key});

  @override
  Widget build(BuildContext context) {
    MyServices myServices =Get.put(MyServices());
    String? lan=myServices.sharedPreferences!.getString('lang');

    // Changelang changelang=Get.put(Changelang());
    return Scaffold(
      backgroundColor:Colors.white,
        body: SafeArea(
          child: Center(
            child: PageView.builder(
              scrollDirection: Axis.vertical,
              itemCount: listzakat.length,
              itemBuilder: (context, i) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child:
                      Container(
                        margin: const EdgeInsets.only(bottom: 20),
                          alignment: Alignment.bottomCenter,
                          child: Text('${listzakat[i].tite}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.blue.shade900
                          ),
                          )),),
                    Expanded(
                      flex: 5,
                      child:
                     SizedBox(
                         width: MediaQuery.of(context).size.width,
                         child: Image.asset('${listzakat[i].image}', fit: BoxFit.cover,)),),
                    Expanded(
                      flex: 7,
                      child:
                      Container(
                      margin: const EdgeInsets.symmetric(horizontal: 25,vertical: 15),
                      child: Center(
                        child: Text('${listzakat[i].body}',
                          textAlign:lan=='en'?
                          TextAlign.end:TextAlign.start,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),),

                  ],
                );
              },

            ),
          ),
        )
    );
  }
}