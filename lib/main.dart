import 'package:flutter/material.dart';
import 'app.dart';
import 'package:wasteagram/models/entry.dart';
import 'package:test/test.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());

  test('Post created from Map should have appropriate property values', () {
    final date = DateFormat.yMd().format(DateTime.now());
    const url = 'FAKE';
    const itemCount = 1;
    const String latitude = '1.0';
    const String longitude = '2.0';

    final entry = Entry.fromMap(
        date: date,
        url: url,
        itemCount: itemCount,
        latitude: latitude,
        longitude: longitude);

    expect(entry.date, date);
    expect(entry.url, url);
    expect(itemCount, itemCount);
    expect(latitude, latitude);
    expect(longitude, longitude);
  });
}
