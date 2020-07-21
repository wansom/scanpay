class Products {
  String barCode;
  String productName;
  String productInfo;
  Products({this.barCode, this.productInfo, this.productName});
}

List<Products> myProducts = [
  Products(
    productName: 'hello',
    productInfo: 'very sweet and juicy',
    barCode: '22230666',
  )
];
