import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zakate/controller/account_controller.dart';
import 'package:zakate/core/constant/images.dart';
import 'package:zakate/core/localization/changelanguage.dart';
import 'package:zakate/core/services/myservices.dart';
import '../../widget/profile/customlisttitle.dart';

class Profile extends StatelessWidget{
   Profile({super.key});
 MyServices myServices=Get.find();
  @override
  Widget build(BuildContext context) {
    Changelang changelang=Get.put(Changelang());
    AccountControllerImp controller =Get.put(AccountControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                  color:Colors.blue[400],
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),),
              width: MediaQuery.of(context).size.width,

              child: FittedBox(
                child: Container(

                  decoration: BoxDecoration(
                    color:Colors.blue[400],
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    )
                  ),
                  width: MediaQuery.of(context).size.width,
                  child:
                  GetBuilder<AccountControllerImp>(
                   builder: (c){
                     return Column(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Padding(
                             padding:  EdgeInsets.only(top: 18.0),
                             child:
                            c.x==false?
                            CircleAvatar(
                              backgroundImage:const AssetImage(AppImages.person),
                              maxRadius: 80,
                              child: Container(
                                  alignment: Alignment.bottomRight,
                                  child: IconButton(
                                      onPressed: (){
                                        controller.takePhoto();
                                      }, icon:  const Icon(Icons.camera_alt_sharp,color: Colors.white,))),
                            ):
                            CircleAvatar(
                              backgroundImage: MemoryImage(c.bytes2),
                              maxRadius: 80,
                              child: Container(
                                  alignment: Alignment.bottomRight,
                                  child: IconButton(
                                      onPressed: (){
                                        controller.takePhoto();
                                      }, icon:  const Icon(Icons.camera_alt_sharp,color: Colors.white,))),
                            )
                         ),
                         Container(
                           alignment: Alignment.centerRight,
                           child:
                           ListTile(
                             title: Center(child:
                             Text('${c.getusername()}',
                               style: const TextStyle(color: Colors.white,
                                   fontSize: 25,
                                   fontWeight: FontWeight.bold
                               ),

                             )),
                             subtitle: Center(
                               child: Text('${c.getemail()}',
                                 style: const TextStyle(color: Colors.white70,
                                   fontSize: 13,
                                 ),
                               ),
                             ),
                           )
                           ,)

                       ],
                     );
                   },
                  )
                ),
              ),
            )),
        Expanded(
            flex: 2,
            child:
            SingleChildScrollView(
              child: Column(
                children:  [
                  const SizedBox(height: 15,),
                  CustomListTitle(
                    title: 'pp1'.tr,
                    icon: Icons.email_outlined,
                    onTap: () async{
                    controller.gotochnageemail();

                    },
                  ),
                  const SizedBox(height: 15,),
                  CustomListTitle(
                    title: 'pp2'.tr,
                    icon: Icons.security,
                    onTap: () {
                      controller.gotochangepassword();
                    },
                  ),
                  const SizedBox(height: 15,),
                  CustomListTitle(
                    title: 'pp3'.tr,
                    icon: Icons.location_on_outlined,
                    onTap: () {  },
                  ),
                  const SizedBox(height: 15,),
                  CustomListTitle(
                    title: 'pp4'.tr,
                    icon: Icons.language,
                    onTap: () {
                      var l=myServices.sharedPreferences!.getString('lang');
                      if(l=='ar'){
                        changelang.changelanguage('en');
                      }else{
                        changelang.changelanguage('ar');

                      }
                    },
                  ),
                  const SizedBox(height: 15,),
                  CustomListTitle(
                    title: 'pp5'.tr,
                    icon: Icons.logout,
                    onTap: () {
                     controller.signout();
                    },
                  ),
                  const SizedBox(height: 15,),

                ],
              ),
            ))
      ],
      ),
    );
  }
}