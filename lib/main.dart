import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:trove_challenge/constants/Constants.dart';
import 'package:trove_challenge/provider/User.dart';
import 'package:trove_challenge/routes/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => UserProvider(),
          ),
        ],
        child: MaterialApp(
          title: Constants.appName,
          theme: ThemeData(
            textTheme: GoogleFonts.montserratTextTheme(
              // poppinsTextTheme
              Theme.of(context).textTheme,
            ),

            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          initialRoute: '/',
          onGenerateRoute: RouteGenerator.generateRoute,
        ));
  }
}
