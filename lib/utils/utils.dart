import 'package:flutter/material.dart';
import 'package:network_to_file_image/network_to_file_image.dart';

class Utils {
  static Future cacheImage(BuildContext context, String urlImage) async {
    await precacheImage(
      NetworkToFileImage(
        url: urlImage,
       // cacheRule: CacheRule(maxAge: const Duration(days: 7)),
      ),
      context,
    );
  }
}
