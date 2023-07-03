class Article {
  String? status;
  String? message;
  int? statusCode;
  List<Data>? data;
  Links? links;
  Meta? meta;

  Article({
    this.status,
    this.message,
    this.statusCode,
    this.data,
    this.links,
    this.meta,
  });

  factory Article.fromJson(Map<String?, dynamic> json) {
    return Article(
      status: json['status'],
      message: json['message'],
      statusCode: json['status_code'],
      data: List<Data>.from(json['data'].map((x) => Data.fromJson(x))),
      links: Links.fromJson(json['links']),
      meta: Meta.fromJson(json['meta']),
    );
  }
}

class Data {
  String? uuid;
  String? articleTitle;
  String? articleContent;
  String? articleSlug;
  String? articleExcerpt;
  Document? document;
  User? user;
  String? createdAt;
  String? updatedAt;

  Data({
    this.uuid,
    this.articleTitle,
    this.articleContent,
    this.articleSlug,
    this.articleExcerpt,
    this.document,
    this.user,
    this.createdAt,
    this.updatedAt,
  });

  factory Data.fromJson(Map<String?, dynamic> json) {
    return Data(
      uuid: json['uuid'],
      articleTitle: json['article_title'],
      articleContent: json['article_content'],
      articleSlug: json['article_slug'],
      articleExcerpt: json['article_excerpt'],
      document: Document.fromJson(json['document']),
      user: User.fromJson(json['user']),
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

class Document {
  String? documentPath;
  String? documentName;
  String? createdAt;
  String? updatedAt;

  Document({
    this.documentPath,
    this.documentName,
    this.createdAt,
    this.updatedAt,
  });

  factory Document.fromJson(Map<String?, dynamic> json) {
    return Document(
      documentPath: json['document_path'],
      documentName: json['document_name'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

class User {
  String? uuid;
  String? name;
  String? email;
  int? roleId;
  String? createdAt;
  String? updatedAt;

  User({
    this.uuid,
    this.name,
    this.email,
    this.roleId,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String?, dynamic> json) {
    return User(
      uuid: json['uuid'],
      name: json['name'],
      email: json['email'],
      roleId: json['role_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

class Links {
  String? first;
  String? last;
  dynamic prev;
  dynamic next;

  Links({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  factory Links.fromJson(Map<String?, dynamic> json) {
    return Links(
      first: json['first'],
      last: json['last'],
      prev: json['prev'],
      next: json['next'],
    );
  }
}

class Meta {
  int? currentPage;
  int? from;
  int? lastPage;
  List<Link>? links;
  String? path;
  int? perPage;
  int? to;
  int? total;

  Meta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.links,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  factory Meta.fromJson(Map<String?, dynamic> json) {
    return Meta(
      currentPage: json['current_page'],
      from: json['from'],
      lastPage: json['last_page'],
      links: List<Link>.from(json['links'].map((x) => Link.fromJson(x))),
      path: json['path'],
      perPage: json['per_page'],
      to: json['to'],
      total: json['total'],
    );
  }
}

class Link {
  dynamic url;
  String? label;
  bool? active;

  Link({
    this.url,
    this.label,
    this.active,
  });

  factory Link.fromJson(Map<String?, dynamic> json) {
    return Link(
      url: json['url'],
      label: json['label'],
      active: json['active'],
    );
  }
}
