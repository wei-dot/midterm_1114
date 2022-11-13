import 'package:flutter/material.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Midterm App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.grey,
        scaffoldBackgroundColor: const Color(0xFFD8D8D8),
      ),
      home: const MyHomePage(title: '期中實作'),
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
  final List<String> imgUrl = [
    'https://truth.bahamut.com.tw/s01/202203/332a033ace292f586d829746954de29f.JPG',
    'https://megapx.dcard.tw/v1/images/4feeea03-5b42-4b95-bdd6-a6798b0813c0/responsive?width=640',
    'https://megapx.dcard.tw/v1/images/5a82dee3-690c-470f-8057-575391afc169/responsive?width=640',
    'https://megapx.dcard.tw/v1/images/daeb3e12-75f4-4884-9996-6677a24285cb/responsive?width=640'
  ];
  final _imgList = [
    Image.network(
        'https://truth.bahamut.com.tw/s01/202203/332a033ace292f586d829746954de29f.JPG'),
    Image.network(
        'https://megapx.dcard.tw/v1/images/4feeea03-5b42-4b95-bdd6-a6798b0813c0/responsive?width=640'),
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
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            height: 30,
          ),
          NeumorphicText(
            '這是第${index + 1}張圖片',
            style: const NeumorphicStyle(
              color:  Colors.black26,
              depth: 4,
              lightSource: LightSource.topLeft,
            ),
            textStyle: NeumorphicTextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          GestureDetector(
            onTap: () {
              final snackBar = SnackBar(
                /// need to set following properties for best effect of awesome_snackbar_content
                elevation: 0,
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.transparent,
                content: AwesomeSnackbarContent(
                  title: '照片連結',
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
                  autoPlay: true,
                  enableInfiniteScroll: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
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
                        shape: NeumorphicShape.convex,
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(12)),
                        depth: 8,
                        color: const Color(0x4DD8D8D8),
                        lightSource: LightSource.topLeft,
                        intensity: 0.7,
                        surfaceIntensity: 0.3),
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      "上一頁",
                      style:
                          TextStyle(fontSize: 20, color: _textColor(context)),
                    )),
              ),
              Flexible(
                child: NeumorphicButton(
                    margin: const EdgeInsets.only(top: 12),
                    onPressed: () {
                      _controller.previousPage();
                    },
                    style: NeumorphicStyle(
                        shape: NeumorphicShape.convex,
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(8)),
                        depth: 8,
                        color: const Color(0x4DD8D8D8),
                        lightSource: LightSource.topLeft,
                        intensity: 0.7,
                        surfaceIntensity: 0.3),
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      "下一頁",
                      style:
                          TextStyle(fontSize: 20, color: _textColor(context)),
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
    return Colors.white;
  } else {
    return Colors.black;
  }
}
