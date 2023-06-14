import 'package:xml/xml.dart';

Map<String, dynamic> parseXml(String xml) {
  final document = XmlDocument.parse(xml);
  final root = document.rootElement;

  final result = <String, dynamic>{};

  for (final child in root.children) {
    if (child is XmlElement) {
      final key = child.name.local;
      final value = _parseXmlNode(child);
      result[key] = value;
    }
  }
  return result;
}

dynamic _parseXmlNode(XmlNode node) {
  if (node.nodeType == XmlNodeType.TEXT) {
    return node.innerText;
  } else if (node.nodeType == XmlNodeType.ELEMENT) {
    final element = node as XmlElement;
    final result = <String, dynamic>{};

    // Iterate over the attributes of the element
    for (final attribute in element.attributes) {
      final key = attribute.name.local;
      final value = attribute.value;
      result[key] = value;
    }

    // Iterate over the child elements of the element
    for (final child in element.children) {
      if (child is XmlElement) {
        final key = child.name.local;
        final value = _parseXmlNode(child);

        // If the key already exists, convert the value to a list
        if (result.containsKey(key)) {
          final existingValue = result[key];
          if (existingValue is List) {
            existingValue.add(value);
          } else {
            result[key] = [existingValue, value];
          }
        } else {
          result[key] = value;
        }
      }
    }

    return result;
  } else {
    return null;
  }
}
