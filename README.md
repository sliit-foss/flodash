# enhanced-http
An enhanced version of the dart http package based on axios

## Getting started



Initialize enhanced http as follows : 

```dart
EnhancedHttp.initialize(baseURL: 'https://dog.ceo/api');
```

Custom headers can be provided through the name parameter 'headers' ( Default content type is specified as application/json ) : 

```dart
EnhancedHttp.initialize(
    baseURL: Constants.apiBaseURL,
    headers: {'Authorization': "Bearer $token"},
);
```

A default error message can be provided to return in case of unexpected errors : 

```dart
EnhancedHttp.initialize(
    baseURL: Constants.apiBaseURL,
    defaultErrorMessage: "An error has occurred please try again later"
);
```

Provide a function which can isolate and return an error from the response format of your server : 

```dart
convertAndNotifyError(dynamic errorResponse){
  if (errorResponse['error'].runtimeType == String)
    return errorResponse['error'];
  if (errorResponse['error'].runtimeType == [].runtimeType){
    String firstKey = '';
    errorResponse['error'].forEach((key, value) {
      if (firstKey == '') firstKey = key;
    });
    return errorResponse['message'][firstKey]['error'];
  }
  return "An error has occurred please try again later";
}

EnhancedHttp.initialize(
    baseURL: Constants.apiBaseURL,
    errorTransformer: convertAndNotifyError
);
```

## Usage



Fetch data from an api endpoint - GET

```dart
final res = await EnhancedHttp.get(path: "/path");
```

Send data to an api endpoint - POST

```dart
final res = await EnhancedHttp.post(path: "/path", {
    "data": "This is some sample data to send to a server"
});
```

Update data at an api endpoint - PUT

```dart
final res = await EnhancedHttp.put(path: "/path", {
    "data": "This is some sample data to update at a server"
});
```

Delete data at an api endpoint - DELETE

```dart
final res = await EnhancedHttp.delete(path: "/path");
```

## Additional Parameters

All requests can take in the parameter expectedStatus which is the status code that is expected to be returned from the server. If the status code returned is not the same as the one provided, an error will be thrown. The default value is 200.

```dart
final res = await EnhancedHttp.get(path: "/path", expectedStatus: 200, onSuccess: () => {
    print("Data fetched from server successfully");
});
```


All requests can take in a function which executes if the response http status code matches the provided or default expectedStatus

```dart
final res = await EnhancedHttp.get(path: "/path", expectedStatus: 200, onSuccess: () => {
    print("Data fetched from server successfully");
});
```

Specify the 'formData' attribute as true if the request payload needs to be in the form of multipart/form-data

```dart
final res = await EnhancedHttp.post(path: "/path", expectedStatus: 200,
    payload: {
        "data": "This is some sample data to update at a server"
    },
    formData: true,
    onSuccess: () => {
        print("Multipart request sent successfully");
    }
);
```

The files attribute on the http post and http put methods can be used to send files to the server

```dart
final res = await EnhancedHttp.post(path: "/path", expectedStatus: 200,
    payload: {
        "data": "This is some sample data to update at a server"
    },
    formData: true,
    files: [
        {
            "array_key": "file",
            "file": File("path_to_file")
        }
    ],
    onSuccess: () => {
        print("File sent successfully");
    }
);
```

## Credits



Based on the original dart http package by Google (https://pub.dev/packages/http)

