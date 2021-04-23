import 'package:flutter/material.dart';

Widget avatarWidget({String url, double radius}) {
  return Container(
    child: CircleAvatar(
    radius: radius,
    backgroundImage: NetworkImage(url),
  ));
}
