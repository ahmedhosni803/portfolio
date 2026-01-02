import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../components/about_section.dart';
import '../components/contact_section.dart';
import '../components/experience_section.dart';
import '../components/hero_section.dart';
import '../components/nav_bar.dart';
import '../components/projects_section.dart';

class Home extends StatelessComponent {
  const Home({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'main', [
      const NavBar(),
      const HeroSection(),
      const AboutSection(),
      const ExperienceSection(),
      const ProjectsSection(),
      const ContactSection(),
    ]);
  }

  @css
  static final styles = [
    css('.main', [
      css('&').styles(
        width: Unit.percent(100),
        minHeight: 100.vh,
        raw: {'overflow-x': 'hidden'},
        position: Position.relative(),
      ),
    ]),
  ];
}
