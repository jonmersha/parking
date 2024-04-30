class Pricing {
  List<Data>? data;
  Pricing({this.data});

  Pricing.fromJson(Map<String, dynamic> json) {
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
  int? pricingID;
  String? carSize;
  int? maxTimeInHours;
  int? price;
  int? parkingLocationID;

  Data(
      {this.pricingID,
        this.carSize,
        this.maxTimeInHours,
        this.price,
        this.parkingLocationID});

  Data.fromJson(Map<String, dynamic> json) {
    pricingID = json['PricingID'];
    carSize = json['CarSize'];
    maxTimeInHours = json['MaxTimeInHours'];
    price = json['Price'];
    parkingLocationID = json['ParkingLocationID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PricingID'] = this.pricingID;
    data['CarSize'] = this.carSize;
    data['MaxTimeInHours'] = this.maxTimeInHours;
    data['Price'] = this.price;
    data['ParkingLocationID'] = this.parkingLocationID;
    return data;
  }
}
