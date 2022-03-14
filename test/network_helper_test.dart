import 'package:flutter_test/flutter_test.dart';
import 'package:solaris_mobile_app/models/network_helper.dart';

void main() {
  test("creates a valid network helper", () {
    NetworkHelper test = NetworkHelper(
      Uri(
          scheme: 'https',
          host: 'jsonplaceholder.typicode.com',
          path: 'todos/1'),
    );
    expect(test.url, isA<Uri>());
    expect(test.getData(), isA<Future>());
  });
}
