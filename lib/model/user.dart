// import 'dart:convert';

// User userFromJson(String str) => User.fromJson(json.decode(str));

// String userToJson(User data) => json.encode(data.toJson());



// class User {
//   User({
//     this.id,
//     this.name,
//     this.email,
//     this.emailVerifiedAt,
//     this.roleId,
//     this.token,
//     // this.password,
//   });

//   int? id;
//   String? name;
//   String? email;
//   String? emailVerifiedAt;
//   int? roleId;
//   String?  token;
//   // String? password;


//   factory User.fromJson(Map<String, dynamic> json) => User(
//         id: json["id"],
//         name: json["name"],
//         email: json["email"],
//         emailVerifiedAt: json["email_verified_at"],
//         roleId: json["role_id"],
//         token: json["token"],
//         // password: json["password"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "email": email,
//         "email_verified_at": emailVerifiedAt,
//         "role_id": roleId,
//         "token": token,
//         // "password": password,
//       };
// }
