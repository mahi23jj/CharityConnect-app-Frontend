import 'package:flutter/material.dart';

class Images extends StatelessWidget {
  final double height;
  final double width;
  final String image;
  final double radius;
  const Images(
      {super.key,
      this.height = 100,
      this.width = 100,
      this.image = 'asset/images/project.jpg',
      this.radius = 20});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Image.asset(
        image,
        height: height,
        width: width,
        fit: BoxFit.cover,
      ),
    );

    // Container(
    //   height: height,
    //   width: width,
    //   child: ClipRRect(
    //     borderRadius: BorderRadiusGeometry.circular(radius),
    //     child: Image.asset(image),
    //   ),
    // );
  }
}
