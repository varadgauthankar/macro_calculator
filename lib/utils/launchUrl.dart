import 'package:url_launcher/url_launcher.dart';

String twitterUrl = 'https://twitter.com/varad1601';
String instaUrl = 'https://www.instagram.com/varadgauthankar';
String telegramUrl = 'https://t.me/varad1601';
String storeUrl =
    'https://play.google.com/store/apps/details?id=com.varadgauthankar.macro_calculator';
String mailUrl =
    'mailto:gvarad1601@gmail.com?subject=Macro%20Calculator&body=Hello';
String privacyPolicy =
    'https://raw.githubusercontent.com/varad1601/MacroCalculator/master/privacy_policy.txt';

launchUrl(String url) async {
  if (await canLaunch(url)) {
    await launch(
      url,
    );
  } else {
    throw 'Could not launch $url';
  }
}
