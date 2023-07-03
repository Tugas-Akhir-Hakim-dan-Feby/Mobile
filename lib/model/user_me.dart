class User {
    UserClass user;
    List<String> roles;
    Skill skill;

    User({
        required this.user,
        required this.roles,
        required this.skill,
    });

}

class Skill {
    String uuid;
    String skillName;
    String skillDescription;
    DateTime createdAt;
    DateTime updatedAt;

    Skill({
        required this.uuid,
        required this.skillName,
        required this.skillDescription,
        required this.createdAt,
        required this.updatedAt,
    });

}

class UserClass {
    String uuid;
    String membershipCard;
    String name;
    String email;
    int roleId;
    DateTime createdAt;
    DateTime updatedAt;
    List<WelderDocument> welderDocuments;

    UserClass({
        required this.uuid,
        required this.membershipCard,
        required this.name,
        required this.email,
        required this.roleId,
        required this.createdAt,
        required this.updatedAt,
        required this.welderDocuments,
    });

}

class WelderDocument {
    String documentPath;
    DocumentName documentName;
    DateTime createdAt;
    DateTime updatedAt;

    WelderDocument({
        required this.documentPath,
        required this.documentName,
        required this.createdAt,
        required this.updatedAt,
    });

}

enum DocumentName { VIN_DIESEL3_JPG, IMG_20230628_WA0000_JPG, IMG_20230628_WA0009_JPG }
