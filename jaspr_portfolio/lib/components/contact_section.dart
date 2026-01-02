import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../app_data.dart';

class ContactSection extends StatelessComponent {
  const ContactSection({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'contact', classes: 'contact animate__animated animate__fadeIn', [
      div(classes: 'content', [
        h2([text("Contact")]),
        p([text(AppData.contactText)]),
        div(classes: 'contact-items', [
          if (AppData.contactEmail.isNotEmpty)
            a(href: 'mailto:${AppData.contactEmail}', classes: 'contact-item', [
              i(classes: 'fa-solid fa-envelope', []),
              text(AppData.contactEmail),
            ]),
          if (AppData.contactPhone.isNotEmpty)
            a(href: 'tel:${AppData.contactPhone}', classes: 'contact-item', [
              i(classes: 'fa-solid fa-phone', []),
              text(AppData.contactPhone),
            ]),
          if (AppData.contactLocation.isNotEmpty)
            div(classes: 'contact-item location', [
              i(classes: 'fa-solid fa-location-dot', []),
              text(AppData.contactLocation),
            ]),
        ]),
      ]),
      footer([
        p([text('© ${DateTime.now().year} ${AppData.name}. All rights reserved.')]),
      ]),
    ]);
  }

  @css
  static final styles = [
    css('.contact', [
      css('&').styles(
        padding: Padding.only(top: Unit.pixels(80), bottom: Unit.pixels(40)),
        textAlign: TextAlign.center,
        color: Colors.white,
      ),
      css('.content').styles(
        maxWidth: Unit.pixels(800),
        margin: Margin.symmetric(horizontal: Unit.auto),
        padding: Padding.symmetric(horizontal: Unit.percent(10)),
      ),
      css('h2').styles(
        fontSize: 2.5.rem,
        margin: Margin.only(bottom: Unit.pixels(30)),
      ),
      css('p').styles(
        fontSize: 1.2.rem,
        color: Color.rgba(255, 255, 255, 0.8),
        lineHeight: Unit.em(1.6),
        margin: Margin.only(bottom: Unit.pixels(40)),
      ),
      css('.contact-items').styles(
        display: Display.flex,
        flexDirection: FlexDirection.column,
        alignItems: AlignItems.center,
        raw: {'gap': '20px'},
        margin: Margin.only(bottom: Unit.pixels(60)),
      ),
      css('.contact-item').styles(
        fontSize: 1.1.rem,
        color: Color('#A855F7'),
        textDecoration: TextDecoration.none,
        padding: Padding.symmetric(vertical: Unit.pixels(12), horizontal: Unit.pixels(24)),
        border: Border.all(color: Color.rgba(168, 85, 247, 0.5)),
        radius: BorderRadius.circular(Unit.pixels(30)),
        transition: const Transition('all', duration: Duration(milliseconds: 300)),
        display: Display.flex,
        alignItems: AlignItems.center,
        raw: {'gap': '10px'},
      ),
      css('.contact-item:hover').styles(
        backgroundColor: Color.rgba(168, 85, 247, 0.1),
        raw: {'box-shadow': '0 0 15px rgba(168, 85, 247, 0.3)'},
      ),
      css('.location').styles(
        color: Color.rgba(255, 255, 255, 0.9),
      ),
    ]),
    css('footer', [
      css('&').styles(
        border: Border.only(top: BorderSide(color: Color.rgba(255, 255, 255, 0.1))),
        padding: Padding.only(top: Unit.pixels(40)),
      ),
      css('p').styles(
        fontSize: 0.9.rem,
        color: Color.rgba(255, 255, 255, 0.5),
        margin: Margin.zero,
      ),
    ]),
  ];
}
