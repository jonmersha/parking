class ParkingLocation {
  List<Data>? data;

  ParkingLocation({this.data});

  ParkingLocation.fromJson(Map<String, dynamic> json) {
    if (json['Data'] != null) {
      data = <Data>[];
      json['Data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['Data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? locationID;
  String? name;
  String? address;
  double? latitude;
  double? longitude;
  String? type;
  int? capacity;
  int? availability;
  int? price;
  double? rating;
  String? accessibility;
  int? ownerID;
  int? compactCapacity;
  int? sedanCapacity;
  int? sUVCapacity;
  int? largeCarCapacity;

  Data(
      {this.locationID,
        this.name,
        this.address,
        this.latitude,
        this.longitude,
        this.type,
        this.capacity,
        this.availability,
        this.price,
        this.rating,
        this.accessibility,
        this.ownerID,
        this.compactCapacity,
        this.sedanCapacity,
        this.sUVCapacity,
        this.largeCarCapacity});

  Data.fromJson(Map<String, dynamic> json) {
    locationID = json['LocationID'];
    name = json['Name'];
    address = json['Address'];
    latitude = json['Latitude'];
    longitude = json['Longitude'];
    type = json['Type'];
    capacity = json['Capacity'];
    availability = json['Availability'];
    price = json['Price'];
    rating = json['Rating'];
    accessibility = json['Accessibility'];
    ownerID = json['OwnerID'];
    compactCapacity = json['CompactCapacity'];
    sedanCapacity = json['SedanCapacity'];
    sUVCapacity = json['SUVCapacity'];
    largeCarCapacity = json['LargeCarCapacity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['LocationID'] = this.locationID;
    data['Name'] = this.name;
    data['Address'] = this.address;
    data['Latitude'] = this.latitude;
    data['Longitude'] = this.longitude;
    data['Type'] = this.type;
    data['Capacity'] = this.capacity;
    data['Availability'] = this.availability;
    data['Price'] = this.price;
    data['Rating'] = this.rating;
    data['Accessibility'] = this.accessibility;
    data['OwnerID'] = this.ownerID;
    data['CompactCapacity'] = this.compactCapacity;
    data['SedanCapacity'] = this.sedanCapacity;
    data['SUVCapacity'] = this.sUVCapacity;
    data['LargeCarCapacity'] = this.largeCarCapacity;
    return data;
  }
}
