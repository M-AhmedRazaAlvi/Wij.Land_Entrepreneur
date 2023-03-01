import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:url_launcher/url_launcher.dart';
import './controller.dart';

void usePathUrlStrategy() {
  setUrlStrategy(PathUrlStrategy());
}

void launchUrl(String url) async {
  if (await canLaunchUrl(Uri.parse(url))) {
    launch(
      url,
      forceSafariVC: true,
      forceWebView: true,
      webOnlyWindowName: '_self',
    );
  } else {
    throw 'Could not launch $url';
  }
}

void launchUrlNewTab(String url) async {
  if (await canLaunchUrl(Uri.parse(url))) {
    launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
