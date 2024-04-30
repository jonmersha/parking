import 'package:get/get.dart';
import 'package:parking/model/parking_location.dart';
import 'package:parking/repository/repo_service.dart';

class LocationController extends GetxController {
  final Services serviceRepo;
  LocationController({required this.serviceRepo});
  List<dynamic> _list = [];
  List<dynamic> get list => _list;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getList(String path) async {
    Response response = await serviceRepo.getAll('$path/get');
//print(response.body);
    if (response.statusCode == 200) {
      _list = [];
      _list.addAll(ParkingLocation.fromJson(response.body).data!);

      _isLoaded = true;
      update();
      _isLoaded = true;
    } else {
      print(response.statusText);
    }
  }
}
