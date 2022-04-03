import 'package:flutter/material.dart';
import 'package:prak_mobpro_tugas1/util/styles.dart';

Future<dynamic> myAlertDialog(
    BuildContext context, String title, String content) {
  return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
            backgroundColor: backgroundColor,
            title: Text(
              title,
              style: const TextStyle(
                  fontFamily: "Montserrat", fontWeight: FontWeight.w600),
            ),
            content: Text(
              content,
              style: textContents,
            ),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context, 'Tutup'),
                  child: Text(
                    'Tutup',
                    style: textHeaders,
                  ))
            ],
          ));
}
