import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnopus/model/rankingapi.dart';
import 'package:learnopus/view/navigationpage/screen/navigation_view.dart';
import 'package:learnopus/view/services/screens/ranking/rankingdetails.dart';
import 'package:learnopus/view/services/screens/university/country.dart';
import 'package:learnopus/view/services/screens/university/universitypage.dart';
import 'package:learnopus/viewmodel/database/fetchrankingapi.dart';

class RankingHomePage extends StatelessWidget {
  const RankingHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NavigationPage(),
                    ));
              },
              icon: const Icon(Icons.arrow_back),
            ),
            title: Text(
              'Ranking of universities',
              style: GoogleFonts.alkatra(
                textStyle: const TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 243, 239, 239),
                    fontWeight: FontWeight.bold),
              ),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CountryPickerPage(text:'rank'),
                        ));
                  },
                  icon: const Icon(Icons.location_on_outlined)),
            ],
          ),
          backgroundColor: const Color.fromARGB(255, 234, 232, 232),
          body: FutureBuilder<List<Fields>>(
            future: fetchRankingApi(pickedcountry),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return RankingDetails(
                      path: 'assets/university.png',
                      text1: snapshot.data![index].universityName!,
                      text2: snapshot.data![index].worldRank!,
                      text3: snapshot.data![index].nationalRank!,
                      text4: snapshot.data![index].country!,
                      text5: snapshot.data![index].iso2Code.toString(),
                    );
                  },
                  itemCount: snapshot.data!.length,
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 2,
                  ),
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
