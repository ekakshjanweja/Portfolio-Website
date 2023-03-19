import 'package:url_launcher/url_launcher_string.dart';

class LaunchUrl {
  void launchUrl(String url) async {
    if (await launchUrlString(url)) {
    } else {
      throw 'Could not launch $url';
    }
  }
}
