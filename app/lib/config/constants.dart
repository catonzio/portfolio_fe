import 'package:flutter/material.dart';
import 'package:portfolio/app/modules/about/work_experience_model.dart';
import 'package:portfolio/app/modules/projects/project_model.dart';
import 'package:portfolio/app/shared/models/social_data.dart';
import 'package:portfolio/config/colors.dart';

class Constants {
  static const Duration pageTransitionDuration = Duration(milliseconds: 400);
  static const Duration navbarTransitionDuration = Duration(milliseconds: 300);

  static const double mobileWidth = 780;
  static const double tabletWidth = 992;
  static const double desktopWidth = 1200;

  static const List<Map<String, String>> overviewSkillBoxes = [
    {
      "iconPath": "assets/images/skills/developer.png",
      "title": "Developer",
    },
    {
      "iconPath": "assets/images/skills/software_engineer.png",
      "title": "Software Engineer",
    },
    {
      "iconPath": "assets/images/skills/architect.png",
      "title": "Architect",
    },
    {
      "iconPath": "assets/images/skills/architect.png",
      "title": "Data Scientist",
    },
  ];

  static const String aboutOverview = """
I'm a passionate data scientist and software engineer at IBM, specializing in Python and Flutter.
With a knack for crafting innovative solutions, I thrive on pushing boundaries in technology.
Explore my portfolio to see how I blend creativity with technical expertise.
  """;

  static const String projectsDescription = """
I have worked on a variety of projects, ranging from web applications to machine learning models.
Here are a few examples of my work. 
Click on a project to learn more about it.
  """;

  static const String contactInfoString = """
I'm always open to new opportunities and collaborations. 
Feel free to reach out to me using the form below.
""";

  static const List<Map<String, dynamic>> contactInfo = [
    {
      "icon": Icon(
        Icons.email,
        color: AppColors.darkWhite,
      ),
      "text": "danilocatone@gmail.com"
    },
    {
      "icon": Icon(
        Icons.phone_android,
        color: AppColors.darkWhite,
      ),
      "text": "+39 331 623 9724"
    },
    {
      "icon": Icon(
        Icons.location_on,
        color: AppColors.darkWhite,
      ),
      "text": "Rome, Italy"
    }
  ];

  static Map<String, SocialData> socialLinks = {
    "linkedin": SocialData(
      id: 1,
      name: "LinkedIn",
      iconPath: "assets/icons/linkedin.png",
      url: "https://www.linkedin.com/in/danilo-catone-660aa1174/",
    ),
    "github": SocialData(
      id: 2,
      name: "GitHub",
      iconPath: "assets/icons/github.png",
      url: "https://www.github.com/catonzio",
    ),
  };

  static List<WorkExperience> workExperiences = [
    WorkExperience(
        id: 0,
        company: "IBM",
        role: "Data Scientist",
        date: "Feb 2023 - Present",
        logoPath: "assets/images/logos/ibm_logo.png",
        description:
            "Developed machine learning models to predict customer behavior and improve business processes."),
    WorkExperience(
        id: 1,
        company: "Whitehall Reply",
        role: "Backend Engineer",
        date: "Nov 2022 - Feb 2023",
        logoPath: "assets/images/logos/reply_logo.png",
        description:
            "Developed and maintained software solutions for clients, including web applications and APIs."),
    WorkExperience(
        id: 2,
        company: "RES Media",
        role: "Full Stack Engineer",
        date: "Aug 2022 - Jan 2023",
        logoPath: "assets/images/logos/res_media_logo.png",
        description:
            "Developed machine learning models to predict customer behavior and improve business processes."),
    WorkExperience(
        id: 3,
        company: "BigProfiles",
        role: "Intern",
        date: "Sep 2019 - Dec 2019",
        logoPath: "assets/images/logos/big_profiles_logo.png",
        description:
            "Developed machine learning models to predict customer behavior and improve business processes."),
  ];

  static List<Project> projects = [
    Project(
      id: 0,
      name: "Portfolio",
      description:
          "This site, a Flutter web application showcasing my work and skills.",
      imagePath: "assets/images/projects/portfolio.png",
      url: "https://danilocatone.com/eight-puzzle",
      githubUrl: "https://github.com/catonzio/eight_puzzle",
    ),
    Project(
      id: 1,
      name: "AI Projects",
      description:
          "A collection of AI projects I developed using Python, showcasing my skills in machine learning and data analysis.",
      imagePath: "assets/images/projects/notebooks.png",
      url: "https://danilocatone.com/eight-puzzle",
      githubUrl: "https://github.com/catonzio/eight_puzzle",
    ),
    Project(
      id: 2,
      name: "Small games",
      description:
          "A collection of small games I developed using Flutter, showcasing AI algorithms like A* and Min-Max solutions.",
      imagePath: "assets/images/projects/a_star.png",
      url: "https://danilocatone.com/eight-puzzle",
      githubUrl: "https://github.com/catonzio/eight_puzzle",
    ),
    Project(
      id: 3,
      name: "ShaLi",
      description:
          "A full-stack web app that allows users to create and share each kind of list.",
      imagePath: "assets/images/projects/shali.png",
      url: "https://danilocatone.com/eight-puzzle",
      githubUrl: "https://github.com/catonzio/eight_puzzle",
    ),
    Project(
      id: 4,
      name: "RapEdit",
      description:
          "A Flutter mobile application that allows users to create and share rap lyrics.",
      imagePath: "assets/images/projects/rapedit.png",
      url: "https://danilocatone.com/eight-puzzle",
      githubUrl: "https://github.com/catonzio/eight_puzzle",
    ),
  ];
}
