// dart format off
// ignore_for_file: type=lint

// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/server.dart';
import 'package:jaspr_portfolio/components/about_section.dart'
    as _about_section;
import 'package:jaspr_portfolio/components/contact_section.dart'
    as _contact_section;
import 'package:jaspr_portfolio/components/experience_section.dart'
    as _experience_section;
import 'package:jaspr_portfolio/components/hero_section.dart' as _hero_section;
import 'package:jaspr_portfolio/components/nav_bar.dart' as _nav_bar;
import 'package:jaspr_portfolio/components/projects_section.dart'
    as _projects_section;
import 'package:jaspr_portfolio/pages/home.dart' as _home;
import 'package:jaspr_portfolio/app.dart' as _app;

/// Default [ServerOptions] for use with your Jaspr project.
///
/// Use this to initialize Jaspr **before** calling [runApp].
///
/// Example:
/// ```dart
/// import 'main.server.options.dart';
///
/// void main() {
///   Jaspr.initializeApp(
///     options: defaultServerOptions,
///   );
///
///   runApp(...);
/// }
/// ```
ServerOptions get defaultServerOptions => ServerOptions(
  clientId: 'main.client.dart.js',
  clients: {_app.App: ClientTarget<_app.App>('app')},
  styles: () => [
    ..._about_section.AboutSection.styles,
    ..._contact_section.ContactSection.styles,
    ..._experience_section.ExperienceSection.styles,
    ..._hero_section.HeroSection.styles,
    ..._nav_bar.NavBar.styles,
    ..._projects_section.ProjectsSection.styles,
    ..._home.Home.styles,
    ..._app.AppState.styles,
  ],
);
