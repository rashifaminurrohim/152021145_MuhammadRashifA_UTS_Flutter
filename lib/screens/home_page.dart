import 'package:flutter/material.dart';
import 'package:login_signup/screens/bmi/bmi.dart';
import 'package:login_signup/screens/calculator/calculator.dart';

import 'package:login_signup/screens/info_page.dart';
import 'package:login_signup/screens/profile.dart';
import 'package:login_signup/screens/welcome_screen.dart';

import 'package:login_signup/widgets/bottom_nav_bar.dart';
import 'package:flutter/cupertino.dart';
// Ganti dengan path yang benar ke file bottomNav

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController _pageController = PageController();
  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _pageIndex = index;
          });
        },
        children: [
          ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(50),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 50),
                    ListTile(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 30),
                      title: Text('Hello Rashif!',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(color: Colors.white)),
                      subtitle: Text('Good Morning',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(color: Colors.white54)),
                      trailing: const CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/images/user.JPG'),
                      ),
                    ),
                    const SizedBox(height: 30)
                  ],
                ),
              ),
              Container(
                color: Theme.of(context).primaryColor,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(200))),
                  child: GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 40,
                    mainAxisSpacing: 30,
                    children: [
                      itemDashboard(
                          'BMI', 'assets/images/bmi.png', Colors.blue, 0),
                      itemDashboard('Audience', 'assets/images/calculator.png',
                          Colors.blue, 1),
                      itemDashboard('Comments',
                          'assets/images/exchange-rate.png', Colors.blue, 2),
                      itemDashboard(
                          'Revenue', 'assets/images/grade.png', Colors.blue, 4),
                      itemDashboard('Contact',
                          'assets/images/driver-license.png', Colors.blue, 7),
                      itemDashboard('Calculator',
                          'assets/images/centigrade.png', Colors.blue, 3),
                      itemDashboard('Upload',
                          'assets/images/driver-license.png', Colors.blue, 5),
                      itemDashboard(
                          'About', 'assets/images/bmi.png', Colors.blue, 6),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20)
            ],
          ),
          // Tambahkan halaman-halaman Anda di sini
          Profile(), // Contoh halaman 2
          const infoPage(), // Contoh halaman 3
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: bottomNav(
          currentIndex: _pageIndex,
          onTap: (index) {
            _pageController.animateToPage(index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease);
            if (index == 3) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Keluar dari aplikasi?"),
                    content: Text("klik no untuk membatalkan"),
                    actions: <Widget>[
                      TextButton(
                        child: Text("Yes"),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WelcomeScreen(),
                            ),
                          );
                        },
                      ),
                      TextButton(
                        child: Text("No"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            }
          },
        ), // Tambahkan bottomNav di sini
      ),
    );
  }

  itemDashboard(String title, String imagePath, Color background, int index) =>
      GestureDetector(
        onTap: () {
          // Tambahkan fungsi navigasi ke halaman baru dengan menggunakan nilai indeks
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        bmi()), // Ganti VideosPage() dengan halaman yang sesuai
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        calculator()), // Ganti AnalyticsPage() dengan halaman yang sesuai
              );
              break;

            // Tambahkan kasus lain sesuai kebutuhan
          }
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 5),
                    color: Theme.of(context).primaryColor.withOpacity(.2),
                    spreadRadius: 2,
                    blurRadius: 5)
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: background,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  imagePath, // Ubah ini menjadi path dari gambar yang ingin Anda tampilkan
                  width: 64, // Sesuaikan ukuran gambar sesuai kebutuhan
                  height: 64,
                  // Tambahkan jika perlu
                ),
                //     child: Icon(iconData, color: Colors.white)),
                // const SizedBox(height: 8),
                // Text(title.toUpperCase(),
                //     style: Theme.of(context).textTheme.headline6
              ),
            ],
          ),
        ),
      );
}
