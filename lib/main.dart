import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sixpicker/mvvm/repository/sp_local.dart';
import 'package:sixpicker/mvvm/view_model/vm_local.dart';
import 'package:sixpicker/router/router.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  final preferences = await SharedPreferences.getInstance();
  final shared = LocalSharedPreferences(preferences);
  runApp(
    ProviderScope(
      overrides: [
        vmLocal.overrideWith(()=> ViewModelLocal(shared)),
      ],
      child: const SixPicker(),
    ),
  );
}

class SixPicker extends ConsumerWidget {
  const SixPicker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.read(baseRouterProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.white,surfaceTintColor: Colors.white),
        textTheme: GoogleFonts.eduVicWaNtBeginnerTextTheme(),
      ),
      routerConfig: router,
    );
  }
}