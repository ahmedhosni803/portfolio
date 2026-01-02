import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../app_data.dart';

class ProjectsSection extends StatelessComponent {
  const ProjectsSection({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'projects', classes: 'projects', [
      h2([text('Featured Projects')]),
      div(classes: 'project-grid', [
        for (final project in AppData.projects)
          div(classes: 'project-card', [
            div(classes: 'project-image', [
              img(src: project.imageUrl, alt: project.title),
              div(classes: 'overlay', []),
            ]),
            div(classes: 'project-content', [
              h3([text(project.title)]),
              if (project.subtitle != null) span(classes: 'subtitle', [text(project.subtitle!)]),
              p([text(project.description)]),
              if (project.links.isNotEmpty)
                div(classes: 'links', [
                  for (final link in project.links) ...[
                    if (link.googlePlay != null)
                      a(href: link.googlePlay!, target: Target.blank, classes: 'store-link', [
                        text('Google Play'), // or icon
                      ]),
                    if (link.appleStore != null)
                      a(href: link.appleStore!, target: Target.blank, classes: 'store-link', [
                        text('App Store'),
                      ]),
                  ],
                ]),
            ]),
          ]),
      ]),
    ]);
  }

  @css
  static final styles = [
    css('.projects', [
      css('&').styles(
        padding: Padding.symmetric(vertical: Unit.pixels(80), horizontal: Unit.percent(10)),
        maxWidth: Unit.pixels(1200),
        margin: Margin.symmetric(horizontal: Unit.auto),
      ),
      css('h2').styles(
        fontSize: 2.5.rem,
        textAlign: TextAlign.center,
        margin: Margin.only(bottom: Unit.pixels(60)),
        color: Colors.white,
      ),
      css('.project-grid').styles(
        display: Display.grid,
        raw: {'gap': '30px', 'grid-template-columns': 'repeat(auto-fill, minmax(300px, 1fr))'},
      ),
      css('.project-card').styles(
        backgroundColor: Color.rgba(255, 255, 255, 0.05),
        radius: BorderRadius.circular(Unit.pixels(15)),
        transition: const Transition('transform', duration: Duration(milliseconds: 300)),
        raw: {
          'box-shadow': '0 10px 30px rgba(0, 0, 0, 0.2)',
          'overflow': 'hidden',
        },
      ),
      css('.project-card:hover').styles(
        transform: Transform.scale(1.03),
      ),
      css('.project-image').styles(
        position: Position.relative(),
        height: Unit.pixels(200),
        raw: {'overflow': 'hidden'},
      ),
      css('img').styles(
        width: Unit.percent(100),
        height: Unit.percent(100),
        raw: {'object-fit': 'cover'},
      ),
      css('.project-content').styles(
        padding: Padding.all(Unit.pixels(24)),
      ),
      css('h3').styles(
        fontSize: 1.5.rem,
        color: Colors.white,
        margin: Margin.only(bottom: Unit.pixels(8)),
      ),
      css('.subtitle').styles(
        color: Color('#A855F7'),
        fontSize: 0.9.rem,
        fontWeight: FontWeight.bold,
        display: Display.block,
        margin: Margin.only(bottom: Unit.pixels(12)),
      ),
      css('p').styles(
        color: Color.rgba(255, 255, 255, 0.8),
        lineHeight: Unit.em(1.6),
        margin: Margin.only(bottom: Unit.pixels(20)),
      ),
      css('.links').styles(
        display: Display.flex,
        raw: {'gap': '10px'},
      ),
      css('.store-link').styles(
        padding: Padding.symmetric(vertical: Unit.pixels(8), horizontal: Unit.pixels(16)),
        radius: BorderRadius.circular(Unit.pixels(20)),
        backgroundColor: Color.rgba(255, 255, 255, 0.1),
        color: Colors.white,
        textDecoration: TextDecoration.none,
        fontSize: 0.9.rem,
        transition: const Transition('background-color', duration: Duration(milliseconds: 200)),
      ),
      css('.store-link:hover').styles(
        backgroundColor: Color('#A855F7'),
      ),
    ]),
  ];
}
