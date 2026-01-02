import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../app_data.dart';

class ExperienceSection extends StatefulComponent {
  const ExperienceSection({super.key});

  @override
  State<ExperienceSection> createState() => _ExperienceSectionState();

  @css
  static final styles = [
    css('.experience', [
      css('&').styles(
        padding: Padding.symmetric(vertical: Unit.pixels(80), horizontal: Unit.percent(10)),
        maxWidth: Unit.pixels(800),
        margin: Margin.symmetric(horizontal: Unit.auto),
      ),
      css('h2').styles(
        fontSize: 2.5.rem,
        textAlign: TextAlign.center,
        margin: Margin.only(bottom: Unit.pixels(60)),
        color: Colors.white,
      ),
      css('.timeline').styles(
        position: Position.relative(),
        border: Border.only(
          left: BorderSide(color: Color('#A855F7'), width: Unit.pixels(2)),
        ),
        padding: Padding.only(left: Unit.pixels(30)),
        margin: Margin.only(left: Unit.pixels(20)),
      ),
      css('.timeline-item').styles(
        margin: Margin.only(bottom: Unit.pixels(40)),
        position: Position.relative(),
      ),
      css('.timeline-item::before').styles(
        content: '',
        position: Position.absolute(
          left: Unit.pixels(-36),
          top: Unit.pixels(5),
        ),
        width: Unit.pixels(10),
        height: Unit.pixels(10),
        radius: BorderRadius.circular(Unit.percent(50)),
        backgroundColor: Color('#A855F7'),
        raw: {'box-shadow': '0 0 10px #A855F7'},
      ),
      css('h3').styles(
        fontSize: 1.5.rem,
        color: Colors.white,
        margin: Margin.only(bottom: Unit.pixels(8)),
      ),
      css('.company').styles(
        color: Color('#A855F7'),
        fontWeight: FontWeight.bold,
      ),
      css('.period').styles(
        color: Color.rgba(255, 255, 255, 0.6),
        fontSize: 0.9.rem,
        margin: Margin.only(bottom: Unit.pixels(16)),
      ),
      css('p').styles(
        color: Color.rgba(255, 255, 255, 0.8),
        lineHeight: Unit.em(1.6),
        margin: Margin.zero,
      ),
      css('.show-more-container').styles(
        display: Display.flex,
        justifyContent: JustifyContent.center,
        margin: Margin.only(top: Unit.pixels(20)),
      ),
      css('.show-more-btn').styles(
        padding: Padding.symmetric(vertical: Unit.pixels(10), horizontal: Unit.pixels(24)),
        backgroundColor: Colors.transparent,
        border: Border.all(color: Color('#A855F7')),
        radius: BorderRadius.circular(Unit.pixels(30)),
        color: Colors.white,
        cursor: Cursor.pointer,
        fontSize: 1.rem,
        transition: const Transition('all', duration: Duration(milliseconds: 300)),
        display: Display.flex,
        alignItems: AlignItems.center,
      ),
      css('.show-more-btn:hover').styles(
        backgroundColor: Color('#A855F7'),
        raw: {'box-shadow': '0 0 15px rgba(168, 85, 247, 0.4)'},
      ),
      css('.education-card').styles(
        backgroundColor: Color.rgba(255, 255, 255, 0.05),
        padding: Padding.all(Unit.pixels(24)),
        radius: BorderRadius.circular(Unit.pixels(12)),
        margin: Margin.only(bottom: Unit.pixels(20)),
        transition: const Transition('transform', duration: Duration(milliseconds: 300)),
      ),
      css('.education-card:hover').styles(
        transform: Transform.scale(1.02),
        backgroundColor: Color.rgba(255, 255, 255, 0.08),
      ),
      css('.edu-header').styles(
        display: Display.flex,
        justifyContent: JustifyContent.spaceBetween,
        alignItems: AlignItems.center,
        flexWrap: FlexWrap.wrap,
        gap: Gap(row: Unit.pixels(10), column: Unit.pixels(10)),
        margin: Margin.only(bottom: Unit.pixels(8)),
      ),
      css('.edu-date').styles(
        color: Color('#A855F7'),
        fontWeight: FontWeight.bold,
      ),
      css('.edu-school').styles(
        color: Color.rgba(255, 255, 255, 0.7),
        margin: Margin.zero,
      ),
    ]),
  ];
}

class _ExperienceSectionState extends State<ExperienceSection> {
  bool showAll = false;
  final int initialCount = 3;

  @override
  Component build(BuildContext context) {
    final experiences = AppData.experiences;
    final displayedExperiences = showAll ? experiences : experiences.take(initialCount).toList();

    return section(id: 'experience', classes: 'experience', [
      h2([text('Experience')]),
      div(classes: 'timeline', [
        for (var i = 0; i < displayedExperiences.length; i++)
          div(classes: 'timeline-item animate__animated animate__fadeInUp', attributes: {
            'style': 'animation-delay: ${i * 0.1}s'
          }, [
            div(classes: 'timeline-content', [
              h3([text(displayedExperiences[i].role)]),
              text(' at '),
              span(classes: 'company', [text(displayedExperiences[i].company)]),
              div(classes: 'period', [text(displayedExperiences[i].period)]),
              p([text(displayedExperiences[i].description)]),
            ]),
          ]),
      ]),

      if (experiences.length > initialCount)
        div(classes: 'show-more-container', [
          button(classes: 'show-more-btn', events: {
            'click': (e) {
              setState(() {
                showAll = !showAll;
              });
            }
          }, [
            text(showAll ? 'Show Less' : 'Show More'),
            i(
                classes: showAll ? 'fa-solid fa-chevron-up' : 'fa-solid fa-chevron-down',
                styles: Styles(margin: Margin.only(left: Unit.pixels(8))),
                []),
          ]),
        ]),

      div(styles: Styles(height: Unit.pixels(60)), []), // spacer

      h2([text('Education')]),
      div(classes: 'education-list', [
        for (final edu in AppData.education)
          div(classes: 'education-card animate__animated animate__zoomIn', [
            div(classes: 'edu-header', [
              h3([text(edu['degree']!)]),
              span(classes: 'edu-date', [text(edu['date']!)]),
            ]),
            p(classes: 'edu-school', [text(edu['institution']!)]),
          ]),
      ]),
    ]);
  }
}
