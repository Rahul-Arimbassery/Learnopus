import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnopus/view/navigationpage/screen/navigation_view.dart';
import 'package:learnopus/view/services/screens/university/country.dart';
import 'package:learnopus/view/services/screens/university/universitydetails.dart';
import 'package:learnopus/viewmodel/database/fetchapi.dart';

String pickedcountry = 'India';

class UniversityPage extends StatelessWidget {
  const UniversityPage({super.key});

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
                      builder: (context) =>  const NavigationPage(),
                    ));
              },
              icon: const Icon(Icons.arrow_back),
            ),
            title: Text(
              'Universities in $pickedcountry',
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
                          builder: (context) => CountryPickerPage(),
                        ));
                  },
                  icon: const Icon(Icons.location_on_outlined)),
            ],
          ),
          backgroundColor: const Color.fromARGB(255, 234, 232, 232),
          body: FutureBuilder(
            future: fetchApi(pickedcountry),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return UniversityDetails(
                      path: 'assets/university.png',
                      text1: snapshot.data![index].name!,
                      text2: snapshot.data![index].country!,
                      text3: snapshot.data![index].webPages![0],
                      text4: snapshot.data?[index].stateProvince ?? 'State',
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
