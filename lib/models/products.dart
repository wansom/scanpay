class Products {
  String barCode;
  String productName;
  String productInfo;
  Products({this.barCode, this.productInfo, this.productName});
}

List<Products> myProducts = [
  Products(
    productName: 'champagne',
    productInfo: 'very sweet and juicy',
    barCode: '036000291452',
  )
];
