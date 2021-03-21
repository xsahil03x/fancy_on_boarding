// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html show window;

String get systemLanguageCode => html.window.navigator.language;
