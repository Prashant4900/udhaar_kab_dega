import 'package:flutter/material.dart';
import 'package:udhaar_kab_dega/constants/common.dart';
import 'package:udhaar_kab_dega/l10n/l10n.dart';
import 'package:udhaar_kab_dega/theme/theme_manager.dart';
import 'package:udhaar_kab_dega/views/components/buttons.dart';
import 'package:udhaar_kab_dega/views/components/language_card.dart';

final languageCard = [
  {
    'index': 0,
    'name': 'हिंदी',
    'title': 'अ',
    'color': const Color(0xFFFDA403),
  },
  {
    'index': 1,
    'name': 'English',
    'title': 'A',
    'color': const Color(0xFFA8CD9F),
  },
];

class MyLanguageScreen extends StatefulWidget {
  const MyLanguageScreen({super.key});

  @override
  State<MyLanguageScreen> createState() => _MyLanguageScreenState();
}

class _MyLanguageScreenState extends State<MyLanguageScreen> {
  int _languageIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: allPadding16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.local.chooseLanguage,
                style: context.headlineTextStyle(),
              ),
              verticalMargin16,
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: languageCard.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return LanguageCard(
                    isSelected: _languageIndex == index,
                    name: languageCard[index]['name']! as String,
                    title: languageCard[index]['title']! as String,
                    color: languageCard[index]['color']! as Color,
                    onTap: () {
                      setState(() {
                        if (_languageIndex == index) {
                          _languageIndex = -1;
                        } else {
                          _languageIndex = index;
                        }
                      });
                    },
                  );
                },
              ),
              const Spacer(),
              CustomButton(
                label: 'Submit',
                onTap: _languageIndex == -1
                    ? null
                    : () {
                        switch (_languageIndex) {
                          case 0:
                            //TODO: Set Hindi as a default language
                            break;

                          case 1:
                            //TODO: Set English as a default language
                            break;
                        }
                      },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
