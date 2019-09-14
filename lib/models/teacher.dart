class Teacher {
  int _id;
  String _first_name;
  String _last_name;
  String _about_me;
  String _profile_image;
  bool _is_approved;

  Teacher(this._id, this._first_name, this._last_name, this._about_me,
      this._profile_image, this._is_approved);

  bool get is_approved => _is_approved;

  String get profile_image => _profile_image;

  String get about_me => _about_me;

  String get last_name => _last_name;

  String get first_name => _first_name;

  int get id => _id;
}

Teacher teacherFromJson(Map<String, dynamic> jsonTeacher) {
  return Teacher(
    jsonTeacher["id"],
    jsonTeacher["first_name"],
    jsonTeacher["last_name"],
    jsonTeacher["about_me"],
    jsonTeacher["profile_image"],
    jsonTeacher["is_approved"] == 1,
  );
}
