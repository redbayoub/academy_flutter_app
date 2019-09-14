import 'package:flutter/material.dart';
import 'package:my_academy/models/course.dart';

class CourseCard extends StatelessWidget {
  CourseCard(this._course);
  final Course _course;
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 0.8,
        margin: EdgeInsets.all(10),
        child: ListTile(
            onTap: _showCourseDetailsPage(),
            isThreeLine: true,
            title: Text(
              _course.title,
              softWrap: true,
            ),
            leading: _renderCourseImage(),
            subtitle: Text(
              _course.description,
              softWrap: true,
              maxLines: 5,
            ),
            trailing: Container(
                width: 30,
                alignment: Alignment.center,
                child: Icon(Icons.keyboard_arrow_right, size: 30.0))));
  }

  Widget _renderCourseImage() {
    return Image(
      image: AssetImage("assets/images/not_found_image.png"),
      filterQuality: FilterQuality.low,
      fit: BoxFit.fill,
      width: 80,
      height: 80,
    );
  }

  _showCourseDetailsPage() {}
}
