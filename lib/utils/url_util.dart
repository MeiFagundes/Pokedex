import 'package:url_launcher/url_launcher.dart';

class UrlUtil {
  static final String urlHome = 'https://www.meifagundes.com';

  static Future<void> openURI(String uri, {bool encode = true}) async {
    var encodedUrl = encode ? Uri.encodeFull(uri) : uri;

    if (await canLaunch(encodedUrl)) {
      await launch(encodedUrl);
    } else {
      throw 'Não foi possível abrir a URI: $encodedUrl';
    }
  }
}
