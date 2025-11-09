import 'package:get/get.dart';
import '../models/device_model.dart';
import '../services/api_client.dart';

class DeviceController extends GetxController {
  final ApiClient apiClient = ApiClient();

  var deviceList = <DeviceDetails>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    getDevices();
  }

  Future<void> getDevices() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      final devices = await apiClient.getData();
      deviceList.assignAll(devices);
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
