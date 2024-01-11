import 'package:appdoa/api/data_model.dart';
import 'package:appdoa/screens/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../api/api_services.dart';

import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  Service serviceAPI = Service();
  late Future<List<DataDoa>> listData;

  @override
  void initState() {
    super.initState();
    listData = serviceAPI.getAllData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              "🤲 Do'a Lengkap",
              style: GoogleFonts.poppins(fontSize: 16, color: Colors.white),
            ),
          ],
        ),
        backgroundColor: Colors.lightBlue,
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          // Isi dari tab "Semua"
          FutureBuilder<List<DataDoa>>(
            future: listData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<DataDoa> isiData = snapshot.data!;
                return ListView.builder(
                  itemCount: isiData.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return DetailScreen(
                              data: isiData[index],
                            );
                          },
                        ));
                      },
                      title: Row(
                        children: [
                          Text(
                            "${index + 1}.",
                            style: GoogleFonts.poppins(color: Colors.grey),
                          ),
                          const SizedBox(width: 5),
                          Text(isiData[index].doa)
                        ],
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text("${snapshot.error}"),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),

          const AccordionPage()
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.lightBlue,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: GNav(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            activeColor: Colors.white,
            backgroundColor: Colors.lightBlue,
            tabBackgroundColor: Colors.white.withOpacity(.2),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            tabs: const [
              GButton(
                gap: 10,
                icon: Icons.home_outlined,
                text: "Semua",
                iconColor: Colors.white,
              ),
              // GButton(
              //   icon: Icons.search,
              //   text: "Cari Doa",
              //   iconColor: Colors.white,
              // ),
              GButton(
                gap: 10,
                icon: Icons.info_outline,
                text: "Tentang App",
                iconColor: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AccordionPage extends StatelessWidget {
  static const headerStyle = TextStyle(
    color: Color(0xffffffff),
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
  static const contentStyleHeader = TextStyle(
      color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.w700);
  static const contentStyle = TextStyle(
      color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.normal);
  static const informasi = 'Versi 1.0.0';
  // static const kebijakanPrivasi = 'Bacalah doa sebelum melakukan kegiatan';

  const AccordionPage({super.key});

  @override
  build(context) => Scaffold(
        body: Column(
          children: [
            Accordion(
              headerBackgroundColor: Colors.blue,
              headerBackgroundColorOpened: Colors.blue,
              contentBackgroundColor: Colors.white,
              contentBorderColor: Colors.blue,
              contentBorderWidth: 3,
              contentHorizontalPadding: 20,
              scaleWhenAnimating: true,
              openAndCloseAnimation: true,
              headerPadding:
                  const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
              sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
              sectionClosingHapticFeedback: SectionHapticFeedback.light,
              children: [
                AccordionSection(
                  isOpen: false,
                  contentVerticalPadding: 20,
                  leftIcon: const Icon(Icons.info_outline, color: Colors.white),
                  header: const Text('Informasi', style: headerStyle),
                  content: const Text(
                    informasi,
                    style: contentStyle,
                    textAlign: TextAlign.justify,
                  ),
                ),
                // AccordionSection(
                //   isOpen: false,
                //   contentVerticalPadding: 20,
                //   leftIcon: const Icon(Icons.privacy_tip_outlined,
                //       color: Colors.white),
                //   header: const Text('Kebijakan Privasi', style: headerStyle),
                //   content: const Text(kebijakanPrivasi, style: contentStyle),
                // ),
              ],
            ),
          ],
        ),
      );
} //__