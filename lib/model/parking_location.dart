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
  int? iD;
  int? dEVCIEID;
  String? lOCATIONSNAME;
  String? lATITUDE;
  String? lOBGITUDE;

  Data(
      {this.iD,
        this.dEVCIEID,
        this.lOCATIONSNAME,
        this.lATITUDE,
        this.lOBGITUDE});

  Data.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    dEVCIEID = json['DEVCIE_ID'];
    lOCATIONSNAME = json['LOCATIONS_NAME'];
    lATITUDE = json['LATITUDE'];
    lOBGITUDE = json['LOBGITUDE'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['DEVCIE_ID'] = this.dEVCIEID;
    data['LOCATIONS_NAME'] = this.lOCATIONSNAME;
    data['LATITUDE'] = this.lATITUDE;
    data['LOBGITUDE'] = this.lOBGITUDE;
    return data;
  }
}
