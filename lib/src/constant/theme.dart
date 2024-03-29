import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    visualDensity: VisualDensity(vertical: 0.5, horizontal: 0.5),
    primarySwatch: MaterialColor(
      0xFFF5E0C3,
      <int, Color>{
        50: Color(0x1aF5E0C3),
        100: Color(0xa1F5E0C3),
        200: Color(0xaaF5E0C3),
        300: Color(0xafF5E0C3),
        400: Color(0xffF5E0C3),
        500: Color(0xffEDD5B3),
        600: Color(0xffDEC29B),
        700: Color(0xffC9A87C),
        800: Color(0xffB28E5E),
        900: Color(0xff936F3E)
      },
    ),
    fontFamily: 'Georgia',
    primaryColor: Color(0xffDBE9F7),
    primaryColorBrightness: Brightness.light,
    primaryColorLight: Color(0x1aF5E0C3),
    primaryColorDark: Color(0xff936F3E),
    canvasColor: Color(0xff515BB2),
    accentColor: Color(0xff457BE0),
    accentColorBrightness: Brightness.light,
    scaffoldBackgroundColor: Color(0xffDBE9F7),
    bottomAppBarColor: Color(0xff6D42CE),
    cardColor: Color(0xff515BB2),
    dividerColor: Color(0x1f6D42CE),
    focusColor: Color(0x1A04CA35),
    hoverColor: Color(0xFF67E711),
    highlightColor: Color(0xFF2532E9),
    splashColor: Color(0xff457BE0),
//  splashFactory: # override create method from  InteractiveInkFeatureFactory
    selectedRowColor: Colors.grey,
    unselectedWidgetColor: Colors.grey.shade400,
    disabledColor: Colors.grey.shade200,
    buttonTheme: ButtonThemeData(
        // buttonColor: Colors.red,

        //button themes
        ),
    toggleButtonsTheme: ToggleButtonsThemeData(
        //toggle button theme
        ),
    // buttonColor: Color(0xff936F3E),
    // secondaryHeaderColor: Colors.grey,
    // backgroundColor: Color(0xff457BE0),
    dialogBackgroundColor: Color(0xff515BB2),
    // indicatorColor: Color(0xff457BE0),
    // hintColor: Colors.grey,
    errorColor: Colors.red[800],
    // toggleableActiveColor: Color(0xff6D42CE),
    textTheme: TextTheme(
        bodyText1: TextStyle(
          fontSize: 18,
          color: Color(0xffDBE9F7),
        ),
        bodyText2: TextStyle(
          color: Color(0xffDBE9F7),
        ),
        headline1: TextStyle(color: Color(0xff515BB2))
        //text themes that contrast with card and canvas
        ),
    // primaryTextTheme: TextTheme(
    //     //text theme that contrast with primary color
    //     ),
    // accentTextTheme: TextTheme(
    //     //text theme that contrast with accent Color
    //     ),
    // inputDecorationTheme: InputDecorationTheme(
    //     // default values for InputDecorator, TextField, and TextFormField
    //     ),
    // iconTheme: IconThemeData(
    //     //icon themes that contrast with card and canvas
    //     ),
    // primaryIconTheme: IconThemeData(
    //     //icon themes that contrast primary color
    //     ),
    // accentIconTheme: IconThemeData(
    //     //icon themes that contrast accent color
    //     ),
    // sliderTheme: SliderThemeData(
    //     // slider themes
    //     ),
    // tabBarTheme: TabBarTheme(
    //     // tab bat theme
    //     ),
    // tooltipTheme: TooltipThemeData(
    //     // tool tip theme
    //     ),
    // cardTheme: CardTheme(

    //     // card theme
    //     ),
    // chipTheme: ChipThemeData(
    //     backgroundColor: Color(0xff936F3E),
    //     disabledColor: Color(0xaaF5E0C3),
    //     shape: StadiumBorder(),
    //     brightness: Brightness.light,
    //     labelPadding: EdgeInsets.all(8),
    //     labelStyle: TextStyle(),
    //     padding: EdgeInsets.all(8),
    //     secondaryLabelStyle: TextStyle(),
    //     secondarySelectedColor: Colors.white38,
    //     selectedColor: Colors.white
    //     // chip theme
    //     ),
    // platform: TargetPlatform.android,
    // materialTapTargetSize: MaterialTapTargetSize.padded,
    // applyElevationOverlayColor: true,
    // pageTransitionsTheme: PageTransitionsTheme(
    //     //page transition theme
    //     ),
    appBarTheme: AppBarTheme(
        color: Color(0xff515BB2),
        actionsIconTheme: IconThemeData(color: Color(0xffDBE9F7)),
        textTheme: TextTheme(bodyText1: TextStyle(color: Color(0xffDBE9F7))),
        iconTheme: IconThemeData(color: Color(0xffDBE9F7))
        //app bar theme
        ),
    // bottomAppBarTheme: BottomAppBarTheme(
    //     // bottom app bar theme
    //     ),

    colorScheme: ColorScheme(
        primary: Color(0xff515BB2),
        primaryVariant: Color(0x1AC9811D),
        secondary: Color(0xffDBE9F7),
        secondaryVariant: Color(0xaaC9A87C),
        brightness: Brightness.light,
        background: Color(0xffB5BFD3),
        error: Colors.red,
        onBackground: Color(0xffB5BFD3),
        onError: Colors.red,
        onPrimary: Color(0xffEDD5B3),
        onSecondary: Color(0xffC9A87C),
        onSurface: Color(0xff457BE0),
        surface: Color(0xff457BE0)),

    // snackBarTheme: SnackBarThemeData(
    //     // snack bar theme
    //     ),
    dialogTheme: DialogTheme(
      contentTextStyle: TextStyle(
        color: Color(0xFF0A4DD1),
      ),
      titleTextStyle: TextStyle(
        fontSize: 26,
        color: Color(0xffDBE9F7),
      ),

      // dialog theme
    ),
    // floatingActionButtonTheme: FloatingActionButtonThemeData(
    //     // floating action button theme
    //     ),
    // navigationRailTheme: NavigationRailThemeData(
    //     // navigation rail theme
    //     ),
    // typography: Typography.material2018(),

    cupertinoOverrideTheme: CupertinoThemeData(
        primaryColor: Colors.red,
        barBackgroundColor: Colors.red,
        primaryContrastingColor: Colors.red

        //cupertino theme
        ),
    // bottomSheetTheme: BottomSheetThemeData(
    //     //bottom sheet theme
    //     ),
    // popupMenuTheme: PopupMenuThemeData(
    //     //pop menu theme
    //     ),
    // bannerTheme: MaterialBannerThemeData(
    //     // material banner theme
    //     ),
    // dividerTheme: DividerThemeData(
    //     //divider, vertical divider theme
    //     ),
    // buttonBarTheme: ButtonBarThemeData(
    //     // button bar theme
    //     ),
    // splashFactory: InkSplash.splashFactory,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.light,
    visualDensity: VisualDensity(vertical: 0.5, horizontal: 0.5),
    primarySwatch: MaterialColor(
      0xFFF5E0C3,
      <int, Color>{
        50: Color(0x1aF5E0C3),
        100: Color(0xa1F5E0C3),
        200: Color(0xaaF5E0C3),
        300: Color(0xafF5E0C3),
        400: Color(0xffF5E0C3),
        500: Color(0xffEDD5B3),
        600: Color(0xffDEC29B),
        700: Color(0xffC9A87C),
        800: Color(0xffB28E5E),
        900: Color(0xff936F3E)
      },
    ),
    fontFamily: 'Georgia',
    primaryColor: Color(0xffDBE9F7),
    primaryColorBrightness: Brightness.light,
    primaryColorLight: Color(0x1aF5E0C3),
    primaryColorDark: Color(0xff936F3E),
    canvasColor: Color(0xff060606),
    accentColor: Color(0xff457BE0),
    accentColorBrightness: Brightness.light,
    //todo Scaffold
    scaffoldBackgroundColor: Color(0xFFB9C2CA),
    bottomAppBarColor: Color(0xff6D42CE),
    // TODO CARD COLOR
    cardColor: Color(0xff060606),
    dividerColor: Color(0x1f6D42CE),
    focusColor: Color(0x1aF5E0C3),
    hoverColor: Color(0xffDEC29B),
    highlightColor: Color(0xFF0D0AE9),
    splashColor: Color(0xff457BE0),
//  splashFactory: # override create method from  InteractiveInkFeatureFactory
    selectedRowColor: Colors.grey,
    unselectedWidgetColor: Colors.grey.shade400,
    disabledColor: Colors.grey.shade200,
    buttonTheme: ButtonThemeData(
        // buttonColor: Colors.red,

        //button themes
        ),
    toggleButtonsTheme: ToggleButtonsThemeData(
        //toggle button theme
        ),
    // buttonColor: Color(0xff936F3E),
    // secondaryHeaderColor: Colors.grey,
    // backgroundColor: Color(0xff457BE0),
    dialogBackgroundColor: Color(0xff060606),

    // indicatorColor: Color(0xff457BE0),
    // hintColor: Colors.grey,
    errorColor: Colors.red,
    // toggleableActiveColor: Color(0xff6D42CE),
    textTheme: TextTheme(
        bodyText1: TextStyle(
          fontSize: 18,
          color: Color(0xffDBE9F7),
        ),
        bodyText2: TextStyle(
          color: Color(0xffDBE9F7),
        ),
        headline1: TextStyle(color: Color(0xFF060606))
        //text themes that contrast with card and canvas
        ),
    // primaryTextTheme: TextTheme(
    //     //text theme that contrast with primary color
    //     ),
    // accentTextTheme: TextTheme(
    //     //text theme that contrast with accent Color
    //     ),
    // inputDecorationTheme: InputDecorationTheme(
    //     // default values for InputDecorator, TextField, and TextFormField
    //     ),
    // iconTheme: IconThemeData(
    //     //icon themes that contrast with card and canvas
    //     ),
    // primaryIconTheme: IconThemeData(
    //     //icon themes that contrast primary color
    //     ),
    // accentIconTheme: IconThemeData(
    //     //icon themes that contrast accent color
    //     ),
    // sliderTheme: SliderThemeData(
    //     // slider themes
    //     ),
    // tabBarTheme: TabBarTheme(
    //     // tab bat theme
    //     ),
    // tooltipTheme: TooltipThemeData(
    //     // tool tip theme
    //     ),
    // cardTheme: CardTheme(

    //     // card theme
    //     ),
    // chipTheme: ChipThemeData(
    //     backgroundColor: Color(0xff936F3E),
    //     disabledColor: Color(0xaaF5E0C3),
    //     shape: StadiumBorder(),
    //     brightness: Brightness.light,
    //     labelPadding: EdgeInsets.all(8),
    //     labelStyle: TextStyle(),
    //     padding: EdgeInsets.all(8),
    //     secondaryLabelStyle: TextStyle(),
    //     secondarySelectedColor: Colors.white38,
    //     selectedColor: Colors.white
    //     // chip theme
    //     ),
    // platform: TargetPlatform.android,
    // materialTapTargetSize: MaterialTapTargetSize.padded,
    // applyElevationOverlayColor: true,
    // pageTransitionsTheme: PageTransitionsTheme(
    //     //page transition theme
    //     ),
    appBarTheme: AppBarTheme(
        color: Color(0xff060606),
        actionsIconTheme: IconThemeData(color: Color(0xffDBE9F7)),
        textTheme: TextTheme(bodyText1: TextStyle(color: Color(0xffDBE9F7))),
        iconTheme: IconThemeData(color: Color(0xffDBE9F7))
        //app bar theme
        ),
    // bottomAppBarTheme: BottomAppBarTheme(
    //     // bottom app bar theme
    //     ),

    colorScheme: ColorScheme(
        primary: Color(0xff060606),
        primaryVariant: Color(0x1AC9811D),
        secondary: Colors.red,
        secondaryVariant: Color(0xaaC9A87C),
        brightness: Brightness.light,
        background: Color(0xffB5BFD3),
        error: Colors.red,
        onBackground: Color(0xffB5BFD3),
        onError: Colors.red,
        onPrimary: Color(0xffEDD5B3),
        onSecondary: Color(0xffC9A87C),
        onSurface: Color(0xff457BE0),
        surface: Color(0xff457BE0)),

    // snackBarTheme: SnackBarThemeData(
    //     // snack bar theme
    //     ),
    dialogTheme: DialogTheme(
      contentTextStyle: TextStyle(
        color: Color(0xFF0A4DD1),
      ),
      titleTextStyle: TextStyle(
        fontSize: 26,
        color: Color(0xffDBE9F7),
      ),

      // dialog theme
    ),
    // floatingActionButtonTheme: FloatingActionButtonThemeData(
    //     // floating action button theme
    //     ),
    // navigationRailTheme: NavigationRailThemeData(
    //     // navigation rail theme
    //     ),
    // typography: Typography.material2018(),
    // cupertinoOverrideTheme: CupertinoThemeData(
    //     //cupertino theme
    //     ),
    // bottomSheetTheme: BottomSheetThemeData(
    //     //bottom sheet theme
    //     ),
    // popupMenuTheme: PopupMenuThemeData(
    //     //pop menu theme
    //     ),
    // bannerTheme: MaterialBannerThemeData(
    //     // material banner theme
    //     ),
    // dividerTheme: DividerThemeData(
    //     //divider, vertical divider theme
    //     ),
    // buttonBarTheme: ButtonBarThemeData(
    //     // button bar theme
    //     ),
    // splashFactory: InkSplash.splashFactory,
  );
}
