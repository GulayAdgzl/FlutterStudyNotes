import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../202/package/launch_manager_trendyol.dart';

class TrendYou extends StatefulWidget {
  TrendYou({Key? key}) : super(key: key);

  @override
  State<TrendYou> createState() => _TrendYouState();
}

class _TrendYouState extends State<TrendYou>
    with TickerProviderStateMixin, LaunchMixinTrend {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsItems.orange,
        //Colors.orange[800]
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
          flex: 5,
          child: Stack(children: [
            Positioned.fill(
              bottom: 50,
              child: Container(
                //padding: EdgeInsets.only(right: 20),
                padding: ProjectPadding.pagePaddingRight,
                color: ColorsItems.orange,
                //Colors.orange[800],

                child: Image.asset(
                  ImageItems().trend,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
            Padding(
              //padding: EdgeInsets.only(top: 200),
              padding: ProjectPadding.pagePaddingTop,

              //burayı yeni yaptım

              child: Positioned(
                height: 150,
                bottom: 0,
                width: 500,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: SingleChildScrollView(
                    child: Column(children: [
                      //SizedBox(height: 60),
                      Padding(
                        /****** */
                        //padding: const EdgeInsets.all(10),
                        padding: ProjectPadding.pagePaddingAllq,

                        child: Container(
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.grey))),
                          child: _textEmail(),
                        ),
                      ),
                      Container(
                          //padding: EdgeInsets.all(10),
                          padding: ProjectPadding.pagePaddingAllq,
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                            color: ColorsItems.grey,
                            // Colors.grey
                          ))),
                          child: _textPassword()),

                      const SizedBox(
                        height: 15,
                      ),

                      TextButton(
                        onPressed: () {
                          launchURL('https://www.trendyol.com/sifremiunuttum');
                        },
                        child: Text(
                          ProjectKeys().SifremiUnuttum,
                          style: const TextStyle(
                            color: ColorsItems.orange,
                          ),
                          //Text kısmının clean code yap ve sağa götür
                        ),
                      ),

                      const SizedBox(
                        height: 5,
                      ),
                      _girisButton(),

                      _textGiris(),

                      Row(children: [
                        _appleTextButton(),
                        //2.kısım
                        _googleIconButton(),

                        //3.kısmı
                        _facebookIconButton(),
                      ]),

                      Row(children: [
                        Expanded(
                          child: Padding(
                            // padding: EdgeInsets.only(left: 60),
                            padding: ProjectPadding.pagePaddingLeft,

                            child: _textGirisUye(),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            // padding: const EdgeInsets.only(left: 10),
                            padding: ProjectPadding.pagePaddingLeft10,
                            child: _textUyeOl(),
                          ),
                        ),
                      ]),
                    ]),
                  ),
                ),
              ),
            )
          ]),
        ),
      ]),
    );

    //Expanded(flex: 8, child: Container(color: Colors.white));
  }

  TextButton _textUyeOl() {
    return TextButton(
      onPressed: () {},
      child: Text(
        ProjectKeys().GirisUyeOl,
        style: const TextStyle(
          color: Colors.orange,
        ),
        //Text kısmının clean code yap ve sağa götür
      ),
    );
  }

  Text _textGirisUye() {
    return Text(
      //Text kısmının clean code yap ve sağa götür
      ProjectKeys().GirisUye,
      style: const TextStyle(
        color: ColorsItems.grey,
      ),
    );
  }

  TextButton _facebookIconButton() {
    return TextButton(
      onPressed: () {
        launchURL('https://facebook.com/');
      },
      child: Container(
        height: 50,
        //margin: const EdgeInsets.all(10),

        child: Expanded(
          child: Row(
            children: [
              //Image.asset("assets/facebook.png"),
              Image.asset(ImageItems().facebook),
            ],
          ),
        ),
      ),
    );
  }

  _textEmail() {
    final TextEditingController _emailController = TextEditingController();
    return TextField(
      keyboardType: TextInputType.emailAddress,
      autofocus: true,
      autofillHints: const [AutofillHints.email],
      textInputAction: TextInputAction.next,
      decoration: _InputDecoration().emailInput,
      controller: _emailController,
    );
  }

  _textPassword() {
    final TextEditingController _passwordController = TextEditingController();
    return TextField(
      //keyboardType: TextInputType.password,
      keyboardType: TextInputType.text,
      obscureText: true,

      autofocus: true,
      autofillHints: const [AutofillHints.password],
      textInputAction: TextInputAction.next,
      decoration: _InputDecoration().passwodInput,
      controller: _passwordController,
    );
  }
}

TextButton _googleIconButton() {
  return TextButton(
    onPressed: () {
      try {
        launchUrl(Uri.parse(
            'https%3A%2F%2Fwww.trendyol.com%2Fsociallogin&response_type=token&client_id=48558991372-4r4qd9m2kerqnnu9d9jbiru1q4cj96ee.apps.googleusercontent.com&scope=https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fplus.login%20https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fplus.me%20https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fuserinfo.email%20https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fuserinfo.profile&state=typeId_2%2Ccb_%2F&flowName=GeneralOAuthFlow'));
      } catch (error) {
        print(error);
      }
    },
    child: Container(
      height: 50,
      //margin: const EdgeInsets.all(10),

      child: Expanded(
        child: Row(
          children: [
            //Image.asset("assets/g.png"),
            Image.asset(ImageItems().google),
          ],
        ),
      ),
    ),
  );
}

TextButton _appleTextButton() {
  return TextButton(
    onPressed: () {
      launchUrl(Uri.parse('https://appleid.apple.com/sign-in/'));
    },
    child: Container(
      height: 50,
      //margin: const EdgeInsets.all(20),
      margin: ProjectPadding.pagePaddingAll,

      // ignore: prefer_const_constructors

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
        color: Colors.black,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Row(
            children: [
              // Image.asset("assets/apple.png"),
              Image.asset(ImageItems().apple),
              Text(
                ProjectKeys().GirisApple,
                //style: color: Colors.white,
                //Image.asset("assets/apple.png"),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

class _textGiris extends StatelessWidget {
  const _textGiris({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      //Text kısmının clean code yap ve sağa götür
      ProjectKeys().GirisSec,
      style: ProjectStyle.Sec,
    );
  }
}

class _girisButton extends StatelessWidget {
  const _girisButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Container(
          height: 50,
          // margin: EdgeInsets.all(20),
          margin: ProjectPadding.pagePaddingAll,
          // ignore: prefer_const_constructors
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: ColorsItems.orange,
            // Colors.orange,
          ),
          child: Center(
            child: Text(
              ProjectKeys().GirisYap,
              style: ProjectStyle.Giris,
            ),
          )),
    );
  }
}

class ImageItems {
  final String trend = "assets/trendyol.png";
  final String apple = "assets/apple.png";
  final String facebook = "assets/facebook.png";
  final String google = "assets/g.png";
}

class ProjectPadding {
  static const pagePaddingRight = EdgeInsets.only(right: 10);

  static const pagePaddingTop = EdgeInsets.only(top: 200);

  static const pagePaddingAll = EdgeInsets.all(10);
  static const pagePaddingAllq = EdgeInsets.all(20);

  static const pagePaddingLeft = EdgeInsets.only(left: 60);

  static const pagePaddingLeft10 = EdgeInsets.only(left: 10);
}

class ColorsItems {
  static const Color orange = Color.fromRGBO(239, 108, 0, 1);
  static const Color grey = Color.fromARGB(255, 97, 95, 94);
  static const Color white = Color.fromARGB(255, 254, 252, 251);
}

class _InputDecoration {
  final emailInput = InputDecoration(
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
    hintText: 'E-posta',
    fillColor: Colors.white,
    filled: true,
  );

  final passwodInput = InputDecoration(
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
    hintText: 'Şifre',
    fillColor: ColorsItems.white,
    // Colors.white,

    filled: true,
  );
}

class ProjectKeys {
  final String SifremiUnuttum = "Şifremi Unuttum ";
  final String GirisYap = "Giriş Yap ";
  final String GirisSec = "Diğer Giriş Seçenekleri ";
  final String GirisApple = "Apple ile Giriş Yap";
  final String GirisUye = "Üye Değil misin?";
  final String GirisUyeOl = "Üye Ol";
}

class ProjectStyle {
  static TextStyle welcomeStyle = const TextStyle(
      wordSpacing: 2,
      decoration: TextDecoration.underline,
      fontStyle: FontStyle.italic,
      letterSpacing: 2,
      color: Colors.lime,
      fontSize: 16,
      fontWeight: FontWeight.w600);

  static TextStyle Giris =
      const TextStyle(color: ColorsItems.white, fontSize: 20);
  static TextStyle Sec =
      const TextStyle(color: Color.fromARGB(255, 143, 135, 135));
}
