class Article {
  String status;
  String message;
  int statusCode;
  List<Data> data;
  Links links;
  Meta meta;

  Article({
    required this.status,
    required this.message,
    required this.statusCode,
    required this.data,
    required this.links,
    required this.meta,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
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
  String uuid;
  String articleTitle;
  String articleContent;
  String articleSlug;
  String articleExcerpt;
  Document document;
  User user;
  String createdAt;
  String updatedAt;

  Data({
    required this.uuid,
    required this.articleTitle,
    required this.articleContent,
    required this.articleSlug,
    required this.articleExcerpt,
    required this.document,
    required this.user,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
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
  String documentPath;
  String documentName;
  String createdAt;
  String updatedAt;

  Document({
    required this.documentPath,
    required this.documentName,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Document.fromJson(Map<String, dynamic> json) {
    return Document(
      documentPath: json['document_path'],
      documentName: json['document_name'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

class User {
  String uuid;
  String name;
  String email;
  int roleId;
  String createdAt;
  String updatedAt;

  User({
    required this.uuid,
    required this.name,
    required this.email,
    required this.roleId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
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
  String first;
  String last;
  dynamic prev;
  dynamic next;

  Links({
    required this.first,
    required this.last,
    required this.prev,
    required this.next,
  });

  factory Links.fromJson(Map<String, dynamic> json) {
    return Links(
      first: json['first'],
      last: json['last'],
      prev: json['prev'],
      next: json['next'],
    );
  }
}

class Meta {
  int currentPage;
  int from;
  int lastPage;
  List<Link> links;
  String path;
  int perPage;
  int to;
  int total;

  Meta({
    required this.currentPage,
    required this.from,
    required this.lastPage,
    required this.links,
    required this.path,
    required this.perPage,
    required this.to,
    required this.total,
  });

  factory Meta.fromJson(Map<String, dynamic> json) {
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
  String label;
  bool active;

  Link({
    required this.url,
    required this.label,
    required this.active,
  });

  factory Link.fromJson(Map<String, dynamic> json) {
    return Link(
      url: json['url'],
      label: json['label'],
      active: json['active'],
    );
  }
}
