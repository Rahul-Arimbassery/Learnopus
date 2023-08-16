import 'package:flutter/material.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:learnopus/view/services/screens/ranking/rankinghomepage.dart';
import 'package:learnopus/view/services/screens/university/universitypage.dart';

class CountryPickerPage extends StatelessWidget {
  final String text;
  const CountryPickerPage({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return CountryListPick(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Select Country'),
      ),
      // Uncomment the following section to customize the picker appearance
      /*
      pickerBuilder: (context, CountryCode countryCode) {
        return Row(
          children: [
            Image.asset(
              countryCode.flagUri,
              package: 'country_list_pick',
            ),
            Text(countryCode.code),
            Text(countryCode.dialCode),
          ],
        );
      },
      */
      // To disable options, set to false
      theme: CountryTheme(
        isShowFlag: true,
        isShowTitle: true,
        isShowCode: true,
        isDownIcon: true,
        showEnglishName: true,
      ),
      // Set default value
      initialSelection: '+91', // or initialSelection: 'US'
      onChanged: (CountryCode? code) {
        pickedcountry = code!.name!;
        //if (text == 'university') {
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => const UniversityPage(),
        //     ));
        //}
        if (text == 'rank') {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const RankingHomePage(),
              ));
        } else {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const UniversityPage(),
              ));
        }

        // print(code!.name);
        // print(code.code);
        // print(code.dialCode);
        // print(code.flagUri);
      },
      // Whether to allow the widget to set a custom UI overlay
      useUiOverlay: true,
      // Whether the country list should be wrapped in a SafeArea
      useSafeArea: false,
    );
  }
}
