import '../../models/experience.dart';
import '../../models/project.dart';

class AppData {
  // Strings
  static const String name = "Ahmed Hussiney Hussein";
  static const String role = "Flutter Developer";
  static const String heroTitle = "Ahmed Hussiney Hussein";
  static const String heroSubtitle =
      "Flutter Developer with 4+ years of experience.";
  static const String heroDescription =
      "Delivering end-to-end mobile applications across multiple industries, including E-commerce, Banking, Food Delivery, Education, and Healthcare. Mentor to 180+ students.";

  static const String aboutTitleStart = "Turning ideas\ninto ";
  static const String aboutTitleHighlight = "reality";
  static const String aboutSubtitle =
      "Skilled in Flutter, Clean Architecture, and Native Integrations. I build apps that perform.";

  static const String contactText =
      "Looking for a rigorous Flutter Developer? Have a project in mind? Let's connect.";
  static const String contactEmail = "ahmedhosni803@gmail.com";
  static const String contactPhone = "01226316290";
  static const String contactLocation = "Egypt, Cairo";

  static const String cvUrl = "pdf/Ahmed_Hussiney_Hussein.pdf";

  // Data
  static final List<Project> projects = [
    Project(
      title: 'ADCB Egypt Mobile Banking',
      subtitle: 'Banking App',
      description:
          'Comprehensive digital banking application enabling customers to manage accounts, transfers, cards, and secure services.',
      imageUrl: 'https://placehold.co/600x400.png',
      links: [
        const ProjectLink(
          title: 'App',
          googlePlay: 'https://play.google.com/store/apps',
          appleStore: 'https://apps.apple.com',
        ),
      ],
    ),
    Project(
      title: 'Dushka Burger',
      subtitle: 'Food Delivery',
      description:
          'Dedicated food ordering app allowing users to browse menus, customize orders, and place simple, seamless orders.',
      imageUrl:
          'https://is1-ssl.mzstatic.com/image/thumb/Purple221/v4/a2/e1/b7/a2e1b796-901c-9bd4-df26-a75d54a56d0e/AppIcon-0-0-1x_U007emarketing-0-11-0-85-220.png/1200x630wa.jpg',
      links: [
        const ProjectLink(
          title: 'App',
          googlePlay:
              'https://play.google.com/store/apps/details?id=com.dushka.dushka_burger',
          appleStore:
              'https://apps.apple.com/us/app/dushka-burger/id6692616449',
        ),
      ],
    ),
    Project(
      title: 'PetaPen',
      subtitle: 'E-commerce',
      description:
          'One-stop shopping app for high-quality stationery, curated for professionals and students.',
      imageUrl:
          'https://is1-ssl.mzstatic.com/image/thumb/Purple211/v4/16/18/8e/16188eca-291e-b715-85ff-3b530f76a8b0/AppIcon-0-0-1x_U007emarketing-0-11-0-85-220.png/1200x630wa.jpg',
      links: [
        const ProjectLink(
          title: 'App',
          googlePlay:
              'https://play.google.com/store/apps/details?id=com.company.petaPen',
          appleStore: 'https://apps.apple.com/eg/app/petapen/id6504558906',
        ),
      ],
    ),
    Project(
      title: 'Qarah',
      subtitle: 'Services',
      description:
          'App for water filter maintenance and cooler services offering technician requests and product purchases.',
      imageUrl:
          'https://is1-ssl.mzstatic.com/image/thumb/Purple211/v4/93/ca/df/93cadf87-0aa6-4a68-0db9-f8a088c60f69/AppIcon-0-0-1x_U007emarketing-0-8-0-0-85-220.png/1200x630wa.png',
      links: [
        const ProjectLink(
          title: 'User App',
          googlePlay:
              'https://play.google.com/store/apps/details?id=com.qarah.userapp',
          appleStore:
              'https://apps.apple.com/eg/app/qarah-%D9%82%D8%B1%D8%A7%D8%AD/id6749554152',
        ),
        const ProjectLink(
          title: 'Provider App',
          googlePlay:
              'https://play.google.com/store/apps/details?id=com.qarah.providerapp',
          appleStore:
              'https://apps.apple.com/eg/app/qarah-provider-%D9%85%D8%B2%D9%88%D8%AF-%D8%AE%D8%AF%D9%85%D8%A9-%D9%82%D8%B1%D8%A7%D8%AD/id6749553815',
        ),
      ],
    ),
    Project(
      title: 'UCMAS',
      subtitle: 'Education',
      description:
          'Interactive mobile application revolutionizing the way students learn and engage with mathematics.',
      imageUrl:
          'https://is1-ssl.mzstatic.com/image/thumb/Purple221/v4/ea/89/5d/ea895deb-4b29-326a-e1c5-fb25e918805b/AppIcon-0-0-1x_U007emarketing-0-11-0-0-85-220.png/1200x630wa.jpg',
      links: [
        const ProjectLink(
          title: 'App',
          googlePlay:
              'https://play.google.com/store/apps/details?id=ws.bmsc.ucmas',
          appleStore:
              'https://apps.apple.com/eg/app/ucmas-get-in-challenge/id6468704261',
        ),
      ],
    ),
    Project(
      title: 'Neomrs',
      subtitle: 'Social Media',
      description:
          'Platform connecting users to share content, like, comment, and stay in touch with friends and family.',
      imageUrl:
          'https://is1-ssl.mzstatic.com/image/thumb/Purple221/v4/43/91/37/43913755-20fb-1612-077e-a2dde65ee148/AppIcon-0-0-1x_U007emarketing-0-8-0-85-220.png/1200x630wa.png',
      links: [
        const ProjectLink(
          title: 'App',
          googlePlay:
              'https://play.google.com/store/apps/details?id=app.neomars.com',
          appleStore: 'https://apps.apple.com/eg/app/neomrs/id6478036232',
        ),
      ],
    ),
    Project(
      title: 'Voyager',
      subtitle: 'Travel',
      description:
          'Booking app for flights, hotels, and tours across most countries with ease.',
      imageUrl:
          'https://is1-ssl.mzstatic.com/image/thumb/Purple211/v4/0d/41/53/0d4153cb-be02-4b87-b3dc-2a7a21b59097/AppIcon-1x_U007emarketing-0-7-0-0-85-220-0.png/1200x630wa.png',
      links: [
        const ProjectLink(
          title: 'App',
          googlePlay:
              'https://play.google.com/store/apps/details?id=com.echopos.voyager',
          appleStore:
              'https://apps.apple.com/us/app/voyager-traveling/id6504419730',
        ),
      ],
    ),
    Project(
      title: 'Smo alfkr - App Medical',
      subtitle: 'Healthcare',
      description:
          'Complete medical app for doctor appointments, video/audio calls, chat, and online payments.',
      imageUrl:
          'https://doctorstorage.blob.core.windows.net/632043/Profile/passport_04c076ec-4895-4e33-9c82-b6b88b8b7bc8.jpg?sig=VutXnpexGC5xBvw2lwhynbnp1Ev%2FS5p8oRMj4tdzdP4%3D&sv=2015-04-05&si=PrivatePolicy&sr=b',
      links: [
        const ProjectLink(
          title: 'App',
          googlePlay:
              'https://play.google.com/store/apps/details?id=com.smoalfkr.smoalfkr',
          appleStore: 'https://apps.apple.com/eg/app/smoalfkr/id6502081376',
        ),
      ],
    ),
  ];

  static final List<Experience> experiences = [
    Experience(
      company: 'Cubic Information Systems',
      role: 'Senior Mobile Developer',
      period: 'Dec 2024 – present',
      description:
          'Built end-to-end mobile banking apps with Flutter, including native code integrations and secure data encryption.',
    ),
    Experience(
      company: 'Route',
      role: 'Flutter Instructor',
      period: 'Jun 2023 – present',
      description:
          'Mentored 180+ students through real-world projects. Taught advanced concepts (Clean Architecture, Maps, Payment) and guided app publishing.',
    ),
    Experience(
      company: 'Aknana',
      role: 'Mid Senior Flutter Developer',
      period: 'Oct 2023 – Dec 2024',
      description:
          'Developed a social media application with Flutter at a software house.',
    ),
    Experience(
      company: 'Freelancer',
      role: 'Flutter Developer',
      period: 'Sep 2022 – present',
      description:
          'Developed and published 15+ apps across E-commerce, Medical, Educational, Social, and Utility sectors.',
    ),
    Experience(
      company: 'BMS',
      role: 'Flutter Developer',
      period: 'Dec 2023 – Nov 2024',
      description:
          'Built and maintained scalable apps for E-commerce and training systems.',
    ),
    Experience(
      company: 'Binary',
      role: 'Flutter Developer',
      period: 'Feb 2023 – Jan 2024',
      description:
          'Built and maintained scalable apps for education and training systems.',
    ),
    Experience(
      company: 'Lightbulb Tech',
      role: 'Flutter Developer',
      period: 'Mar 2023 – Dec 2023',
      description:
          'Developed educational applications focusing on usability and performance.',
    ),
    Experience(
      company: 'Nebras',
      role: 'Flutter Developer',
      period: 'Sep 2021 – Dec 2023',
      description:
          'Developed E-commerce applications focusing on usability and performance.',
    ),
  ];

  static const List<Map<String, String>> education = [
    {
      'degree': "Bachelor's degree in Information Systems",
      'institution': 'SHA',
      'date': '2019 – 2023',
    },
  ];
}
