import 'package:get/get.dart';
import 'package:submission_restaurantapp/app/data/model/user_profile_model.dart';
import 'package:submission_restaurantapp/hive_helper/hive_services.dart';

class ProfileController extends GetxController {
  final userData = UserProfileModel().obs;

  @override
  void onInit() {
    super.onInit();
    userData(UserProfileModel(
      name: 'Ade Iwan Ridwanudin',
      email: 'ridwanudin45@gmail.com',
      bird: '28 April 1988',
      contact: '087772223333',
      birdPlace: 'Lebak',
      alamat: 'Cilaja Hilir, Maja, Lebak - Banten, 42381',
      userName: HiveServices.instance.box.get(BoxKey.keyUserName,defaultValue: 'airidwan'),
      imageUrl: 'https://avatars.githubusercontent.com/u/9293764?s=400&u=30a12020e34b9f06b41989acfa2d890c237ad933&v=4',
    ));
  }

 
}
