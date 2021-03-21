import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:fancy_on_boarding/fancy_on_boarding.dart';

void main() {
  test(
    'should throw assertion error if iconImagePath or icon is not provided',
    () {
      expect(
        () => PageModel(
          title: Text('testTitle'),
          body: Text('testBody'),
          color: Colors.white,
          heroImagePath: 'heroImagePath',
        ),
        throwsAssertionError,
      );
    },
  );

  test(
    'should throw assertion error if both icon, iconImagePath are provided',
    () {
      expect(
        () => PageModel(
          title: Text('testTitle'),
          body: Text('testBody'),
          color: Colors.white,
          heroImagePath: 'heroImagePath',
          icon: Icon(Icons.add),
          iconImagePath: 'testIconImagePath',
        ),
        throwsAssertionError,
      );
    },
  );
}
