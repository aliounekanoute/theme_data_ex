

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData appTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  // Colors 
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.black,
    primary: Colors.black,
    secondary: Colors.grey,
    background: Colors.white
  ),

  // AppBar theme
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.black,
    iconTheme: const IconThemeData(
      color: Colors.white
    ),
    actionsIconTheme: const IconThemeData(
      color: Colors.white
    ),
    titleTextStyle: GoogleFonts.poppins(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    )
  ),

  // TextTheme 
  textTheme: TextTheme(
    titleLarge: GoogleFonts.roboto(
      fontSize: 20,
      fontWeight: FontWeight.bold
    ),
    labelMedium: GoogleFonts.roboto(
      fontSize: 16,
      fontWeight: FontWeight.bold
    ),
    bodyMedium: GoogleFonts.roboto(
      fontSize: 16,
    )
  ),

  // FloatingActionButtonTheme 
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.black,
    foregroundColor: Colors.white,
    elevation: 1,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    )
  ),

  // TextButtonTheme
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.black),
      foregroundColor: MaterialStateProperty.all(Colors.white),
      fixedSize:  MaterialStateProperty.all(const Size(200, 50)),
      textStyle: MaterialStateProperty.all(GoogleFonts.roboto(
        fontSize: 20,
        fontWeight: FontWeight.bold,

      ))
    )
  ),

  // InputDecoration
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      borderSide: BorderSide(
        color: Colors.grey,
        width: 1.5,
      )
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      borderSide: BorderSide(
        color: Colors.grey,
        width: 1.5,
      )
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black
      )
    ),
    hintStyle: TextStyle(
      color: Colors.grey,
      fontSize: 14
    )
  ),

  
);


ThemeData darkTheme = appTheme.copyWith(
  brightness: Brightness.dark,
  // Colors 
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.white,
    primary: Colors.white,
    secondary: Colors.grey,
    background: Colors.black,
  ),

  // AppBar theme
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(
      color: Colors.black
    ),
    actionsIconTheme: IconThemeData(
      color: Colors.black
    ),
  ),

  // TextTheme 
  textTheme: TextTheme(
    titleLarge: GoogleFonts.roboto(
      color: Colors.white
    ),
    labelMedium: GoogleFonts.roboto(
      color: Colors.white
    ),
    bodyMedium: GoogleFonts.roboto(
      color: Colors.white
    )
  ),

  // FloatingActionButtonTheme 
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
  ),

  // TextButtonTheme
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.white),
      foregroundColor: MaterialStateProperty.all(Colors.black),
      textStyle: MaterialStateProperty.all(GoogleFonts.roboto(
        color: Colors.black,
      ))
    )
  ),

  // InputDecoration
  inputDecorationTheme: const InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.white,
      )
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.white
      )
    ),
  ),
);
