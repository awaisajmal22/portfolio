import 'package:flutter/foundation.dart' show immutable;

@immutable
class UserModel {
   String? name;
   String? email;
   String? password;
   String? phoneNumber;

   UserModel({
     this.name,
     this.email,
     this.password,
     this.phoneNumber,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber,
    };
  }
}
