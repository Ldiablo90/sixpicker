import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sixpicker/router/router.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(
    const ProviderScope(
      observers: [],
      child: SixPicker(),
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
      theme: ThemeData(textTheme: GoogleFonts.eduVicWaNtBeginnerTextTheme()),
      routerConfig: router,
    );
  }
}