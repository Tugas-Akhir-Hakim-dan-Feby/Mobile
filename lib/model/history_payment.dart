// import 'dart:convert';

// PaymentHistory paymentHistoryFromJson(String str) => PaymentHistory.fromJson(json.decode(str));

// String paymentHistoryToJson(PaymentHistory data) => json.encode(data.toJson());

// class PaymentHistory {
//     List<Data> data;
//     Links links;
//     Meta meta;

//     PaymentHistory({
//         required this.data,
//         required this.links,
//         required this.meta,
//     });

//     factory PaymentHistory.fromJson(Map<String, dynamic> json) => PaymentHistory(
//         data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
//         links: Links.fromJson(json["links"]),
//         meta: Meta.fromJson(json["meta"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "data": List<dynamic>.from(data.map((x) => x.toJson())),
//         "links": links.toJson(),
//         "meta": meta.toJson(),
//     };
// }

// class Data {
//     String uuid;
//     String externalId;
//     String status;
//     String amount;
//     String paymentLink;
//     String description;
//     DateTime createdAt;
//     DateTime updatedAt;
//     User user;

//     Data({
//         required this.uuid,
//         required this.externalId,
//         required this.status,
//         required this.amount,
//         required this.paymentLink,
//         required this.description,
//         required this.createdAt,
//         required this.updatedAt,
//         required this.user,
//     });

//     factory Data.fromJson(Map<String, dynamic> json) => Data(
//         uuid: json["uuid"],
//         externalId: json["external_id"],
//         status: json["status"],
//         amount: json["amount"],
//         paymentLink: json["payment_link"],
//         description: json["description"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         user: User.fromJson(json["user"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "uuid": uuid,
//         "external_id": externalId,
//         "status": status,
//         "amount": amount,
//         "payment_link": paymentLink,
//         "description": description,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//         "user": user.toJson(),
//     };
// }

// class User {
//     String uuid;
//     String name;
//     String email;
//     int roleId;
//     DateTime createdAt;
//     DateTime updatedAt;

//     User({
//         required this.uuid,
//         required this.name,
//         required this.email,
//         required this.roleId,
//         required this.createdAt,
//         required this.updatedAt,
//     });

//     factory User.fromJson(Map<String, dynamic> json) => User(
//         uuid: json["uuid"],
//         name: json["name"],
//         email: json["email"],
//         roleId: json["role_id"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "uuid": uuid,
//         "name": name,
//         "email": email,
//         "role_id": roleId,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//     };
// }

// class Links {
//     String first;
//     String last;
//     dynamic prev;
//     dynamic next;

//     Links({
//         required this.first,
//         required this.last,
//         this.prev,
//         this.next,
//     });

//     factory Links.fromJson(Map<String, dynamic> json) => Links(
//         first: json["first"],
//         last: json["last"],
//         prev: json["prev"],
//         next: json["next"],
//     );

//     Map<String, dynamic> toJson() => {
//         "first": first,
//         "last": last,
//         "prev": prev,
//         "next": next,
//     };
// }

// class Meta {
//     int currentPage;
//     int from;
//     int lastPage;
//     List<Link> links;
//     String path;
//     int perPage;
//     int to;
//     int total;

//     Meta({
//         required this.currentPage,
//         required this.from,
//         required this.lastPage,
//         required this.links,
//         required this.path,
//         required this.perPage,
//         required this.to,
//         required this.total,
//     });

//     factory Meta.fromJson(Map<String, dynamic> json) => Meta(
//         currentPage: json["current_page"],
//         from: json["from"],
//         lastPage: json["last_page"],
//         links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
//         path: json["path"],
//         perPage: json["per_page"],
//         to: json["to"],
//         total: json["total"],
//     );

//     Map<String, dynamic> toJson() => {
//         "current_page": currentPage,
//         "from": from,
//         "last_page": lastPage,
//         "links": List<dynamic>.from(links.map((x) => x.toJson())),
//         "path": path,
//         "per_page": perPage,
//         "to": to,
//         "total": total,
//     };
// }

// class Link {
//     String? url;
//     String label;
//     bool active;

//     Link({
//         this.url,
//         required this.label,
//         required this.active,
//     });

//     factory Link.fromJson(Map<String, dynamic> json) => Link(
//         url: json["url"],
//         label: json["label"],
//         active: json["active"],
//     );

//     Map<String, dynamic> toJson() => {
//         "url": url,
//         "label": label,
//         "active": active,
//     };
// }
