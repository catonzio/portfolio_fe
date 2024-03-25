import 'package:portfolio/app/modules/about/work_experience_model.dart';

class Constants {
  static const Duration pageTransitionDuration = Duration(milliseconds: 400);
  static const Duration navbarTransitionDuration = Duration(milliseconds: 300);

  static const double mobileWidth = 780;
  static const double tabletWidth = 992;
  static const double desktopWidth = 1200;

  static const List<Map<String, String>> overviewSkillBoxes = [
    {
      "iconPath": "assets/images/developer.png",
      "title": "Developer",
    },
    {
      "iconPath": "assets/images/software_engineer.png",
      "title": "Software Engineer",
    },
    {
      "iconPath": "assets/images/architect.png",
      "title": "Architect",
    },
    {"iconPath": "assets/images/architect.png", "title": "Data Scientist"}
  ];

  static const String aboutOverview =
      """I'm a passionate data scientist and software engineer at IBM, specializing in Python and Flutter.
      With a knack for crafting innovative solutions, I thrive on pushing boundaries in technology.
      Explore my portfolio to see how I blend creativity with technical expertise.""";

  static List<WorkExperience> workExperiences = [
    WorkExperience(
        id: 1,
        company: "IBM",
        role: "Data Scientist",
        date: "Feb 2023 - Present",
        description:
            "Developed machine learning models to predict customer behavior and improve business processes."),
    WorkExperience(
        id: 2,
        company: "Whitehall Reply",
        role: "Backend Engineer",
        date: "Nov 2022 - Feb 2023",
        description:
            "Developed and maintained software solutions for clients, including web applications and APIs."),
    WorkExperience(
        id: 3,
        company: "RES Media",
        role: "Full Stack Engineer",
        date: "Aug 2022 - Jan 2023",
        description:
            "Developed machine learning models to predict customer behavior and improve business processes."),
    WorkExperience(
        id: 4,
        company: "BigProfiles",
        role: "Intern",
        date: "Sep 2019 - Dec 2019",
        description:
            "Developed machine learning models to predict customer behavior and improve business processes."),
    // WorkExperience(
    //     id: 5,
    //     company: "IBM",
    //     role: "Data Scientist",
    //     date: "Feb 2023 - Present",
    //     description:
    //         "Developed machine learning models to predict customer behavior and improve business processes."),
    // WorkExperience(
    //     id: 6,
    //     company: "Whitehall Reply",
    //     role: "Backend Engineer",
    //     date: "Nov 2022 - Feb 2023",
    //     description:
    //         "Developed and maintained software solutions for clients, including web applications and APIs."),
    // WorkExperience(
    //     id: 7,
    //     company: "RES Media",
    //     role: "Full Stack Engineer",
    //     date: "Aug 2022 - Jan 2023",
    //     description:
    //         "Developed machine learning models to predict customer behavior and improve business processes."),
    // WorkExperience(
    //     id: 8,
    //     company: "BigProfiles",
    //     role: "Intern",
    //     date: "Sep 2019 - Dec 2019",
    //     description:
    //         "Developed machine learning models to predict customer behavior and improve business processes.")
  ];
}
