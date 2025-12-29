
import 'package:flutter/material.dart';
import '../core/constants/app_data.dart';
import '../models/project.dart';
import '../models/experience.dart';

class PortfolioProvider with ChangeNotifier {
  List<Project> get projects => AppData.projects;
  List<Experience> get experiences => AppData.experiences;
}
