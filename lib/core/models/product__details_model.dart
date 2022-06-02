class ProductDetails {
  int? odo;
  String? frameNumber;
  String? firmware;
  double? warranty;
  double? batteryCharge;
  String? batteryType;
  int? batteryHealth;
  String? batteryFirmware;
  double? batteryWarranty;
  String? motorType;
  String? motorSerialNumber;
  String? motorFirmware;
  int? motorWarranty;

  ProductDetails(
      {this.odo,
      this.frameNumber,
      this.firmware,
      this.warranty,
      this.batteryCharge,
      this.batteryType,
      this.batteryHealth,
      this.batteryFirmware,
      this.batteryWarranty,
      this.motorType,
      this.motorSerialNumber,
      this.motorFirmware,
      this.motorWarranty});

  ProductDetails.fromJson(Map<String, dynamic> json) {
    odo = json['odo'];
    frameNumber = json['frameNumber'];
    firmware = json['firmware'];
    warranty = json['warranty'];
    batteryCharge = json['batteryCharge'];
    batteryType = json['batteryType'];
    batteryHealth = json['batteryHealth'];
    batteryFirmware = json['batteryFirmware'];
    batteryWarranty = json['batteryWarranty'];
    motorType = json['motorType'];
    motorSerialNumber = json['motorSerialNumber'];
    motorFirmware = json['motorFirmware'];
    motorWarranty = json['motorWarranty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['odo'] = odo;
    data['frameNumber'] = frameNumber;
    data['firmware'] = firmware;
    data['warranty'] = warranty;
    data['batteryCharge'] = batteryCharge;
    data['batteryType'] = batteryType;
    data['batteryHealth'] = batteryHealth;
    data['batteryFirmware'] = batteryFirmware;
    data['batteryWarranty'] = batteryWarranty;
    data['motorType'] = motorType;
    data['motorSerialNumber'] = motorSerialNumber;
    data['motorFirmware'] = motorFirmware;
    data['motorWarranty'] = motorWarranty;
    return data;
  }
}
