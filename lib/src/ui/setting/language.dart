import 'package:clickable_list_wheel_view/clickable_list_wheel_widget.dart';
import 'package:flutter/material.dart';
import 'package:password_saver/generated/l10n.dart';
import 'package:password_saver/src/constant/language.dart';
import 'package:password_saver/src/model/language_model.dart';
import 'package:password_saver/src/provider/preferences_provider.dart';
import 'package:provider/provider.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({Key? key}) : super(key: key);

  static const String path = '/language';
  @override
  _LanguagePageState createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  ScrollController languageController = ScrollController();

  @override
  void dispose() {
    languageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme =
        Provider.of<PreferencesProvider>(context, listen: true).getTheme();
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            S.of(context).selectLanguage,
            style: theme.textTheme.bodyText1,
          ),
        ),
        body: selectLanguageWidget(languageController, languageController));
  }

  ClickableListWheelScrollView selectLanguageWidget(
    ScrollController languageController,
    ScrollController scrollController,
  ) {
    final preferences = Provider.of<PreferencesProvider>(context, listen: true);
    List<LanguageModel> languageConstant = [
      LanguageConstant.tr,
      LanguageConstant.en,
      LanguageConstant.fr
    ];

    final _scrollController = FixedExtentScrollController(
        initialItem: getLanguageIndex(languageConstant, preferences.lang));

    return ClickableListWheelScrollView(
      scrollController: _scrollController,
      itemHeight: 60,
      itemCount: languageConstant.length,
      onItemTapCallback: (index) {},
      child: ListWheelScrollView.useDelegate(
        controller: _scrollController,
        itemExtent: 60,
        physics: FixedExtentScrollPhysics(),
        // overAndUnderCenterOpacity: 0.5,
        perspective: 0.002,
        onSelectedItemChanged: (index) {
          preferences.changeLocale(languageConstant[index].shortName);
          preferences.setSelectedIndex(index);
        },
        childDelegate: ListWheelChildBuilderDelegate(
          builder: (context, index) => _child(languageConstant[index],
              preferences.selectedIndex == index ? true : false),
          childCount: languageConstant.length,
        ),
      ),
    );
  }

  Widget _child(LanguageModel language, bool isSelected) {
    return SizedBox(
      height: 30,
      child: Card(
        color: isSelected ? Colors.red : null,
        child: ListTile(
          title: Text(
            language.name,
            style: TextStyle(color: Color(0xffDBE9F7)),
          ),
          leading: CircleAvatar(
            backgroundColor: Color(0xffB5BFD3),
            child: Text(
              language.shortName,
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }

  int getLanguageIndex(List<LanguageModel> languageConstant, String lang) {
    int index = 0;

    for (final LanguageModel language in languageConstant) {
      if (language.shortName == lang) {
        index = languageConstant.indexOf(language);
      }
    }

    return index;
  }
}
