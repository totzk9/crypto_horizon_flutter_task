import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:html/parser.dart' as htmlparser;
import 'package:html/dom.dart' as dom;

Widget coinDescriptionWidget(String? description) {
  final dom.Document document = htmlparser.parse(description);

  if (description != null)
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Html.fromDom(
        document: document,
      ),
    );
  else
    return const Center(child: Text('This coin has no description'));
}
