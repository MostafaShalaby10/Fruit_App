class   Data {
  num? userId;
  String? status;
  String? paymentType;
  num? orderTotalPrice;
  String? userNotes;
  String? userIp;
  String? userPcInfo;
  DateTime? updatedAt;
  DateTime? createdAt;
  num? id;

  Data({
    this.userId,
    this.status,
    this.paymentType,
    this.orderTotalPrice,
    this.userNotes,
    this.userIp,
    this.userPcInfo,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory Data.fromJson(
    Map<String, dynamic> json,
  ) {
    return Data(
      userId: num.tryParse(json['user_id'].toString()),
      status: json['status']?.toString(),
      paymentType: json['payment_type']?.toString(),
      orderTotalPrice: num.tryParse(json['order_total_price'].toString()),
      userNotes: json['user_notes']?.toString(),
      userIp: json['user_ip']?.toString(),
      userPcInfo: json['user_pc_info']?.toString(),
      updatedAt:
          json['updated_at'] == null
              ? null
              : DateTime.tryParse(json['updated_at'].toString()),
      createdAt:
          json['created_at'] == null
              ? null
              : DateTime.tryParse(json['created_at'].toString()),
      id: num.tryParse(json['id'].toString()),
    );
  }

  Map<String, dynamic>
  toJson() {
    return {
      if (userId != null) 'user_id': userId,
      if (status != null) 'status': status,
      if (paymentType != null) 'payment_type': paymentType,
      if (orderTotalPrice != null) 'order_total_price': orderTotalPrice,
      if (userNotes != null) 'user_notes': userNotes,
      if (userIp != null) 'user_ip': userIp,
      if (userPcInfo != null) 'user_pc_info': userPcInfo,
      if (updatedAt != null) 'updated_at': updatedAt?.toIso8601String(),
      if (createdAt != null) 'created_at': createdAt?.toIso8601String(),
      if (id != null) 'id': id,
    };
  }
}
