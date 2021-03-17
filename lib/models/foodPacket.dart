class FoodPacket {
  String amount;
  String remark;
  double latitude;
  double longitude;
  String dateTime;
  String donor;
  String manualAddress;

  FoodPacket(
      {this.amount,
      this.dateTime,
      this.donor,
      this.latitude,
      this.longitude,
      this.remark,
      this.manualAddress});

  Map toMap() {
    var map = Map<String, dynamic>();

    map['donor'] = this.donor;
    map['amountCat'] = this.amount;
    map['remark'] = this.remark;
    map['latitude'] = this.latitude;
    map['longitude'] = this.longitude;
    map['timeStamp'] = this.dateTime;
    map['manualAddress'] = this.manualAddress;

    return map;
  }
}