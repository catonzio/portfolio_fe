class Info {
  static List<String> get animatedTextsHome => [
        'Data Scientist',
        'Flutter Developer',
        'Backend Engineer',
        'Computer Scientist',
        'Constant learner',
        'A friend :)',
      ];

  static Map<String, String> get myInfo => {
        'Name': 'Danilo Catone',
        'Profile': 'Data Scientist',
        'Email': 'danilocatone@gmail.com',
        'Phone': '+39 331 623 9724',
        'Address': 'Via Carlo Fadda 125, Rome, Italy',
      };

  static Map<String, Map<String, dynamic>> get socials => {
        'LinkedIn': {
          'url': 'https://www.linkedin.com/in/danilocatone/',
          'iconUrl': "assets/icons/linkedin.png"
        },
        'GitHub': {
          'url': 'https://www.github.com/catonzio',
          'iconUrl': "assets/icons/github.png"
        },
        'Instagram': {
          'url': 'https://www.instagram.com/catonzio',
          'iconUrl': "assets/icons/instagram.png"
        },
      };

  static Map<String, int> get skills => {
        'html': 90,
        'css': 80,
        'js': 70,
        'python': 90,
      };

  static String get aboutMe => """
I'm Danilo Catone, a computer scientist, engineer, data scientist, and Flutter developer, fueled by an unquenchable thirst for science and technology. I earned my Bachelor's degree at Roma Tre and broadened my horizons during an enriching Erasmus stint in Valencia.

My journey led me to Politecnico di Milano for a Master's, specializing in Machine Learning. There, I delved into the transformative power of machine learning and its applications in data science.

Currently, I'm a data scientist at IBM, where I'm immersed in projects harnessing data's potential for insights and innovation. The dynamic field keeps me engaged and motivated.
""";
}
