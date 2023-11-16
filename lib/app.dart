import 'package:flutter/material.dart';

import 'features/contact_page/presentation/pages/contact_page_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ContactPageScreen(),
    );
  }
}
