library enhanced_cloud_firestore;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enhanced_cloud_firestore/enums/firestore_filter.dart';

class EnhancedFirestore {
  static Future<dynamic> read(
      {required String collection,
      List<dynamic>? filters,
      List<dynamic>? sorts,
      int? limit,
      Function? onSuccess,
      Function? onError}) async {
    filters ??= [];
    sorts ??= [];
    List<dynamic> data = [];
    dynamic collectionRef = _filteredCollectionRef(
        collection: collection, filters: filters, sorts: sorts);
    if (limit != null) collectionRef = collectionRef.limit(limit);
    await collectionRef.get().then((QuerySnapshot querySnapshot) {
      if (querySnapshot.docs.isNotEmpty) data = querySnapshot.docs;
      if (onSuccess != null) onSuccess(querySnapshot);
    }).catchError((error) {
      if (onError != null) onError(error);
    });
    return limit == 1 ? (data.isNotEmpty ? data[0] : null) : data;
  }

  static Future<dynamic> write(
      {required String collection,
      required dynamic payload,
      Function? onSuccess,
      Function? onError}) async {
    dynamic res = "Data entered successfully";
    CollectionReference collectionRef =
        FirebaseFirestore.instance.collection(collection);
    await collectionRef.add(payload).then((value) {
      if (onSuccess != null) onSuccess(value);
    }).catchError((error) {
      if (onError != null) onError(error);
      res = error;
    });
    return res;
  }

  static Future<dynamic> update(
      {required String collection,
      List<dynamic>? filters,
      required dynamic payload,
      Function? onSuccess,
      Function? onError}) async {
    filters ??= [];
    dynamic res = "Data updated successfully";
    dynamic collectionRef = _filteredCollectionRef(
        collection: collection, filters: filters, sorts: []);
    await collectionRef.get().then((QuerySnapshot querySnapshot) async {
      bool errors = false;
      List<dynamic> updatedIds = [];
      for (QueryDocumentSnapshot element in querySnapshot.docs) {
        await FirebaseFirestore.instance
            .collection(collection)
            .doc(element.id)
            .update(payload)
            .then((value) => updatedIds.add(element.id))
            .catchError((error) {
          if (onError != null) onError(error);
          errors = true;
          res = error;
        });
      }
      if (!errors && onSuccess != null) onSuccess(updatedIds);
    }).catchError((error) {
      if (onError != null) onError(error);
      res = error;
    });
    return res;
  }

  static Future<dynamic> delete(
      {required String collection,
      List<dynamic>? filters,
      Function? onSuccess,
      Function? onError}) async {
    filters ??= [];
    dynamic res = "Data deleted successfully";
    dynamic collectionRef = _filteredCollectionRef(
        collection: collection, filters: filters, sorts: []);
    await collectionRef.get().then((QuerySnapshot querySnapshot) async {
      bool errors = false;
      List<String> deletedIds = [];
      for (QueryDocumentSnapshot element in querySnapshot.docs) {
        await FirebaseFirestore.instance
            .collection(collection)
            .doc(element.id)
            .delete()
            .then((value) => deletedIds.add(element.id))
            .catchError((error) {
          if (onError != null) onError(error);
          errors = true;
          res = error;
        });
      }
      if (!errors && onSuccess != null) onSuccess(deletedIds);
    }).catchError((error) {
      if (onError != null) onError(error);
      res = error;
    });
    return res;
  }

  static dynamic _filteredCollectionRef(
      {required String collection,
      required List<dynamic> filters,
      required List<dynamic> sorts}) {
    dynamic collectionRef = FirebaseFirestore.instance.collection(collection);
    filters.forEach((filter) {
      if (filter['filter'] == FirestoreFilter.isEqualTo) {
        collectionRef =
            collectionRef.where(filter['field'], isEqualTo: filter['value']);
      } else if (filter['filter'] == FirestoreFilter.isNotEqualTo) {
        collectionRef =
            collectionRef.where(filter['field'], isNotEqualTo: filter['value']);
      } else if (filter['filter'] == FirestoreFilter.isGreaterThan) {
        collectionRef = collectionRef.where(filter['field'],
            isGreaterThan: filter['value']);
      } else if (filter['filter'] == FirestoreFilter.isLessThan) {
        collectionRef =
            collectionRef.where(filter['field'], isLessThan: filter['value']);
      } else if (filter['filter'] == FirestoreFilter.isGreaterThanOrEqualTo) {
        collectionRef = collectionRef.where(filter['field'],
            isGreaterThanOrEqualTo: filter['value']);
      } else if (filter['filter'] == FirestoreFilter.isLessThanOrEqualTo) {
        collectionRef = collectionRef.where(filter['field'],
            isLessThanOrEqualTo: filter['value']);
      } else if (filter['filter'] == FirestoreFilter.arrayContains) {
        collectionRef = collectionRef.where(filter['field'],
            arrayContains: filter['value']);
      } else if (filter['filter'] == FirestoreFilter.arrayContainsAny) {
        collectionRef = collectionRef.where(filter['field'],
            arrayContainsAny: filter['value']);
      } else if (filter['filter'] == FirestoreFilter.whereIn) {
        collectionRef =
            collectionRef.where(filter['field'], whereIn: filter['value']);
      } else if (filter['filter'] == FirestoreFilter.whereNotIn) {
        collectionRef =
            collectionRef.where(filter['field'], whereNotIn: filter['value']);
      } else {
        throw Exception('Invalid filter');
      }
    });
    sorts.forEach((sort) {
      collectionRef =
          collectionRef.orderBy(sort['field'], descending: sort['descending']);
    });
    return collectionRef;
  }
}
