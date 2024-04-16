import 'package:flutter/material.dart';
import 'package:foodie_app/gen/assets.gen.dart';
import 'dart:io';

class AppAvatar extends StatelessWidget {
  const AppAvatar({
    super.key,
    this.avatar,
    this.radius = 24.0,
    this.isActive = false,
  });
  final String? avatar;
  final double radius;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //Khung tròn avatar
        //c1: container
        Container(
          width: radius * 2.0,
          height: radius * 2.0,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.red),
            shape: BoxShape.circle,
            image: DecorationImage(
              image: avatar == null
                  // ? Assets.images.defaultAvatar.provider()
                  // ? Image.asset(Assets.images.defaultAvatar.path).image
                  ? AssetImage(Assets.images.defaultAvatar.path)
                      as ImageProvider
                  : FileImage(File(avatar!)),
              fit: BoxFit.cover,
            ),
          ),
        ),
        //c2: Bọc CircleAvatar bằng 1 CircleAvatar khác

        //  CircleAvatar(
        //   backgroundColor: Colors.red,
        //   radius: radius,
        //   child: CircleAvatar(
        //     backgroundImage: avatar == null
        //         ? AssetImage(Assets.images.defaultAvatar.path)
        //         : AssetImage(avatar!),
        //     radius: radius - 1.0,
        //   ),
        // ),
        Positioned(
          right: 0.0,
          bottom: 0.0,
          child: avatar == null
              ? Container(
                  padding: const EdgeInsets.all(2.6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.pink),
                  ),
                  child: const Icon(
                    Icons.camera_alt_outlined,
                    size: 18.0,
                    color: Colors.pink,
                  ),
                )
              : CircleAvatar(
                  backgroundColor:
                      isActive == true ? Colors.green : Colors.orange,
                  radius: radius / 4.0,
                ),
        )
      ],
    );
  }
}
