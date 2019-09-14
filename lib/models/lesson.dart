import 'field.dart';

class Lesson {
  int _id;
  int _course_id;
  int _order;
  String _title;
  String _description;
  String _thumbnail_image;
  String _video_file;
  DateTime _created_at;

  Lesson(this._id, this._course_id, this._order, this._title, this._description,
      this._thumbnail_image, this._video_file, this._created_at);

  DateTime get created_at => _created_at;

  String get video_file => _video_file;

  String get thumbnail_image => _thumbnail_image;

  String get description => _description;

  String get title => _title;

  int get order => _order;

  int get course_id => _course_id;

  int get id => _id;
}

Lesson lessonFromJson(Map<String, dynamic> jsonLesson) {
  return Lesson(
    jsonLesson["id"],
    jsonLesson["course_id"],
    jsonLesson["order"],
    jsonLesson["title"],
    jsonLesson["description"],
    jsonLesson["thumbnail_image"],
    jsonLesson["video_file"],
    jsonLesson["created_at"],
  );
}
