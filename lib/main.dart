import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Widget example1 = SplashScreenView(
      duration: 3000,
      text: "Midterm Practice",
      textType: TextType.TyperAnimatedText,
      textStyle: const TextStyle(
        fontSize: 40.0,
      ),
      backgroundColor: Colors.white, navigateRoute: const MyHomePage(title: 'Midterm Practice'),
    );
    return NeumorphicApp(
      debugShowCheckedModeBanner: false,
      title: 'Midterm App',
      themeMode: ThemeMode.light,
      theme: const NeumorphicThemeData(
        baseColor: Color(0xFFD8D8D8),
        lightSource: LightSource.topLeft,
        depth: 10,
      ),
      darkTheme: const NeumorphicThemeData(
        baseColor: Color(0xFF3E3E3E),
        lightSource: LightSource.topLeft,
        depth: 6,
      ),
      home: example1,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 0;
  String mode = 'Dark Mode';
  final List<String> imgUrl = [
    'https://truth.bahamut.com.tw/s01/202203/332a033ace292f586d829746954de29f.JPG',
    'https://megapx-assets.dcard.tw/images/72652fe7-a112-4659-b0fc-ce2d4b8e29ea/1280.jpeg',
    'https://megapx.dcard.tw/v1/images/5a82dee3-690c-470f-8057-575391afc169/responsive?width=640',
    'https://megapx.dcard.tw/v1/images/daeb3e12-75f4-4884-9996-6677a24285cb/responsive?width=640'
  ];
  final _imgList = [
    Image.network(
        'https://truth.bahamut.com.tw/s01/202203/332a033ace292f586d829746954de29f.JPG'),
    Image.network(
        'https://megapx-assets.dcard.tw/images/72652fe7-a112-4659-b0fc-ce2d4b8e29ea/1280.jpeg'),
    Image.network(
        'https://megapx.dcard.tw/v1/images/5a82dee3-690c-470f-8057-575391afc169/responsive?width=640'),
    Image.network(
        'https://megapx.dcard.tw/v1/images/daeb3e12-75f4-4884-9996-6677a24285cb/responsive?width=640')
  ];
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: NeumorphicTheme.baseColor(context),
      appBar: NeumorphicAppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        centerTitle: true,
        title: NeumorphicText(
          widget.title,
          style: NeumorphicStyle(color: _textColor(context)),
          textStyle: NeumorphicTextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        color: NeumorphicTheme.baseColor(context),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          NeumorphicText(
            'This is  picture ${index + 1}',
            style: NeumorphicStyle(
              color: _textColor(context),
              shape: NeumorphicShape.flat,
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
              depth: 4,
              lightSource: LightSource.topLeft,
            ),
            textStyle: NeumorphicTextStyle(
              fontSize: 30,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              final snackBar = SnackBar(
                /// need to set following properties for best effect of awesome_snackbar_content
                elevation: 0,
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.transparent,
                content: AwesomeSnackbarContent(
                  title: 'Picture SourceLink',
                  message: imgUrl[index],

                  /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                  contentType: ContentType.success,
                ),
              );

              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(snackBar);
            },
            child: CarouselSlider(
              items: _imgList,
              options: CarouselOptions(
                  enlargeCenterPage: true,
                  height: 300,
                  initialPage: 0,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      this.index = index;
                    });
                  }),
              carouselController: _controller,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Flexible(
                child: NeumorphicButton(
                    margin: const EdgeInsets.only(top: 12),
                    onPressed: () {
                      _controller.previousPage();
                    },
                    style: NeumorphicStyle(
                      shape: NeumorphicShape.flat,
                      boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(8)),
                      depth: 7,
                      intensity: 0.5,
                      lightSource: LightSource.topLeft,
                    ),
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      "Previous",
                      style:
                          TextStyle(color: _textColor(context), fontSize: 20),
                    )),
              ),
              Flexible(
                child: NeumorphicButton(
                    margin: const EdgeInsets.only(top: 12),
                    onPressed: () {
                      // NeumorphicTheme.of(context)?.themeMode
                      if (NeumorphicTheme.isUsingDark(context)) {
                        NeumorphicTheme.of(context)?.themeMode =
                            ThemeMode.light;
                        mode = 'Dark Mode';
                      } else {
                        NeumorphicTheme.of(context)?.themeMode = ThemeMode.dark;
                        mode = 'Light Mode';
                      }
                    },
                    style: NeumorphicStyle(
                      shape: NeumorphicShape.flat,
                      boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(8)),
                      depth: 7,
                      intensity: 0.5,
                      lightSource: LightSource.topLeft,
                    ),
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      mode,
                      style:
                          TextStyle(color: _textColor(context), fontSize: 20),
                    )),
              ),
              Flexible(
                child: NeumorphicButton(
                    margin: const EdgeInsets.only(top: 12),
                    onPressed: () {
                      _controller.nextPage();
                    },
                    style: NeumorphicStyle(
                      shape: NeumorphicShape.flat,
                      boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(8)),
                      depth: 7,
                      lightSource: LightSource.topLeft,
                      intensity: 0.5,
                    ),
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      "Next",
                      style:
                          TextStyle(color: _textColor(context), fontSize: 20),
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }
}

Color _textColor(BuildContext context) {
  if (NeumorphicTheme.isUsingDark(context)) {
    return Colors.white54;
  } else {
    return Colors.black54;
  }
}
