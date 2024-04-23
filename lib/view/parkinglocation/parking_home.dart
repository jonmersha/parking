import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:parking/controller/location_controller.dart';
import 'package:parking/helper/constant_path.dart';

class ParkingHome extends StatelessWidget {
  const ParkingHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<LocationController>(
        builder: (locationController) {
          return locationController.isLoaded
              ? RefreshIndicator(
            onRefresh: refreshList,
            child: ListView.builder(
                itemCount: locationController.list.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {

                    },
                    child: Text(locationController.list[index].lOCATIONSNAME)
                    // SizedBox(
                    //   height: 390,
                    //   child: VideoCard(
                    //     title: videoController.list[index].title!,
                    //     rating: 4.5,
                    //     likes: 2,
                    //     views: videoController.list[index].videoView!,
                    //     subtitle:
                    //     videoController.list[index].videoDescription!,
                    //     imageUrl: videoController.list[index].imageUrl,
                    //   ),
                    // ),
                  );
                }),
          )
              : const Center(
            child: CircularProgressIndicator(
              color: Colors.green,
            ),
          );
        },
      ),
    );
  }

  Future<void> refreshList() async {
    Get.find<LocationController>().getList(PARKING);
  }
}
// echo "# parking" >> README.md
// git init
// git add README.md
// git commit -m "first commit"
// git branch -M main
// git remote add origin https://github.com/jonmersha/parking.git
// git push -u origin main