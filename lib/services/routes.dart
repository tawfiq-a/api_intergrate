import 'package:get/get_navigation/src/routes/get_route.dart';

import '../views/details_screen.dart';
import '../views/device_screen.dart';



class Routes{
  static String deviceScreen='/';
  static String detailsScreen='/details';
}

List<GetPage> pages=[
  GetPage(name: '/', page: ()=>DeviceScreen()),
  GetPage(name: '/details', page: ()=>DetailsScreen()),
];



