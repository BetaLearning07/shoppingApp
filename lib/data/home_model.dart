class HomeModel {
  int? statusCode;
  bool? offer;
  List<Categories>? categories;
  List<Banners>? banners;
  List<Brands>? brands;
  List<Products>? products;

  HomeModel(
      {this.statusCode,
      this.offer,
      this.categories,
      this.banners,
      this.brands,
      this.products});

  HomeModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    offer = json['offer'];
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
    if (json['banners'] != null) {
      banners = <Banners>[];
      json['banners'].forEach((v) {
        banners!.add(Banners.fromJson(v));
      });
    }
    if (json['brands'] != null) {
      brands = <Brands>[];
      json['brands'].forEach((v) {
        brands!.add(Brands.fromJson(v));
      });
    }
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status_code'] = statusCode;
    data['offer'] = offer;
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    if (banners != null) {
      data['banners'] = banners!.map((v) => v.toJson()).toList();
    }
    if (brands != null) {
      data['brands'] = brands!.map((v) => v.toJson()).toList();
    }
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
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

class Banners {
  int? id;
  String? banner;

  Banners({this.id, this.banner});

  Banners.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    banner = json['banner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['banner'] = banner;
    return data;
  }
}

class Brands {
  String? image;
  String? goTo;
  int? id;

  Brands({this.image, this.goTo, this.id});

  Brands.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    goTo = json['go_to'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['go_to'] = goTo;
    data['id'] = id;
    return data;
  }
}

class Products {
  int? id;
  String? title;
  String? brand;
  String? categoryName;
  String? image;
  String? shortDescription;
  int? category;
  Pricing? pricing;
  bool? favourite;
  String? createdAt;
  int? status;

  Products(
      {this.id,
      this.title,
      this.brand,
      this.categoryName,
      this.image,
      this.shortDescription,
      this.category,
      this.pricing,
      this.favourite,
      this.createdAt,
      this.status});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    brand = json['brand'];
    categoryName = json['category_name'];
    image = json['image'];
    shortDescription = json['short_description'];
    category = json['category'];
    pricing =
        json['pricing'] != null ? Pricing.fromJson(json['pricing']) : null;
    favourite = json['favourite'];
    createdAt = json['created_at'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image'] = image;
    data['brand'] = brand;
    data['category_name'] = categoryName;
    data['short_description'] = shortDescription;
    data['category'] = category;
    if (pricing != null) {
      data['pricing'] = pricing!.toJson();
    }
    data['favourite'] = favourite;
    data['created_at'] = createdAt;
    data['status'] = status;
    return data;
  }
}

class Pricing {
  int? id;
  String? price;
  int? moq;
  String? unit;

  Pricing({this.id, this.price, this.moq, this.unit});

  Pricing.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    moq = json['moq'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['price'] = price;
    data['moq'] = moq;
    data['unit'] = unit;
    return data;
  }
}
