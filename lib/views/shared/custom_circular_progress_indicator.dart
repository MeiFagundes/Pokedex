import 'package:flutter/material.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  final double size;
  const CustomCircularProgressIndicator({Key key, this.size = 50})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      child: CircularProgressIndicator(),
    );
  }
}
