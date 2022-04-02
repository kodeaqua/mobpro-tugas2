import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'util/color.dart';

const String _github = "https://github.com/kodeaqua/mobpro-tugas2";

Color backgroundColor = const Color(0xFFD7CCC8);
Color accentColor = const Color(0xFF8D6E63);
Color accentColor2 = const Color(0xFF5D4037);

TextStyle textHeaders = const TextStyle(
    fontFamily: 'Fira Sans', fontWeight: FontWeight.w500, color: Colors.black);
TextStyle textContents = const TextStyle(
    fontFamily: 'Fira Sans', fontWeight: FontWeight.w400, color: Colors.black);

void main() {
  runApp(const MyApp());
}

void _launchURL() async {
  await launch(_github);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: backgroundColor));
    return MaterialApp(
      title: 'Tugas 2 Mobile Programming',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: buildMaterialColor(accentColor2),
      ),
      home: const MyHomePage(title: 'Tugas 2 Mobile Programming'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
        value: SystemUiOverlayStyle.light,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: backgroundColor,
              foregroundColor: Colors.black,
              leading: Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Fluttertoast.showToast(
                          msg: "Eits.. mau kemana?",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          textColor: Colors.white,
                          backgroundColor: accentColor2);
                    },
                    tooltip:
                        MaterialLocalizations.of(context).backButtonTooltip,
                  );
                },
              ),
              title: const Text(
                'Profil saya',
                style: TextStyle(
                    fontFamily: "Montserrat", fontWeight: FontWeight.w600),
              ),
              centerTitle: true,
              elevation: 0,
              actions: [
                IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                              backgroundColor: backgroundColor,
                              title: const Text(
                                'Tentang aplikasi',
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w600),
                              ),
                              content: Text(
                                'Ini adalah improved version dari https://github.com/kodeaqua/prak-mobpro-tugas1',
                                style: textContents,
                              ),
                              actions: [
                                TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'Tutup'),
                                    child: Text(
                                      'Tutup',
                                      style: textHeaders,
                                    ))
                              ],
                            ));
                  },
                  icon: const Icon(Icons.info_outline_rounded),
                  tooltip: MaterialLocalizations.of(context).alertDialogLabel,
                )
              ],
            ),
            backgroundColor: backgroundColor,
            body: SingleChildScrollView(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Padding(padding: EdgeInsets.only(top: 32)),
                        Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(64),
                          ),
                          child: const CircleAvatar(
                            backgroundImage: AssetImage('images/me.png'),
                            maxRadius: 60,
                          ),
                        ),
                        const Padding(
                            padding: EdgeInsets.only(top: 6, bottom: 6)),
                        const Text(
                          "Adam Najmi Zidan",
                          style: TextStyle(
                              fontSize: 32,
                              fontFamily: "Satisfy",
                              fontWeight: FontWeight.w600),
                        ),
                        const Padding(
                            padding: EdgeInsets.only(top: 3, bottom: 3)),
                        Text(
                          "adam.065119079@unpak.ac.id",
                          style: textContents,
                        ),
                        const Padding(
                            padding: EdgeInsets.symmetric(vertical: 8)),
                        const CardButton(
                            title: "Nomor Pokok Mahasiswa",
                            subtitle: "065119079",
                            icon: Icons.card_membership_outlined),
                        const Padding(
                            padding: EdgeInsets.symmetric(vertical: 3)),
                        const CardButton(
                          title: "Program Studi",
                          subtitle: "Ilmu Komputer",
                          icon: Icons.work_outlined,
                        ),
                        const Padding(
                            padding: EdgeInsets.symmetric(vertical: 3)),
                        const CardButton(
                          title: "Status Mahasiswa",
                          subtitle: "Aktif",
                          icon: Icons.star,
                        ),
                        const Padding(
                            padding: EdgeInsets.symmetric(vertical: 3)),
                        const CardButton(
                          title: "Github",
                          subtitle: "Kodeaqua",
                          icon: Icons.storage_outlined,
                          onPressed: _launchURL,
                        ),
                        const Padding(
                            padding: EdgeInsets.symmetric(vertical: 8)),
                      ],
                    ),
                  ],
                ),
              ),
            )));
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
