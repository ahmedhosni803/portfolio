import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../app_data.dart';

class HeroSection extends StatelessComponent {
  const HeroSection({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'home', classes: 'hero', [
      div(classes: 'content', [
        h1([
          text(AppData.aboutTitleStart),
          span(classes: 'highlight', [text(AppData.aboutTitleHighlight)]),
        ]),
        p(classes: 'subtitle', [
          text(AppData.aboutSubtitle),
        ]),
        div(classes: 'actions', [
          if (AppData.cvUrl.isNotEmpty)
            a(href: AppData.cvUrl, target: Target.blank, classes: 'button primary', [text('Download CV')]),
          a(href: '#contact', classes: 'button secondary', [text('Contact Me')]),
        ]),
      ]),
    ]);
  }

  @css
  static final styles = [
    css('.hero', [
      css('&').styles(
        minHeight: 100.vh,
        display: Display.flex,
        alignItems: AlignItems.center,
        justifyContent: JustifyContent.center,
        textAlign: TextAlign.center,
        padding: Padding.only(left: Unit.percent(10), right: Unit.percent(10), top: Unit.pixels(80)),
      ),
      css('.content').styles(
        maxWidth: Unit.pixels(800),
        display: Display.flex,
        flexDirection: FlexDirection.column,
        alignItems: AlignItems.center,
        raw: {'gap': '20px'},
      ),
      css('h1').styles(
        fontSize: 4.rem,
        fontWeight: FontWeight.bold,
        lineHeight: Unit.em(1.2),
        whiteSpace: WhiteSpace.preLine,
      ),
      css('.highlight').styles(
        color: Color('#A855F7'),
        raw: {
          'background': 'linear-gradient(to right, #A855F7, #EC4899)',
          '-webkit-background-clip': 'text',
          'background-clip': 'text',
          '-webkit-text-fill-color': 'transparent',
          'color': 'transparent',
        },
      ),
      css('.subtitle').styles(
        fontSize: 1.5.rem,
        color: Color.rgba(255, 255, 255, 0.8),
        maxWidth: Unit.pixels(600),
      ),
      css('.actions').styles(
        display: Display.flex,
        raw: {'gap': '20px'},
        margin: Margin.only(top: Unit.pixels(30)),
      ),
      css('.button').styles(
        padding: Padding.symmetric(vertical: Unit.pixels(12), horizontal: Unit.pixels(30)),
        radius: BorderRadius.circular(Unit.pixels(30)),
        textDecoration: TextDecoration.none,
        fontSize: 1.1.rem,
        fontWeight: FontWeight.bold,
        cursor: Cursor.pointer,
        transition: const Transition('transform', duration: Duration(milliseconds: 300)),
      ),
      css('.button:hover').styles(
        transform: Transform.scale(1.05),
      ),
      css('.primary').styles(
        backgroundColor: Color('#A855F7'),
        color: Colors.white,
        raw: {'box-shadow': '0 0 20px rgba(168, 85, 247, 0.4)'},
      ),
      css('.secondary').styles(
        border: Border.all(color: Color.rgba(255, 255, 255, 0.5)),
        color: Colors.white,
      ),
    ]),
  ];
}
