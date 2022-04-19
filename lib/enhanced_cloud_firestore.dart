library enhanced_cloud_firestore;

import 'package:cloud_firestore/cloud_firestore.dart';

class EnhancedFirestore {
  static Future<dynamic> read({required String collection, List<dynamic>? filters, List<dynamic>? sorts, int? limit}) async {
    filters ??= [];
    sorts ??= [];
    List<dynamic> data = [];
    dynamic collectionRef = _filteredCollectionRef(collection: collection, filters: filters, sorts: sorts);
    if (limit != null) collectionRef = collectionRef.limit(limit);
    await collectionRef.get().then((QuerySnapshot querySnapshot) {
      if (querySnapshot.docs.isNotEmpty) data = querySnapshot.docs;
    });
    return limit == 1 ? (data.isNotEmpty ? data[0] : null) : data;
  }

  static Future<dynamic> write({required String collection, required dynamic payload, String? successMessage}) async {
    dynamic res = "Data entered successfully";
    CollectionReference collectionRef = FirebaseFirestore.instance.collection(collection);
    await collectionRef.add(payload).then((value) {
      if (successMessage != null) res = successMessage;
    }).catchError((error) {
      res = error;
    });
    return res;
  }

  static Future<dynamic> update({required String collection, List<dynamic>? filters, required dynamic payload}) async {
    filters ??= [];
    dynamic res = "Data updated successfully";
    dynamic collectionRef = _filteredCollectionRef(collection: collection, filters: filters, sorts: []);
    await collectionRef.get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((element) {
        FirebaseFirestore.instance.collection(collection).doc(element.id).update(payload).catchError((error) {
          res = error;
        });
      });
    }).catchError((error) {
      res = error;
    });
    return res;
  }

  static Future<dynamic> delete({required String collection, List<dynamic>? filters, bool truncateFully = false}) async {
    filters ??= [];
    dynamic res = "Data deleted successfully";
    if (!truncateFully) {
      dynamic collectionRef = _filteredCollectionRef(collection: collection, filters: filters, sorts: []);
      await collectionRef.get().then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((element) {
          FirebaseFirestore.instance.collection(collection).doc(element.id).delete().catchError((error) {
            res = error;
          });
        });
      }).catchError((error) {
        res = error;
      });
    } else {
      List<dynamic> records = await read(collection: collection);
      records.forEach((element) {
        FirebaseFirestore.instance.collection(collection).doc(element.id).delete().catchError((error) {
          res = error;
        });
      });
    }
    return res;
  }

  static dynamic _filteredCollectionRef({required String collection, required List<dynamic> filters, required List<dynamic> sorts}) {
    dynamic collectionRef = FirebaseFirestore.instance.collection(collection);
    filters.forEach((filter) {
      collectionRef = collectionRef.where(filter['name'], isEqualTo: filter['value']);
    });
    sorts.forEach((sort) {
      collectionRef = collectionRef.orderBy(sort['name'], descending: sort['descending']);
    });
    return collectionRef;
  }
}
