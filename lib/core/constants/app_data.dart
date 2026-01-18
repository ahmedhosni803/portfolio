import '../../models/experience.dart';
import '../../models/project.dart';

class AppData {
  // ======================
  // Basic Info
  // ======================
  static const String name = "Ahmed Hussiney Hussein";
  static const String role = "Senior Flutter Developer";

  static const String heroTitle = "Ahmed Hussiney Hussein";
  static const String heroSubtitle =
      "Senior Flutter Developer with 4+ years of experience.";

  static const String heroDescription =
      "Building secure, production-ready mobile applications across fintech, banking, e-commerce, and on-demand services. Mentor to 200+ students.";

  static const String aboutTitleStart = "Turning ideas\ninto ";
  static const String aboutTitleHighlight = "reality";

  static const String aboutSubtitle =
      "Experienced in Flutter, Clean Architecture, state management, and native integrations. Focused on scalable and high-performance mobile applications.";

  // ======================
  // Contact
  // ======================
  static const String contactText =
      "Interested in working together or discussing a new opportunity? Let's connect.";
  static const String contactEmail = "ahmedhosni803@gmail.com";
  static const String contactPhone = "01226316290";
  static const String contactLocation = "Cairo, Egypt";
  static const String mediumUrl = "https://medium.com/@ahmedhosni803";

  static const String cvUrl = "assets/pdf/Ahmed_Hussiney_Hussein.pdf";

  // ======================
  // Projects (from CV)
  // ======================
static final List<Project> projects = [
  Project(
    title: 'ADCB Egypt Mobile Banking',
    subtitle: 'Fintech / Banking',
    description:
        'Production mobile banking application enabling customers to manage accounts, transfers, cards, and secure banking services. Contributed to the Digital Loan feature.',
    imageUrl:
        'https://is1-ssl.mzstatic.com/image/thumb/Purple221/v4/45/74/65/457465fa-d802-1c1e-c2a1-6ae58f81c942/AppIcon-0-0-1x_U007emarketing-0-6-0-85-220.png/1200x630wa.jpg',
    links: [
      const ProjectLink(
        title: 'App',
        googlePlay:
            'https://play.google.com/store/apps/details?id=com.adcb.bank',
        appleStore:
            'https://apps.apple.com/ae/app/adcb/id547172388',
      ),
    ],
  ),

  Project(
    title: 'FindHelp Platform',
    subtitle: 'Multi-App Ecosystem',
    description:
        'Production-grade ecosystem including customer, shops, restaurants, and delivery applications.',
    imageUrl:
        'https://play-lh.googleusercontent.com/6G8u9nY5D3y7QYc6Kx8n3U4k5lR2p9JxZK=s180',
    links: [
      const ProjectLink(
        title: 'Customer App',
        googlePlay:
            'https://play.google.com/store/apps/details?id=com.extreme.help',
      ),
      const ProjectLink(
        title: 'Shops App',
        googlePlay:
            'https://play.google.com/store/apps/details?id=com.extreme.shopprovider',
      ),
      const ProjectLink(
        title: 'Delivery App',
        googlePlay:
            'https://play.google.com/store/apps/details?id=com.extreme.delivery',
      ),
    ],
  ),

  Project(
    title: 'Meatoo',
    subtitle: 'E-commerce',
    description:
        'Meat shopping application offering a fast and convenient shopping experience.',
    imageUrl:
        'https://is1-ssl.mzstatic.com/image/thumb/Purple221/v4/8c/1e/2b/8c1e2b4d-3c9b-4a2f-9b3d-6e7b5d1f4a2c/AppIcon-0-0-1x_U007emarketing-0-11-0-85-220.png/1200x630wa.png',
    links: [
      const ProjectLink(
        title: 'App',
        googlePlay:
            'https://play.google.com/store/apps/details?id=com.meatoo.app',
        appleStore:
            'https://apps.apple.com/eg/app/meatoo/id6448787340',
      ),
    ],
  ),

  Project(
    title: 'Qarah',
    subtitle: 'On-Demand Services',
    description:
        'Saudi application for water filter maintenance and technician services with online payments.',
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
    title: 'UCMAS – Get In Challenge',
    subtitle: 'Education',
    description:
        'Interactive education application designed to improve student engagement and learning experience.',
    imageUrl:
        'https://is1-ssl.mzstatic.com/image/thumb/Purple221/v4/ea/89/5d/ea895deb-4b29-326a-e1c5-fb25e918805b/AppIcon-0-0-1x_U007emarketing-0-11-0-0-85-220.png/1200x630wa.png',
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
    title: 'Voyager',
    subtitle: 'Travel',
    description:
        'Travel booking application for flights, hotels, and tours.',
    imageUrl:
        'https://is1-ssl.mzstatic.com/image/thumb/Purple211/v4/0d/41/53/0d4153cb-be02-4b87-b3dc-2a7a21b59097/AppIcon-1x_U007emarketing-0-7-0-0-85-220.png/1200x630wa.png',
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
];

  // ======================
  // Experience (from CV)
  // ======================
  static final List<Experience> experiences = [
    Experience(
      company: 'Cubic Information Systems',
      role: 'Senior Mobile Developer',
      period: 'Dec 2024 – Present',
      description:
          'Full-time | On-site – Cairo, Egypt\n'
          'Developed secure mobile banking applications using Flutter with native integrations and security-focused solutions.',
    ),
    Experience(
      company: 'Route',
      role: 'Flutter Instructor',
      period: 'Jun 2023 – Present',
      description:
          'Part-time | On-site – Cairo, Egypt\n'
          'Mentored 200+ students through advanced Flutter training and real-world projects, covering Clean Architecture, state management, and app publishing.',
    ),
    Experience(
      company: 'Aknana',
      role: 'Senior Flutter Developer',
      period: 'Dec 2023 – Dec 2024',
      description:
          'Full-time | Remote – Saudi Arabia\n'
          'Developed a social media application using Flutter with a focus on performance optimization and scalable architecture.',
    ),
    Experience(
      company: 'BMS',
      role: 'Flutter Developer',
      period: 'Dec 2023 – Nov 2024',
      description:
          'Full-time | Remote – Alexandria, Egypt\n'
          'Built and maintained education and training applications focusing on scalability and usability.',
    ),
    Experience(
      company: 'Binary',
      role: 'Flutter Developer',
      period: 'Feb 2023 – Jan 2024',
      description:
          'Full-time | Remote – Cairo, Egypt\n'
          'Contributed to the development of a social media application using clean architecture and state management.',
    ),
    Experience(
      company: 'Lightbulb Tech',
      role: 'Flutter Developer',
      period: 'Mar 2023 – Dec 2023',
      description:
          'Part-time | Remote\n'
          'Developed educational Flutter applications focusing on usability and performance.',
    ),
    Experience(
      company: 'Nebras',
      role: 'Flutter Developer',
      period: 'Sep 2021 – Feb 2023',
      description:
          'Full-time | Remote – Saudi Arabia\n'
          'Developed a water distribution application with payment and delivery workflows using Flutter.',
    ),
    Experience(
      company: 'Freelancer',
      role: 'Flutter Developer',
      period: 'Sep 2022 – Present',
      description:
          'Freelance | Remote\n'
          'Delivered and published 15+ Flutter applications across fintech, e-commerce, education, and on-demand services.',
    ),
  ];

  // ======================
  // Education
  // ======================
  static const List<Map<String, String>> education = [
    {
      'degree': "Bachelor's degree in Information Systems",
      'institution': 'SHA',
      'date': '2019 – 2023',
    },
  ];
}
