/// The entrypoint for the **server** environment.
///
/// The [main] method will only be executed on the server during pre-rendering.
/// To run code on the client, check the `main.client.dart` file.
library;

import 'package:jaspr/dom.dart';
// Server-specific Jaspr import.
import 'package:jaspr/server.dart';

// Imports the [App] component.
import 'app.dart';
// This file is generated automatically by Jaspr, do not remove or edit.
import 'main.server.options.dart';

void main() {
  // Initializes the server environment with the generated default options.
  Jaspr.initializeApp(
    options: defaultServerOptions,
  );

  // Starts the app.
  //
  // [Document] renders the root document structure (<html>, <head> and <body>)
  // with the provided parameters and components.
  runApp(Document(
    title: 'Ahmed Hussiney | Flutter Developer',
    styles: [
      css.import('https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;700&display=swap'),
      css.import('https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css'),
      css.import('https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css'),
      css('html, body').styles(
        width: Unit.percent(100),
        minHeight: 100.vh,
        padding: Padding.zero,
        margin: Margin.zero,
        fontFamily: const FontFamily.list([FontFamily('Outfit'), FontFamily('sans-serif')]),
        backgroundColor: Color('#0F041C'),
        color: Colors.white,
      ),
      css('h1, h2, h3, h4, h5, h6').styles(
        margin: Margin.unset,
      ),
      css('*').styles(
        boxSizing: BoxSizing.borderBox,
      ),
    ],
    body: App(),
    base: '/portfolio/',
  ));
}
