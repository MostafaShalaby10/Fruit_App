import 'attribute.dart';

class Product {
  num? productId;
  num? quantity;
  num? price;
  List<Attribute>? attributes;

  Product({this.productId, this.quantity, this.price, this.attributes});

  factory Product.fromJson(
    Map<String, dynamic> json,
  ) {
    return Product(
      productId: num.tryParse(json['product_id'].toString()),
      quantity: num.tryParse(json['quantity'].toString()),
      price: num.tryParse(json['price'].toString()),
      attributes:
          (json['attributes'] as List<dynamic>?)
              ?.map(
                (e) =>
                    Attribute.fromJson(
                      Map<String, dynamic>.from(e),
                    ),
              )
              .toList(),
    );
  }

  Map<String, dynamic>
  toJson() {
    return {
      if (productId != null) 'product_id': productId,
      if (quantity != null) 'quantity': quantity,
      if (price != null) 'price': price,
      if (attributes != null)
        'attributes':
            attributes
                ?.map(
                  (e) =>
                      e.toJson(),
                )
                .toList(),
    };
  }
}
