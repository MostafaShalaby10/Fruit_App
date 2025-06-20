class BasketModel{
  int? productId ;
  String? productName;
  String? image;
  int? quantity;
  dynamic itemPrice ;
  dynamic discount ;

  BasketModel({this.productId, this.productName, this.quantity, this.itemPrice , this.image , this.discount});

  Map<String , dynamic> toMap(){
    return {
     "product_id" : productId ,
      "product_name" : productName ,
      "quantity" : quantity ,
      "item_price" : itemPrice ,
      "image" : image ,
      "discount" : discount ,
  };
}
}