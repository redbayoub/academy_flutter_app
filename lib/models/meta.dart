class Meta {
  int _current_page;
  int _from;
  int _last_page;
  String _path;
  int _per_page;
  int _to;
  int _total;

  Meta(this._current_page, this._from, this._last_page, this._path,
      this._per_page, this._to, this._total);

  int get total => _total;

  int get to => _to;

  int get per_page => _per_page;

  String get path => _path;

  int get last_page => _last_page;

  int get from => _from;

  int get current_page => _current_page;
}

Meta metaFromJson(Map<String, dynamic> jsonMeta) {
  return Meta(
    jsonMeta["current_page"],
    jsonMeta["from"],
    jsonMeta["last_page"],
    jsonMeta["path"],
    jsonMeta["per_page"],
    jsonMeta["to"],
    jsonMeta["total"],
  );
}
