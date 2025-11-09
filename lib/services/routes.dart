import 'package:get/get_navigation/src/routes/get_route.dart';

import '../views/device_screen.dart';



class Routes{
  static String deviceScreen='/';
}

List<GetPage> pages=[
  GetPage(name: '/', page: ()=>DeviceScreen()),
];



