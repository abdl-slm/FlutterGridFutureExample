import 'dart:convert';

class PhotoData {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  PhotoData({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  factory PhotoData.fromJson(Map<String, dynamic> parsedJson) {
    return new PhotoData(
        albumId: parsedJson['albumId'],
        id: parsedJson['id'],
        title: parsedJson['title'],
        url: parsedJson['url'],
        thumbnailUrl: parsedJson['thumbnailUrl']);
  }

  static List<PhotoData> parsePhotos(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<PhotoData>((json) => PhotoData.fromJson(json)).toList();
  }
}
