import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/h%20(2).dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:movie_app/home/categorie.dart';
import 'package:movie_app/home/movie_into.dart';
import 'package:movie_app/home/wishlist.dart';
import 'package:movie_app/profile/profile.dart';
import 'package:movie_app/search/search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with ScreenSizeUtil {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    HomePageContent(),
    const SearchPage(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1F1D2B),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: const Color(0xff92929D),
        fixedColor: const Color(0xff12CDD9),
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xff1F1D2B),
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(
            () {
              _currentIndex = index;
            },
          );
        },
        items: const [
          BottomNavigationBarItem(
            label: 'Главная',
            icon: Icon(
              Icons.home,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Поиск',
            icon: Icon(
              Icons.search,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Профиль',
            icon: Icon(
              Icons.person_4_outlined,
            ),
          ),
        ],
      ),
    );
  }
}

class HomePageContent extends StatelessWidget with ScreenSizeUtil {
  final List<Map<String, String>> movies = [
    {
      'ImageName': 'assets/images/most.png',
      'Moviename': 'Spider-Man No Way Home'
    },
    {'ImageName': 'assets/images/most.png', 'Moviename': 'Moviklnkne 2'},
    {'ImageName': 'assets/images/most.png', 'Moviename': 'Movicdscde 3'},
    {'ImageName': 'assets/images/most.png', 'Moviename': 'Movicdscde 3'},
    {'ImageName': 'assets/images/most.png', 'Moviename': 'Movicdscde 3'},
    {'ImageName': 'assets/images/most.png', 'Moviename': 'Movicdscde 3'}
  ];
  // String? name ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1F1D2B),
      body: Padding(
        padding: const EdgeInsets.symmetric()
            .copyWith(top: getHeight(context) * 0.01),
        child: ListView(
          children: [
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: getWidth(context) * 0.06),
              child: Row(
                children: [
                  SizedBox(
                    width: getWidth(context) * 0.032,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        textAlign: TextAlign.start,
                        'Добро пожаловать',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Давайте посмотрим ваш любимый фильм',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Wishlist(),
                        ),
                      );
                    },
                    icon: SvgPicture.asset(
                      'assets/icons/like.svg',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getHeight(context) * 0.039,
            ),
            // const SearchWidget(),
            const PageViewImage(),
            const CategoryWidget(),
          ],
        ),
      ),
    );
  }
}

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    Container(
      color: Colors.white,
    ),
    Container(
      color: Colors.white,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar Sample'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Поиск',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Профиль',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

class PageViewImage extends StatefulWidget {
  const PageViewImage({
    super.key,
  });

  @override
  State<PageViewImage> createState() => _PageViewImageState();
}

class _PageViewImageState extends State<PageViewImage> with ScreenSizeUtil {
  int _currentImageIndex = 0;
  final List _images = [
    'assets/images/orgimchak.png', //https://www.youtube.com/watch?v=dDF0afG6Vvk /Человек паук Лотос 2023
    'assets/images/moviy_q.jpg', //https://youtu.be/1x6nMFHTKDg?si=dsRU3pP5Ru6pOVsI Moviy qo'ng'iz
    'assets/images/viking.jpg', //https://youtu.be/nBVq39TMzXY?si=6mK0nUV_kXsbMjFp Викинги 2024
    'assets/images/zateryanniy.jpg', //https://youtu.be/mJ4zEX0M1o4?si=HaIbrzw_5nHR_jDG Затерянный мир
    'assets/images/peregovorshik.png', //https://youtu.be/lUsqCOusCJI?si=Csa_rPUfeHKJ5pe0  Переговорщик
    'assets/images/wakanda.jpg', //https://youtu.be/n3qeyZJE1i0?si=gaAPW0P5AsvSjpAw Black Panther
  ];
  final List _names = [
    'Человек паук Лотос 2023',
    'Moviy qo\'ng\'iz',
    'Викинги 2024',
    'Затерянный мир',
    'Переговорщик',
    'Black Panther',
  ];
  final List descriptions = [
    '«Человек-паук: Лотос» — американский независимый супергеройский драматичный фанатский фильм 2023 года, продюсера, режиссёра и соавтора сценария Гэвина Дж. Конопа. В фильме снимались Уорден Уэйн в роли Питера Паркера, Шон Томас Рид в роли Гарри Озборна и Мориа Бруклин в роли Мэри Джейн Уотсон.',
    'From Warner Bros. Pictures comes the feature film “Blue Beetle,” marking the DC Super Hero\'s first time on the big screen. The film, directed by Angel Manuel Soto, stars Xolo Maridueña in the title role as well as his alter ego, Jaime Reyes. Recent college grad Jaime Reyes returns home full of aspirations for his future, only to find that home is not quite as he left it.',
    'Преследуемые и находящиеся в бегах, наши легендарные герои-викинги вынуждены испытывать свои амбиции и храбрость в мирах за фьордами Скандинавии.',
    'Враги — старые и новые — ждут Фрейдис, Лейфа и Харальда, когда они рассеются по дальним уголкам земного шара в погоне за силой и новыми мирами, которые нужно завоевать.',
    '',
    '',
  ];
  final List movieVideo = [
    'eX6azCblKPc',
    'kQiyZXeFvpM',
    'nBVq39TMzXY',
    'mJ4zEX0M1o4',
    'hhVpVqtcnH8',
    'hhVpVqtcnH8',
  ];
  final List _time = [
    '120',
    '127',
    '115',
    '90',
    '120',
    '127',
  ];
  final List _year = [
    '2023',
    '2023',
    '2024',
    '2024',
    '2024',
    '2024',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: _images.length,
          itemBuilder: (BuildContext context, int index, int realIndex) {
            final String name = _names[index];
            final String imagePath = _images[index];
            final String _desc = descriptions[index];
            final String _url = movieVideo[index];
            final String _vaqt = _time[index];
            final String yil = _year[index];
            return Stack(
              children: [
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Image.asset(
                    imagePath,
                  ),
                ),
                Positioned(
                  bottom: getHeight(context) * 0.02,
                  left: getWidth(context) * 0.055,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MovieIntoWidget(
                          name: name,
                          description: _desc,
                          video: _url,
                          image: imagePath,
                          time: _vaqt,
                          year: yil,
                        ),
                      ),
                    );
                  },
                ),
              ],
            );
          },
          options: CarouselOptions(
            aspectRatio: 16 / 7,
            autoPlay: true,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(
                () {
                  _currentImageIndex = index;
                },
              );
              // Можно добавить дополнительную логику, если нужно
            },
          ),
        ),
        DotsIndicator(
          mainAxisAlignment: MainAxisAlignment.center,
          dotsCount: _images.length,
          position: _currentImageIndex,
          decorator: DotsDecorator(
            color: const Color.fromARGB(
                255, 176, 239, 244), // Цвет неактивных точек
            activeColor: const Color(0xff12CDD9), // Цвет активной точки
            size: const Size.square(10),
            activeSize: const Size(30, 10),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
      ],
    );
  }
}
