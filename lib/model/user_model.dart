

class DataUser {
  final String messegae;
  final int statusCode;
  final String token;
  final User user;

  DataUser(
    {
      required this.messegae,
      required this.statusCode,
      required this.token,
      required this.user,
    }
  );

    factory DataUser.fromJson(Map<String, dynamic> json) {
    return DataUser(
        messegae: json['messegae'],
        statusCode: json['statusCode'],
        token: json['token'],
        user: User.fromJson(json['user']));
  }
}

class User{
  final int id;
  final String name;
  final String email;
  final String emailVerifiedAt;
  final int roleId;
  final String createdAt;
  final String updatedAt;
  final Role roles;

  User(
    {
      required this.id,
      required this.name,
      required this.email,
      required this.emailVerifiedAt,
      required this.roleId,
      required this.createdAt,
      required this.updatedAt,
      required this.roles,
    }
  );

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      emailVerifiedAt: json['emailVerifiedAt'],
      roleId: json['roleId'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      roles: Role.fromJson(json['roles'])
    );
  }
  
}

class Role {
  final int id;
  final String name;
  final String guardName;
  final String createdAt;
  final String updatedAt;
  final Pivot pivot;
  
  Role({
    required this.id,
    required this.name,
    required this.guardName,
    required this.createdAt,
    required this.updatedAt,
    required this.pivot,
  });
  


  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      id: json['id'],
      name: json['name'],
      guardName: json['guardName'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      pivot: Pivot.fromJson(json['pivot'])
    );
  }

}



class Pivot {
  final int modelId;
  final int roleId;
  final String modelname;
  
  Pivot({
    required this.modelId,
    required this.roleId,
    required this.modelname,
  });


  factory Pivot.fromJson(Map<String, dynamic> json) {
    return Pivot(
      modelId: json['modelId'],
      roleId: json['roleId'],
      modelname: json['modelname'],
    );
  }
}

