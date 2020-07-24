import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:scanpay/models/products_model.dart';
import 'package:scanpay/models/supermaket_modal.dart';

class DatabaseService {
  final CollectionReference supermarketsCollection =
      Firestore.instance.collection('supermarkets');
  //strem for supermarket list
  Stream<List<SingleSupermarket>> get supermarkets {
    return supermarketsCollection.snapshots().map(_superList);
  }

//mapping supermakertmodal to firebase data
  List<SingleSupermarket> _superList(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return SingleSupermarket(
        superName: doc.data['supername'] ?? '',
        stores: doc.data['stores'] ?? '',
      );
    }).toList();
  }

  //read from product details
  List<ProductDetails> _productDetails(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return ProductDetails(
        productCode: doc.data['productcode'] ?? '',
        productInfo: doc.data['productinfo'] ?? '',
        productName: doc.data['productname'] ?? '',
        productPrice: doc.data['productprice'] ?? '',
      );
    }).toList();
  }

//get data from product collection
  final CollectionReference productDectailCollection =
      Firestore.instance.collection('products');
  //product collection details stream
  Stream<List<ProductDetails>> get products {
    return productDectailCollection.snapshots().map((_productDetails));
  }

  //create product collection;
  void createRecord(productData) async {
    DocumentReference ref =
        await Firestore.instance.collection("products").add(productData);
    print(ref.documentID);
  }

  void userData() async {
    var firebaseUser = await FirebaseAuth.instance.currentUser();
    await Firestore.instance
        .collection("users")
        .document(firebaseUser.uid)
        .setData({
      "name": "john",
      "age": 50,
      "email": "example@example.com",
      "address": {"street": "street 24", "city": "new york"}
    }).then((_) {
      print("success!");
    });
  }
}
