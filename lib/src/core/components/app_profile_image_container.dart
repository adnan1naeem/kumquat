import 'package:flutter/material.dart';

class AppProfileImageContainer extends StatelessWidget {
  const AppProfileImageContainer({super.key, required this.image});
 final ImageProvider image ;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        image:  DecorationImage(
            image: image,
            fit: BoxFit.fill
        ),
      ),
      // child: image != null ? Image.file(image!) : Image.asset(AssetHelper.placeholder)
    );
  }
}
