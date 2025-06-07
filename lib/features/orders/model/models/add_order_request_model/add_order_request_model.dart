import 'product.dart';

class AddOrderRequestModel {
  num? orderTotalPrice;
  String? paymentType;
  String? address;
  String? deliveryTime;
  List<Product>? products;

  AddOrderRequestModel({
    this.orderTotalPrice,
    this.paymentType,
    this.address,
    this.deliveryTime,
    this.products,
  });

  factory AddOrderRequestModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return AddOrderRequestModel(
      orderTotalPrice: num.tryParse(json['order_total_price'].toString()),
      paymentType: json['payment_type']?.toString(),
      address: json['address']?.toString(),
      deliveryTime: json['delivery_time']?.toString(),
      products:
          (json['products'] as List<dynamic>?)
              ?.map(
                (e) =>
                    Product.fromJson(
                      Map<String, dynamic>.from(e),
                    ),
              )
              .toList(),
    );
  }

  Map<String, dynamic>
  toJson() {
    return {
      if (orderTotalPrice != null) 'order_total_price': orderTotalPrice,
      if (paymentType != null) 'payment_type': paymentType,
      if (address != null) 'address': address,
      if (deliveryTime != null) 'delivery_time': deliveryTime,
      if (products != null)
        'products':
            products
                ?.map(
                  (e) =>
                      e.toJson(),
                )
                .toList(),
    };
  }
}
