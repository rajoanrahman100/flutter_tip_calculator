import 'package:get/get.dart';

class TipController extends GetxController{

  RxDouble bill=0.0.obs;
  RxDouble tip=0.0.obs;
  RxInt person=1.obs;

  RxDouble tipPerPerson=0.0.obs;
  RxDouble totalPerPerson=0.0.obs;

  void calculateTheTip(){
    tipPerPerson.value=(bill.value*tip.value)/person.value;
    totalPerPerson.value=(bill.value*(1+tip.value))/person.value;
  }
}