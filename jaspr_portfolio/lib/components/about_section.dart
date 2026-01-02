import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../app_data.dart';

class AboutSection extends StatelessComponent {
  const AboutSection({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'about', classes: 'about', [
      h2([text('About Me')]),
      div(classes: 'content', [
        p([text(AppData.heroDescription)]),
      ]),
    ]);
  }

  @css
  static final styles = [
    css('.about', [
      css('&').styles(
        padding: Padding.symmetric(vertical: Unit.pixels(80), horizontal: Unit.percent(10)),
        maxWidth: Unit.pixels(800),
        margin: Margin.symmetric(horizontal: Unit.auto),
        textAlign: TextAlign.center,
      ),
      css('h2').styles(
        fontSize: 2.5.rem,
        margin: Margin.only(bottom: Unit.pixels(40)),
        color: Colors.white,
      ),
      css('p').styles(
        color: Color.rgba(255, 255, 255, 0.8),
        fontSize: 1.1.rem,
        lineHeight: Unit.em(1.6),
      ),
    ]),
  ];
}
