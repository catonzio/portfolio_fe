import 'package:portfolio/config/themes.dart';
import 'package:portfolio/views/about/about.dart';
import 'package:portfolio/views/contact/contact.dart';
import 'package:portfolio/views/home/home.dart';
import 'package:portfolio/views/projects/projects.dart';
import 'package:portfolio/views/statistics/statistics.dart';

class Configs {
  static List<String> get supportedLocales => ['en', 'it'];

  static Map<String, Map<String, dynamic>> get sectionsInfo => {
        'Home': {
          'index': 0,
          'page': (String title) => HomePage(title: title),
          'heightPerc': 100,
          'heightConfPerc': 0,
          'title': 'Home',
          'bgColor': Themes.black,
          'imagePath': 'assets/images/portrait.jpg',
        },
        'About': {
          'index': 1,
          'page': (String title) => AboutPage(title: title),
          'heightPerc': 100,
          'heightConfPerc': 0,
          'title': 'About',
          'bgColor': Themes.lightGrey,
          'imagePath': '',
        },
        'Statistics': {
          'index': 2,
          'page': (String title) => StatisticsPage(title: title),
          'heightPerc': 25,
          'heightConfPerc': 100,
          'title': 'Statistics',
          'bgColor': Themes.electricBlue,
          'imagePath': 'assets/images/counters-bg.jpg',
        },
        'Projects': {
          'index': 3,
          'page': (String title) => ProjectsPage(title: title),
          'heightPerc': 100,
          'heightConfPerc': 0,
          'title': 'Projects',
          'bgColor': Themes.lightGrey,
          'imagePath': '',
        },
        'Contacts': {
          'index': 4,
          'page': (String title) => ContactPage(title: title),
          'heightPerc': 100,
          'heightConfPerc': 100,
          'title': 'Contacts',
          'bgColor': Themes.coolGreen,
          'imagePath': 'assets/images/overlay-bg.jpg',
        },
      };

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

  static Map<String, Map<String, dynamic>> get projectsDetails => {
        'Eight Puzzle': {
          'imagePath': 'assets/images/im1.jpg',
          'title': 'Eight Puzzle',
          'description':
              'A fun and challenging game of the eight-puzzle where you can test your skills in rearranging tiles. Take it a step further by utilizing the A* algorithm to auto-solve the puzzle.',
          'link': '',
          'url': 'https://danilocatone.com/eight-puzzle',
        },
        'ShaLi': {
          'imagePath': 'assets/images/im2.jpg',
          'title': 'ShaLi',
          'description':
              'Shali is your go-to app for creating lists that can be easily shared and collaborated on with other users. Stay organized, share tasks, and accomplish things together effortlessly.',
          'link': '',
          'url': 'https://danilocatone.com/shali',
        },
        // 'Project3': {
        //   'imagePath': 'assets/images/im3.jpg',
        //   'title': 'Project3',
        //   'description': 'Project3 description',
        //   'link': '',
        //   'url': 'https://danilocatone.com/eight-puzzle',
        // },
        // 'Project4': {
        //   'imagePath': 'assets/images/im4.jpg',
        //   'title': 'Project4',
        //   'description': 'Project4 description',
        //   'link': '',
        //   'url': 'https://danilocatone.com/eight-puzzle',
        // },
        // 'Project5': {
        //   'imagePath': 'assets/images/im1.jpg',
        //   'title': 'Project5',
        //   'description': 'Project5 description',
        //   'link': '',
        //   'url': 'https://danilocatone.com/eight-puzzle',
        // },
        // 'Project6': {
        //   'imagePath': 'assets/images/im2.jpg',
        //   'title': 'Project6',
        //   'description': 'Project6 description',
        //   'link': '',
        //   'url': 'https://danilocatone.com/eight-puzzle',
        // },
      };

  static String get aboutMe => """
I'm Danilo Catone, a computer scientist, engineer, data scientist, and Flutter developer, fueled by an unquenchable thirst for science and technology. I earned my Bachelor's degree at Roma Tre and broadened my horizons during an enriching Erasmus stint in Valencia.

My journey led me to Politecnico di Milano for a Master's, specializing in Machine Learning. There, I delved into the transformative power of machine learning and its applications in data science.

Currently, I'm a data scientist at IBM, where I'm immersed in projects harnessing data's potential for insights and innovation. The dynamic field keeps me engaged and motivated.
""";

  static String loremIpsum({int words = 10}) =>
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed varius magna auctor est feugiat tristique. Mauris sed vehicula ante, vehicula condimentum turpis. Suspendisse varius mauris tellus, id facilisis erat vehicula vel. In mattis, dolor eu posuere fringilla, arcu mi commodo dui, in venenatis tortor mi in leo. Duis posuere efficitur arcu, ac dignissim magna bibendum non. Nullam ultrices gravida vehicula. Vivamus pharetra leo at ante tincidunt, eget accumsan libero venenatis. Curabitur ornare magna ut commodo varius. Nunc in tincidunt lectus. Donec in enim diam.\nMorbi laoreet tempor dui, ut convallis metus ornare vel. Nunc eleifend sit amet massa nec fermentum. Aenean in ultricies augue. Donec venenatis ultricies dui, sit amet tempus velit aliquam et. Vestibulum tempor nisl nec nulla mattis pharetra. Nam odio augue, viverra quis risus non, semper tristique nisi. In felis libero, malesuada sed auctor nec, tempus at velit.\nMorbi ac interdum nisl. Etiam euismod libero a erat semper ornare. Nunc hendrerit justo id magna consequat, at fermentum ex condimentum. Integer fermentum sapien id magna luctus, sit amet rhoncus neque laoreet. Nulla at ultricies felis. Maecenas elit lectus, pellentesque quis faucibus id, imperdiet et leo. Fusce nec nisl vitae felis commodo lobortis. Aenean sollicitudin, sem ut auctor ultrices, ante tellus gravida justo, sed condimentum neque libero non leo. Etiam lacinia rutrum arcu, in suscipit ex facilisis et. Sed in porta erat, bibendum condimentum nulla. Integer consequat molestie odio ut ornare.\nVestibulum nec tortor et eros euismod posuere ac at turpis. Fusce dignissim sed justo eu tincidunt. Nam elit quam, imperdiet in tristique at, luctus nec justo. Integer euismod cursus enim vel suscipit. Integer sit amet quam in eros vulputate tristique a vitae lectus. Donec ultrices tortor ut arcu molestie ornare. Aenean eu massa sollicitudin lorem lobortis mollis. Quisque at elementum sem. Vivamus sodales faucibus urna a rhoncus. Ut eget elit non sem posuere malesuada. Etiam tempus, tortor ac dignissim posuere, libero tortor volutpat enim, sagittis ullamcorper justo libero nec mi. Morbi rhoncus nunc in malesuada faucibus. Donec et vehicula turpis. Pellentesque at purus sit amet purus tempor blandit. Etiam nibh augue, tincidunt ut dolor ac, ultricies efficitur nibh. Mauris non ipsum vel nibh congue laoreet vel eu quam.\nSuspendisse fermentum velit egestas ipsum sagittis faucibus. Nunc volutpat felis sed volutpat consectetur. Pellentesque a elit pulvinar, congue felis posuere, gravida velit. Donec facilisis, turpis aliquet iaculis elementum, ligula magna consectetur lacus, sit amet condimentum tortor massa id tellus. Donec efficitur, elit vel placerat maximus, nulla ipsum consequat erat, nec ultricies risus nisi mollis libero. Quisque urna tellus, luctus vel suscipit ac, fringilla sit amet eros. Quisque sed hendrerit sem, vitae tempus tortor. Praesent lacus eros, sagittis vel vestibulum et, sagittis vitae ipsum. Vestibulum at fermentum nisl. Proin lacus lorem, tincidunt vitae lobortis sed, egestas vel leo.\nAliquam placerat augue at fermentum semper. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Proin mollis porta sodales. Nunc tempor diam vitae diam vestibulum imperdiet. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Aliquam nisl orci, fermentum non metus et, tincidunt scelerisque risus. Pellentesque non aliquam est. Etiam cursus nisl non enim lobortis, scelerisque interdum tortor luctus. Aliquam consequat, risus at bibendum mollis, justo lorem egestas mauris, mollis lobortis justo sapien sit amet eros.\nAenean ultricies eros velit, sed eleifend neque pellentesque at. Proin suscipit, lacus quis dapibus consectetur, dui mauris hendrerit dui, ut auctor nunc risus in odio. Donec nunc neque, hendrerit vitae cursus auctor, rutrum ut sem. Donec egestas, nunc et rhoncus aliquam, diam libero malesuada eros, ac consectetur ipsum velit id massa. Integer tristique porttitor tempus. Integer dictum accumsan lacus id faucibus. Donec sed ipsum non mauris tincidunt dictum. Nulla bibendum dignissim justo non tempus. Mauris suscipit dui nec nibh faucibus aliquet. Nulla orci libero, tincidunt et consectetur fringilla, accumsan ac dolor. Ut semper odio eros, non consectetur lacus aliquam quis. Morbi in arcu interdum, convallis nisi nec, pharetra dui.\nNam placerat fringilla malesuada. Pellentesque ac quam ullamcorper, porta neque in, hendrerit mi. Sed egestas neque mollis, feugiat erat et, posuere dolor. Donec ex lacus, consequat a purus at, laoreet convallis diam. Maecenas laoreet eget velit sit amet faucibus. Nulla orci velit, commodo nec feugiat nec, blandit eget elit. Nulla sit amet elit a tellus consectetur aliquam eget sit amet arcu. Duis ac leo interdum, volutpat massa eget, viverra nunc. Cras mollis suscipit porta. Curabitur congue vitae felis quis vulputate. Pellentesque porta dolor magna, quis molestie enim elementum at. Aliquam rhoncus convallis sapien, sit amet feugiat lorem.\nNulla fermentum nisi enim, quis dictum tellus condimentum congue. Fusce vel metus leo. Curabitur vel lectus gravida, volutpat dui non, pharetra tortor. Nunc vel rhoncus ex. Praesent mattis quam nec feugiat suscipit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed justo ligula, euismod quis neque non, malesuada viverra massa. Proin at augue tortor. Pellentesque in ipsum fringilla, commodo leo et, gravida ipsum. Praesent facilisis arcu eu suscipit imperdiet. Interdum et malesuada fames ac ante ipsum primis in faucibus. Aenean quis ante est. Suspendisse vel est lorem.\nSuspendisse vitae egestas lectus. Suspendisse libero sem, tristique sit amet augue sit amet, rutrum dignissim libero. Pellentesque eget metus neque. Maecenas lectus orci, gravida id ultricies vitae, vestibulum vel metus. Pellentesque id scelerisque orci, id viverra ipsum. Vestibulum vitae interdum dolor. Maecenas maximus felis eget massa feugiat, quis feugiat est finibus. Suspendisse suscipit dui mollis semper dignissim. Donec at est sed sem vestibulum efficitur id sed risus.\n${"Etiam vel ante nisi. Donec tincidunt, dui quis porttitor semper, purus mi sodales orci, cursus ullamcorper velit mauris a diam. Integer malesuada nibh quis tortor ultricies, scelerisque maximus nulla aliquam. Aenean vitae lorem nunc. Sed eu arcu consequat, elementum odio sed, posuere odio. Praesent metus urna, vulputate id ligula sit amet, congue porta odio. Aliquam erat volutpat. Duis augue magna, vestibulum eget elementum nec, feugiat sed justo. Fusce cursus mauris dolor. Donec hendrerit, nisl eget vestibulum congue, odio erat convallis ligula, a euismod libero ante in enim. Nam fermentum imperdiet lobortis. Donec varius augue.\n".split(" ").getRange(0, words).join(" ")}";
}
