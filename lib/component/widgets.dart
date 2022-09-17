import 'package:flutter/widgets.dart';

import '../constants/whatsapp_color.dart';
import '../gen/assets.gen.dart';
import 'text_style.dart';

Widget userItem({
  required int index,
  required String name,
  required String imagePath,
  required String lastMaeeage,
  required String time,
}) {
  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: Image.asset(Assets.images.av.path).image
                        // ignore: unnecessary_null_comparison
                        // imagePath==null? Image.asset(Assets.images.av.path).image
                        // :Image.network(imagePath).image)),
                        ))),
            const SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: usernameTextStyle,
                ),
                Text(
                  lastMaeeage,
                  style: messageTextStyle,
                ),
              ],
            ),
          ],
        ),
        Column(
          children: [
            Text(
              time,
              style: timeTextStyle,
            ),
            Container(
              height: 18,
              width: 18,
              decoration: BoxDecoration(shape: BoxShape.circle, color: badg),
              child: const Center(child: Text("1")),
            ),
          ],
        )
      ],
    ),
  );
}
