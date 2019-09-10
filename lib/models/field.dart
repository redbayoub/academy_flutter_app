class Field {
  int _id;
  String _title;
  String _cover_image;

  Field(this._id, this._title, this._cover_image);

  get id {
    return _id;
  }

  get title {
    return _title;
  }

  get cover_image {
    return _cover_image;
  }
}

Field fieldFromJson(Map<String, dynamic> jsonField) {
  return Field(
    jsonField["id"],
    jsonField["title"],
    jsonField["cover_image"],
  );
}
