import 'package:appdoa/api/data_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.data});
  final DataDoa data;

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          "Back",
          style: GoogleFonts.poppins(color: Colors.white, fontSize: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Text(
              data.doa,
              style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              data.ayat,
              style:
                  GoogleFonts.notoSansArabic(color: Colors.black, fontSize: 20),
              textAlign: TextAlign.right,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Latin: \n${data.latin}',
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 15,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Artinya: \n${data.artinya}',
              style: GoogleFonts.poppins(
                  color: Colors.grey,
                  fontSize: 15,
                  fontStyle: FontStyle.italic),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}
