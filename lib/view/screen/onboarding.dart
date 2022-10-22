import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zakate/controller/onboardingcontroller.dart';
import 'package:zakate/data/sourcedata/listmodel-onboarding.dart';

class Onboarding extends StatelessWidget{
  OnboardingControllerImp controller=Get.put(OnboardingControllerImp());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingControllerImp>(
      builder: (c) {
        return Scaffold(
            backgroundColor:c.x==false?Colors.white:const Color(0xfffffaf6),
            body:
            Column(
              children: [
                Expanded(
                  flex: 5,
                  child: PageView.builder(
                      controller: c.pageController,
                      onPageChanged: (val){
                        c.onchangepage(val);
                      },
                      itemCount: onboardinglist.length,
                      itemBuilder: (context,i){
                        return FittedBox(
                          child: Column(
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).size.height*0.1,
                              ),
                              Container(
                                child:
                                Text('${onboardinglist[i].title}',
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height*0.04,
                              ),
                              Container(

                                height:MediaQuery.of(context).size.height*0.45 ,
                                child: Image.asset('${onboardinglist[i].image}'),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height*0.04,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child:
                                Text('${onboardinglist[i].body}',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black54)
                                ),
                              )
                            ],
                          ),
                        );
                      }
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: FittedBox(
                    child: Column(
                      children: [
                        const SizedBox(height: 15,),
                        Center(
                          child:
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ...List.generate(
                                  onboardinglist.length,
                                      (index) =>AnimatedContainer(
                                    margin: const EdgeInsets.only(right: 5),
                                    width: controller.currentpage==index?17:6,
                                    height: 6,
                                    duration: const Duration(milliseconds: 500),
                                    decoration:   BoxDecoration(
                                        color: controller.currentpage==index?
                                        Colors.blue.shade400: Colors.blue.shade300,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10))),
                                  )
                              ),
                            ],
                          )
                          ,
                        ),
                        const SizedBox(
                          height: 20,),
                        Container(
                          margin: const EdgeInsets.only(bottom: 40),
                          height: 40,
                          child:
                          MaterialButton(
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(30))
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 90),
                            onPressed: (){
                              c.next();
                            },
                            color: Colors.blue.shade300,
                            child:
                             Text('on1.3'.tr,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),),

              ],
            )
        );

      },

    );
  }
}