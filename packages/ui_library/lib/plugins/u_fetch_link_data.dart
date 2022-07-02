import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart';

class UFetchLinkData {
  String? _description;
  String? _title;
  String? _image;
  String? _appleIcon;
  String? _favIcon;
  String? _siteName;
  String? _type;

  Future<Map<String, String>> fetch(String url) async {
    const _noInformationAvailable = 'No information available';

    try {
      final client = Client();

      final response = await client.get(_validateUrl(url));

      final document = parse(response.body);

      final _metaData = document.getElementsByTagName('meta');
      final _linkData = document.getElementsByTagName('link');

      for (final element in _metaData) {
        _getTitleData(element, document);
        _getDescriptionData(element);
        _getTypeData(element);
        _getSiteNameData(element, document);
        _getImageData(element);
      }

      for (final element in _linkData) {
        _getIconData(element);
      }

      return {
        'title': _title ?? _noInformationAvailable,
        'description': _description ?? _noInformationAvailable,
        'image': _image ?? _noInformationAvailable,
        'type': _type ?? _noInformationAvailable,
        'siteName': _siteName ?? _noInformationAvailable,
        'appleIcon': _appleIcon ?? _noInformationAvailable,
        'favIcon': _favIcon ?? _noInformationAvailable
      };
    } catch (error) {
      return {
        'title': _noInformationAvailable,
        'description': _noInformationAvailable,
        'image': _noInformationAvailable,
        'type': _noInformationAvailable,
        'siteName': _noInformationAvailable,
        'appleIcon': _noInformationAvailable,
        'favIcon': _noInformationAvailable
      };
    }
  }

  _getTitleData(Element element, Document document) {
    if (element.attributes['property'] == 'og:title') {
      _title = element.attributes['content'];
    }
    if (_title == null || _title!.isEmpty) {
      _title = document.getElementsByTagName('title')[0].text;
    }
  }

  _getDescriptionData(Element element) {
    if (element.attributes['property'] == 'og:description') {
      _description = element.attributes['content'];
    }
    if ((_description == null || _description!.isEmpty) &&
        element.attributes['name'] == 'description') {
      _description = element.attributes['content'];
    }
  }

  _getTypeData(Element element) {
    if (element.attributes['property'] == 'og:type') {
      _type = element.attributes['content'];
    }
  }

  _getSiteNameData(Element element, Document document) {
    if (element.attributes['property'] == 'og:site_name') {
      _siteName = element.attributes['content'];
    }
  }

  _getImageData(Element element) {
    if (element.attributes['property'] == 'og:image') {
      _image = element.attributes['content'];
    }
  }

  _getIconData(Element element) {
    if (element.attributes['rel'] == 'apple-touch-icon') {
      _appleIcon = element.attributes['href'];
    }
    if (element.attributes['rel']?.contains('icon') == true) {
      _favIcon = element.attributes['href'];
    }
  }

  _validateUrl(String url) {
    if (url.startsWith('http://') == true ||
        url.startsWith('https://') == true) {
      return Uri.parse(url);
    } else {
      return Uri.parse('http://$url');
    }
  }
}
