import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:zakate/controller/time_controller.dart';
import 'package:zakate/core/constant/images.dart';
import '../../widget/prayers/prayers_Times/customcolum_prayersday.dart';
import '../../widget/prayers/prayers_Times/customprayersOtherdays.dart';
class Prayers extends StatefulWidget{
  const Prayers({super.key});

  @override
  State<Prayers> createState() => _PrayersState();
}

class _PrayersState extends State<Prayers> {

  @override
  Widget build(BuildContext context) {
    TimesController controller1=Get.put(TimesController());
    return
      Scaffold(
      backgroundColor: Colors.white,
      body:
      FutureBuilder(
        future: controller1.future,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        try{
          if(snapshot.hasData){
            return
              Column(
                children: [
                  Expanded(
                    flex: 2,
                    child:
                    Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(AppImages.sun),
                          fit: BoxFit.cover,
                          colorFilter:
                          ColorFilter.mode(Colors.white, BlendMode.darken),
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                        ),
                      ),
                      child: Stack(
                        children:  [
                          Container(
                            alignment: Alignment.center,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                 Text('pr1'.tr,
                                  style:  const TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                      shadows: [BoxShadow(color:
                                      Colors.white,blurRadius: 5)]
                                  ),),
                                const SizedBox(height: 10,),
                                Text('${snapshot.data.data!.date.readable}',
                                  style:  const TextStyle(
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                      shadows: [BoxShadow(color:
                                      Colors.white,blurRadius: 5)]
                                  ),
                                ),
                              ],
                            ),),
                          Align(
                            alignment: const Alignment(0.0, 1.4),
                            child:
                            SizedBox(
                              height: 0,
                              width: 10,
                              child: OverflowBox(
                                minWidth: 0.0,
                                maxWidth: MediaQuery.of(context).size.width,
                                minHeight: 0.0,
                                maxHeight: (MediaQuery.of(context).size.height / 2.8),
                                child: Stack(
                                  children: <Widget>[
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 1),
                                      width: double.infinity,
                                      height: double.infinity,
                                      child: Card(
                                        color: Colors.white,
                                        elevation: 5,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(25),
                                        ),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 1, child:
                                            Padding(
                                              padding: const EdgeInsets.only(left: 20.0,right: 20,top: 15,bottom: 10),
                                              child:
                                              CustomColumPrayers(
                                                x1: '${snapshot.data.data!.timings.fajr}',
                                                x2: '${snapshot.data.data!.timings.sunrise}',
                                                x3: '${snapshot.data.data!.timings.dhuhr}',
                                                x4: '${snapshot.data.data!.timings.asr}',
                                                x5: '${snapshot.data.data!.timings.sunset}',
                                                x6: '${snapshot.data.data!.timings.maghrib}',
                                                x7: '${snapshot.data.data!.timings.isha}',
                                              ),
                                            ),),
                                            Expanded(
                                                flex: 1,
                                                child:
                                                FittedBox(
                                                  child: Column(
                                                    children: [
                                                      SizedBox(height: MediaQuery.of(context).size.width/20,),
                                                      TimerBuilder.periodic( const Duration(seconds: 1),
                                                          alignment: Duration.zero, builder: (context) {
                                                            var now=controller1.time();
                                                            return Text(now);
                                                          }),
                                                       SizedBox(height: MediaQuery.of(context).size.width/35,),
                                                      SizedBox(
                                                        width: 120,
                                                        height: 80,
                                                        child:
                                                        ClipRRect(
                                                            child: Image.asset('assets/fk.png'))
                                                        // LottieBuilder.asset(
                                                        //     AppImages.animated),
                                                      ),
                                                      Container(
                                                        margin:const EdgeInsets.only(left: 10,top: 5),
                                                        child:
                                                        Text('${snapshot.data.data!.date.hijri.month.en}',
                                                          style: TextStyle(
                                                              fontSize: 20,
                                                              fontWeight: FontWeight.bold,
                                                              color: Colors.blue.shade700),
                                                        ),),
                                                      Container(
                                                        margin:const EdgeInsets.only(bottom: 10,top: 0),
                                                        child: Text('${snapshot.data.data!.date.hijri.date}',
                                                          style: const TextStyle(
                                                              fontSize: 10,
                                                              fontWeight: FontWeight.w500,
                                                              color: Colors.black),
                                                        ),),
                                                    ],
                                                  ),
                                                )

                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 3,
                      child:
                      Container(
                        margin: const EdgeInsets.only(left: 20),
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 210.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 1,
                                child:
                                Container(
                                    margin: const EdgeInsets.only(left: 5),
                                    alignment: Alignment.centerLeft,
                                    child: const Text('Other Days',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    )),),
                              Expanded(
                                flex: 6,
                                child: Container(
                                    color: Colors.white,
                                    height: 130,
                                    width: MediaQuery.of(context).size.width,
                                    child:  ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: controller1.apis.length,
                                        itemBuilder: (context,i){
                                          return Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child:
                                            FutureBuilder(
                                              future: controller1.apis[i],
                                              builder: (BuildContext context, AsyncSnapshot snapshot2) {
                                                try{
                                                  if(snapshot2.hasData){
                                                    return
                                                      CustomPrayersOthersday(
                                                        y1: '${snapshot2.data.data!.timings.fajr}',
                                                        y2: '${snapshot2.data.data!.timings.sunrise}',
                                                        y3: '${snapshot2.data.data!.timings.dhuhr}',
                                                        y4: '${snapshot2.data.data!.timings.asr}',
                                                        y5: '${snapshot2.data.data!.timings.sunset}',
                                                        y6: '${snapshot2.data.data!.timings.maghrib}',
                                                        y7: '${snapshot2.data.data!.timings.isha}',
                                                        date: '${snapshot2.data.data!.date.readable}',
                                                      );
                                                  }
                                                  else if(snapshot2.connectionState==ConnectionState.waiting){
                                                    print('waitiiiiiiiing');
                                                    return Container(
                                                      width: MediaQuery.of(context).size.width/3,
                                                      child: const Center(
                                                        child: CircularProgressIndicator(),
                                                      ),
                                                    );
                                                  }
                                                  else if(snapshot2.hasError) {
                                                    return Container(
                                                      width: MediaQuery.of(context).size.width/3,
                                                      child: const Center(
                                                        child: CircularProgressIndicator(),
                                                      ),
                                                    );
                                                  }
                                                  else {
                                                    return Container(
                                                      width: MediaQuery.of(context).size.width/3,
                                                      child: const Center(
                                                        child: CircularProgressIndicator(),
                                                      ),
                                                    );
                                                  }
                                                }
                                                catch(e)
                                                {
                                                  print('==========================');
                                                  print(e.toString());
                                                  return Container(
                                                    width: MediaQuery.of(context).size.width/3,
                                                    child: const Center(
                                                      child: CircularProgressIndicator(),
                                                    ),
                                                  );
                                                }
                                              },),

                                          );
                                        })


                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                  )
                ],
              );
          }
          else if(snapshot.connectionState==ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator(),);
          }
          else if(snapshot.hasError){
            return const Center(child: CircularProgressIndicator(),);
          }
          else{
            return const Center(child: CircularProgressIndicator(),);
          }
        }catch(e){
          print('==========================');
          print(e.toString());
          return SizedBox(
            width: MediaQuery.of(context).size.width/3,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        },
      )
    );
  }
}

