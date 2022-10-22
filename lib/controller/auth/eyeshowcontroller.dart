import 'package:get/get.dart';

class EyeContrroller extends GetxController{
  bool show1 =false;
  void showeyes(){
    print(show1);
   this.show1 = !this.show1;
   update();
  }
  bool show2 =false;
  void showeyes2(){
    print(show2);
    this.show2 = !this.show2;
    update();
  }

}