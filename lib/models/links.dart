
class Links{
  String _first;
  String _last;
  String _perv;
  String _next;

  Links(this._first, this._last, this._perv, this._next);

  String get next => _next;

  String get perv => _perv;

  String get last => _last;

  String get first => _first;


}

Links linksFromJson(Map<String,dynamic> jsonLinks){
  return Links(
    jsonLinks["first"],
    jsonLinks["last"],
    jsonLinks["prev"],
    jsonLinks["next"],
  );
}