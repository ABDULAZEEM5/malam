class ModelOrder {
  final String userid;
  final String acceptedby;
  final String service;
  final String description;
  final String address;
  final String orderstatus;
  final String orderid;
  final dynamic timecreated;
  final List<String?> rejectedby;
  ModelOrder({
    required this.acceptedby,
    required this.rejectedby,
    required this.orderid,
    required this.timecreated,
    required this.orderstatus,
    required this.userid,
    required this.description,
    required this.service,
    required this.address,
  });
  factory ModelOrder.fromMap(Map<dynamic, dynamic> map) {
    return ModelOrder(
      orderstatus: map["orderstatus"] ?? '',
      userid: map["userid"] ?? '',
      acceptedby: map["acceptedby"] ?? '',
      description: map["description"] ?? '',
      service: map["service"] ?? '',
      address: map["address"] ?? '',
      orderid: map["orderId"] ?? '',
      rejectedby: List.from(map["rejectedby"] ?? ''),
      timecreated: map["createdAt"] ?? '',
    );
  }
  // Map<String, dynamic> toMap() => {
  //   "userid": userid,
  //   "orderstatus": orderstatus,
  //   "technicalid": technicalid,
  //   "description": description,
  //   "service": service,
  //   "address": address,
  // };
}
