class CaegoriesModel {
  List<Categories>? categories;

  CaegoriesModel({this.categories});

  CaegoriesModel.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  int? id;
  String? name;
  String? slug;
  String? description;
  String? image;
  int? status;
  bool? haschild;

  Categories(
      {this.id,
      this.name,
      this.slug,
      this.description,
      this.image,
      this.status,
      this.haschild});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    description = json['description'];
    image = json['image'];
    status = json['status'];
    haschild = json['haschild'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['description'] = description;
    data['image'] = image;
    data['status'] = status;
    data['haschild'] = haschild;
    return data;
  }
}
