class GetNewsModel {
  List<NewsData>? data;

  GetNewsModel({this.data});

  GetNewsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <NewsData>[];
      json['data'].forEach((v) {
        data!.add(NewsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NewsData {
  String? uuid;
  String? title;
  String? description;
  String? imageUrl;

  NewsData({this.uuid, this.title, this.description, this.imageUrl});

  NewsData.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    title = json['title'];
    description = json['description'];

    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uuid'] = uuid;
    data['title'] = title;
    data['description'] = description;

    data['image_url'] = imageUrl;

    return data;
  }
}
