import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../app_data.dart';

class NavBar extends StatefulComponent {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();

  @css
  static final styles = [
    css('.navbar', [
      css('&').styles(
        padding: Padding.symmetric(vertical: Unit.pixels(15), horizontal: Unit.percent(10)),
        width: Unit.percent(100),
        position: Position.fixed(top: Unit.zero, left: Unit.zero, right: Unit.zero),
        backgroundColor: Color.rgba(15, 4, 28, 0.95),
        raw: {
          'backdrop-filter': 'blur(10px)',
          'z-index': '1000',
          'justify-content': 'space-between',
          'align-items': 'center',
          'display': 'flex',
        },
      ),
      css('.logo').styles(
        display: Display.flex,
        alignItems: AlignItems.center,
        fontSize: 1.5.rem,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      css('a').styles(
        textDecoration: TextDecoration.none,
        color: Color.rgba(255, 255, 255, 0.8),
        fontSize: 1.rem,
        fontWeight: FontWeight.w500,
        transition: const Transition('color', duration: Duration(milliseconds: 300)),
      ),
      css('a:hover').styles(
        color: Color('#A855F7'),
      ),

      // Desktop Menu Styles
      css('.desktop-menu').styles(
        display: Display.flex,
        raw: {'gap': '30px'},
      ),

      // Mobile Toggle Styles
      css('.mobile-toggle').styles(
        display: Display.none,
        fontSize: 1.5.rem,
        color: Colors.white,
        cursor: Cursor.pointer,
      ),

      // Mobile Menu Styles
      css('.mobile-menu').styles(
        position: Position.absolute(top: Unit.percent(100), left: Unit.zero, right: Unit.zero),
        backgroundColor: Color.rgba(15, 4, 28, 0.98),
        padding: Padding.all(Unit.pixels(30)),
        raw: {'box-shadow': '0 4px 20px rgba(0,0,0,0.5)'},
        display: Display.flex,
        justifyContent: JustifyContent.center,
        width: Unit.percent(100),
      ),
      css('.mobile-menu nav').styles(
        display: Display.flex,
        flexDirection: FlexDirection.column,
        alignItems: AlignItems.center,
        raw: {'gap': '25px'},
      ),
    ]),

    // Responsive Media Queries
    css('@media (max-width: 768px)', [
      css('.desktop-menu').styles(display: Display.none),
      css('.mobile-toggle').styles(display: Display.block),
      css('.navbar').styles(
        padding: Padding.symmetric(vertical: Unit.pixels(15), horizontal: Unit.percent(5)),
      ),
    ]),
  ];
}

class _NavBarState extends State<NavBar> {
  bool isMenuOpen = false;

  void toggleMenu() {
    setState(() {
      isMenuOpen = !isMenuOpen;
    });
  }

  @override
  Component build(BuildContext context) {
    return header(classes: 'navbar animate__animated animate__fadeInDown', [
      div(classes: 'logo', [
        img(
            src: 'assets/logo/ahmed_logo.png',
            width: 40,
            height: 40,
            attributes: {'style': 'border-radius: 50%; object-fit: cover;'}),
        span(styles: Styles(margin: Margin.only(left: Unit.pixels(10))), [text(AppData.name.split(' ').first)]),
      ]),

      // Desktop Menu
      nav(classes: 'desktop-menu', [
        a(href: '#about', [text('About')]),
        a(href: '#experience', [text('Experience')]),
        a(href: '#projects', [text('Projects')]),
        a(href: '#contact', [text('Contact')]),
      ]),

      // Mobile Toggle using FontAwesome
      div(classes: 'mobile-toggle', events: {
        'click': (e) => toggleMenu()
      }, [
        i(classes: isMenuOpen ? 'fa-solid fa-xmark' : 'fa-solid fa-bars', []),
      ]),

      // Mobile Menu Overlay
      if (isMenuOpen)
        div(classes: 'mobile-menu animate__animated animate__fadeIn', [
          nav([
            a(href: '#about', events: {'click': (e) => toggleMenu()}, [text('About')]),
            a(href: '#experience', events: {'click': (e) => toggleMenu()}, [text('Experience')]),
            a(href: '#projects', events: {'click': (e) => toggleMenu()}, [text('Projects')]),
            a(href: '#contact', events: {'click': (e) => toggleMenu()}, [text('Contact')]),
          ]),
        ]),
    ]);
  }
}
