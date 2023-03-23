## 3.0.0

* Added support for creating multiple instances
* Added http patch and http head method support
* Added support for providing headers at method level
* Added dart API documentation
* Updated the *path* parameter of request methods from a named parameter to a positional parameter
* Removed the *onSuccess* and *onError* parameters in favor of a single *interceptors* parameter which is available at both instance and method level
* Removed the *formData* parameter. A request is now considered as multipart/form-data based on the request header itself
* Refactored library code into separate files