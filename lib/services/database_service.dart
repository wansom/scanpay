import 'package:cloud_firestore/cloud_firestore.dart';
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
}
