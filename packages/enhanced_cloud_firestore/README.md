# enhanced_cloud_firestore

A wrapper around the cloud firestore dart package with support for filtering, sorting, limiting, error handling and success scenarios

## Getting started

- Add [Firebase Core](https://pub.dev/packages/firebase_core) as a dependency in your pubspec.yaml file
- In your main.dart file, initialize a firebase app

## Usage

Read data in a collection

```dart
final res = EnhancedFirestore.read(collection: 'users');
```

Write data to a collection

```dart
final res = EnhancedFirestore.write(
    collection: 'users',
    payload: {
     'name': 'John',
     'email': 'john@gmail.com',
     'age': '45',
    },
)
```

Update data in a collection

```dart
final res = EnhancedFirestore.update(
    collection: 'users',
    payload: {
     'name': 'John Cena',
     'email': 'johncena@gmail.com',
     'age': '46',
    },
    filters: [
        {
            'field': 'email',
            'filter': FirestoreFilter.isEqualTo,
            'value': 'john@gmail.com',
        }
    ]
)
```

Delete data in a collection

```dart
final res = EnhancedFirestore.delete(
    collection: 'users',
    filters: [
        {
            'field': 'email',
            'filter': FirestoreFilter.isEqualTo,
            'value': 'johncena@gmail.com',
        }
    ]
)
```

## Additional Parameters

#### All of the above four methods are able to take in the following parameters optionally:

---

- filters - An array of filters to apply on the collection. Specified as a json object list with the following keys -> <br>
  - field - The document field to apply the filter on <br>
  - filter - The filter type to apply (is an enum of type FirestoreFilter) <br>
  - value - The field content to match against

---

- onSuccess - A function which will execute on success scenarios <br>

---

- onError - A function which will execute on error scenarios <br>

---

#### The read function can take in the following attributes other than those specified above

---

- sorts - An array of sorts to apply on the collection. Specified as a json object list with the following keys -> <br>
  - field - The document field to apply the sort on <br>
  - descending - A boolean value denoting the sort direction (specify as false to sort in ascending order )

---

- limit - A limit on the number of returned records <br>

---

## Caution

- An empty list of filters on an update function will result in the entire collection being updated

- An empty list of filters on a delete function will result in the entire collection being deleted

---

## Credits

Based on the original cloud_firestore package by Google (https://pub.dev/packages/cloud_firestore)
