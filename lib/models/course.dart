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

  get id {
    return _id;
  }

  get field_id {
    return _field_id;
  }

  get teacher_id {
    return _field_id;
  }

  get title {
    return _title;
  }

  get description {
    return _description;
  }

  get is_approved {
    return _is_approved;
  }

  get cover_image {
    return _cover_image;
  }

  get created_at {
    return _created_at;
  }
}

Course courseFromJson(Map<String, dynamic> jsonCourse) {
  return Course(
    jsonCourse["id"],
    jsonCourse["_field_id"],
    jsonCourse["_teacher_id"],
    jsonCourse["_title"],
    jsonCourse["_description"],
    jsonCourse["_is_approved"],
    jsonCourse["_cover_image"],
    DateTime.parse(jsonCourse["_created_at"]),
  );
}
