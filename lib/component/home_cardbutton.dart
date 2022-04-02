import 'package:flutter/material.dart';
import 'package:prak_mobpro_tugas1/util/styles.dart';

class MyAlertDialog extends StatelessWidget {
  const MyAlertDialog({Key? key, required this.title, required this.content})
      : super(key: key);

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('AlertDialog Title'),
      content: SingleChildScrollView(
        child: ListBody(
          children: const <Widget>[
            Text('This is a demo alert dialog.'),
            Text('Would you like to approve of this message?'),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Approve'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

class CardButton extends StatelessWidget {
  const CardButton(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.icon,
      this.onPressed})
      : super(key: key);

  final String title;
  final String subtitle;
  final IconData icon;
  final dynamic onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(primary: accentColor),
        onPressed: onPressed ?? () {},
        child: SizedBox(
          height: 96,
          width: ((MediaQuery.of(context).size.width) / 100 * 80),
          child: Row(children: [
            SizedBox(
              width: ((MediaQuery.of(context).size.width) / 100 * 8),
              child: Icon(
                icon,
                color: Colors.black,
              ),
            ),
            const Padding(padding: EdgeInsets.only(left: 16)),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: textHeaders,
                ),
                const Padding(padding: EdgeInsets.symmetric(vertical: 4)),
                Text(
                  subtitle,
                  style: textContents,
                )
              ],
            ),
          ]),
        ));
  }
}
