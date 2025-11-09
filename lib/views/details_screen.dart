import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(
        title: Text("Device Details"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                
                Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Icon(Icons.devices_outlined, size: 100, color: Colors.blueAccent),
                  
                  
                ),
                SizedBox(height: 20,),


                
              ],
            )




          ),
        ),
      ),


    );
  }

}
class DeviceCard extends StatelessWidget {
  final String name;
  final String id;
  final String color;
  final String price;
  final String capacity;
  final String year;

  const DeviceCard({
    super.key,
    required this.name,
    required this.id,
    required this.color,
    required this.price,
    required this.capacity,
    required this.year,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {Get.toNamed("/details", arguments: id);},
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
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
      ),
    );
  }
}

