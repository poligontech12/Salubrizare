import 'dart:math';

import 'package:flutter/services.dart';
import 'package:xml/xml.dart';

import '../models/coordinates/index.dart';

class CoordinatesApi {
  const CoordinatesApi({required String coordinatesPath}) : _coordinatesPath = coordinatesPath;

  final String _coordinatesPath;

  Future<List<GeoPointModel>> getCoordinates() async {
    final String data = await rootBundle.loadString(_coordinatesPath);
    // var xmlGpx = GpxReader().fromString()

    final XmlDocument raw = XmlDocument.parse(data);
    final Iterable<XmlElement> elements = raw.findAllElements('trkpt');
    final List<GeoPointModel> tmpList = <GeoPointModel>[];

    for (final XmlElement element in elements) {
      tmpList.add(
        GeoPointModel.fromData(
          id: Random().nextInt(1000000),
          latitude: double.parse(element.attributes[0].value),
          longitude: double.parse(element.attributes[1].value),
        ),
      );
    }

    return tmpList;
  }
}
