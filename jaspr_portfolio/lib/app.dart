import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import 'pages/home.dart';

@client
class App extends StatefulComponent {
  const App({super.key});

  @override
  State<App> createState() => AppState();
}

class AppState extends State<App> {
  @override
  Component build(BuildContext context) {
    return const Home();
  }

  // Remove default styles or keep minimal global reset if needed.
  // Home handles its own layout.
  @css
  static List<StyleRule> get styles => [
    css('html, body').styles(
      margin: Margin.zero,
      padding: Padding.zero,
      width: Unit.percent(100),
      height: Unit.percent(100),
      fontFamily: const FontFamily.list([FontFamily('Inter'), FontFamily('sans-serif')]),
      backgroundColor: Color('#0F041C'), // Global background
      color: Colors.white,
    ),
    css('*').styles(
      boxSizing: BoxSizing.borderBox,
    ),
  ];
}
