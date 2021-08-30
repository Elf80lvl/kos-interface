//TODO если не работает на iOS: https://pub.dev/packages/url_launcher (Add any URL schemes passed to canLaunch as LSApplicationQueriesSchemes entries in your Info.plist file.)
import 'package:url_launcher/url_launcher.dart';

launchUrl(url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
