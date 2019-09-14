class Course {
  int _id;
  String _title;
  String _description;
  int _field_id;
  int _teacher_id;
  bool _is_approved;
  String _cover_image;
  DateTime _created_at;

  Course(
    this._id,
    this._field_id,
    this._teacher_id,
    this._title,
    this._description,
    this._is_approved,
    this._cover_image,
    this._created_at,
  );

  int get id {
    return _id;
  }

  int get field_id {
    return _field_id;
  }

  int get teacher_id {
    return _field_id;
  }

  String get title {
    return _title;
  }

  String get description {
    return _description;
  }

  bool get is_approved {
    return _is_approved;
  }

  String get cover_image {
    return _cover_image;
  }

  DateTime get created_at {
    return _created_at;
  }
}

Course courseFromJson(Map<String, dynamic> jsonCourse) {
  return Course(
    jsonCourse["id"],
    jsonCourse["field_id"],
    jsonCourse["teacher_id"],
    jsonCourse["title"],
    jsonCourse["description"],
    jsonCourse["is_approved"] == 1,
    jsonCourse["cover_image"],
    DateTime.parse(jsonCourse["created_at"]),
  );
}
