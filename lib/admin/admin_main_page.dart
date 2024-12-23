import 'package:flutter/material.dart';
import 'admin_side_bar.dart';
import 'admin_home_page.dart';
import 'admin_top_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Widget _currentPage = const HomePage();
  String _currentPageTitle = 'Home';

  void _navigateToPage(Widget page, String title) {
    setState(() {
      _currentPage = page;
      _currentPageTitle = title;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SideBar(
              onPageChange: _navigateToPage,
              currentPage: _currentPageTitle,
            ),
            Expanded(
                flex: 5,
                child: Column(
                  children: [
                    Header(pageTitle: _currentPageTitle),
                    Expanded(
                      child: _currentPage,
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
