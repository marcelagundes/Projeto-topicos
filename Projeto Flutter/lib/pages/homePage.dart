import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/colors.dart';
import '../utils/menu.dart';
import 'package:lottie/lottie.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  static final String title = 'Catalogação de Plantas';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.green),
        home: MainPage(),
      );
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuWidget(),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Minhas Plantas'),
        centerTitle: true,
      ),
      backgroundColor: white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(10),
          scrollDirection: Axis.vertical,
          children: [
            Text(
              "Bem - vindos amantes das plantas!!!",
              style: GoogleFonts.montserrat(
                color: black,
                fontSize: 30,
                letterSpacing: 1,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              "Não se esqueça de cuidar de suas plantas. Vamos ajudar a cuidar da sua linda planta e todo o seu jardim.",
              textAlign: TextAlign.left,
              style: GoogleFonts.montserrat(
                color: black,
                fontSize: 20,
                letterSpacing: 1,
                fontWeight: FontWeight.w400,
              ),
            ),
            Lottie.network(
              'https://assets6.lottiefiles.com/private_files/lf30_scwwemah.json',
              fit: BoxFit.scaleDown,
              filterQuality: FilterQuality.high,
              frameRate: FrameRate(10),
              repeat: true,
              animate: true,
              alignment: Alignment.topCenter,
            ),
          ],
        ),
      ),
    );
  }
}
