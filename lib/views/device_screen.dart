import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/device_controller.dart';

class DeviceScreen extends StatelessWidget {
  final DeviceController controller = Get.put(DeviceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Devices"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (controller.errorMessage.isNotEmpty) {
          return Center(child: Text(controller.errorMessage.value));
        } else if (controller.deviceList.isEmpty) {
          return const Center(child: Text("No devices found"));
        } else {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children:
                    controller.deviceList.map((device) {
                      return DeviceCard(
                        name: device.name,
                        id: device.id,
                        color:
                            device.data?.dataColor ??
                            device.data?.color ??
                            "Unknown",
                        price:
                            device.data?.price?.toString() ??
                            device.data?.dataPrice?.toString() ??
                            "N/A",
                      );
                    }).toList(),
              ),
            ),
          );
        }
      }),
    );
  }
}

class DeviceCard extends StatelessWidget {
  final String name;
  final String id;
  final String color;
  final String price;

  const DeviceCard({
    super.key,
    required this.name,
    required this.id,
    required this.color,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            const Icon(
              Icons.devices_outlined,
              size: 40,
              color: Colors.blueAccent,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text("ID: $id", style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 5),
                  Text("Color: $color", style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 5),
                  Text("Price: $price", style: const TextStyle(fontSize: 16)),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 24,
              color: Colors.blueAccent,
            ),
          ],
        ),
      ),
    );
  }
}
