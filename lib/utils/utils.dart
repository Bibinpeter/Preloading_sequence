import 'dart:io';

import 'package:flutter/material.dart';
import 'package:network_to_file_image/network_to_file_image.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class Utils {
  static Future cacheImage(BuildContext context, String urlImages) async {
    // Get application documents directory
    Directory dir = await getApplicationDocumentsDirectory();
    String pathName = p.join(dir.path, 'cached_image.png');
    File myFile = File(pathName);

    // Precache image using NetworkToFileImage
    await precacheImage(
      NetworkToFileImage(
        url: urlImages,
        file: myFile,
      ),
      context,
    );
  }
}
