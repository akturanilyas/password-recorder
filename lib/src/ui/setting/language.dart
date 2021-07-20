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
  @override
  Widget build(BuildContext context) {
    ScrollController languageController = ScrollController();
    return Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).selectLanguage),
        ),
        body: newMethod(languageController, languageController));
  }

  ClickableListWheelScrollView newMethod(
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
    const double _itemHeight = 60;
    const int _itemCount = 100;

    return ClickableListWheelScrollView(
      scrollController: _scrollController,
      itemHeight: _itemHeight,
      itemCount: _itemCount,
      onItemTapCallback: (index) {
        // ignore: avoid_print
      },
      child: ListWheelScrollView.useDelegate(
        controller: _scrollController,
        itemExtent: _itemHeight,
        physics: FixedExtentScrollPhysics(),
        overAndUnderCenterOpacity: 0.5,
        perspective: 0.002,
        onSelectedItemChanged: (index) {
          preferences.changeLocale(languageConstant[index].shortName);
        },
        childDelegate: ListWheelChildBuilderDelegate(
          builder: (context, index) => _child(languageConstant[index]),
          childCount: languageConstant.length,
        ),
      ),
    );
  }

  Widget _child(LanguageModel language) {
    return SizedBox(
      height: 30,
      child: ListTile(
        title: Text(language.name),
        leading: CircleAvatar(child: Text(language.shortName)),
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
