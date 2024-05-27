import 'dart:io';

import 'package:flutter/material.dart';
import 'package:studentapp/Functions/image_picker.dart';

class ImageCircle extends StatelessWidget {
  final Function onImagePicked;

  const ImageCircle({super.key, required this.onImagePicked});

  @override
  Widget build(BuildContext context) {
    ImagePickerService imagepickerservice = ImagePickerService();

    return Stack(
      children: [
        const CircleAvatar(
          radius: 60,
          backgroundColor: Colors.red,
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(
                color: Colors.transparent,
                width: 2,
              ),
            ),
            child: IconButton(
              onPressed: () {
                onImagePicked();
              },
              icon: const Icon(Icons.add),
              iconSize: 20,
              color: Colors.red,
              padding: EdgeInsets.zero,
            ),
          ),
        ),
      ],
    );
  }
}
