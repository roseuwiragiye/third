import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'calculator_screen.dart';
import 'drawer_navigation.dart';
import 'theme_provider.dart';






class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  late StreamSubscription subscription;
  bool isDeviceConnected = false;
  bool isAlertSet = false;

  @override
  void initState() {
    // getConnectivity();
    super.initState();
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  int _selectedIndex = 0;
  final List<Widget> _screens = [
    ScreenOne(),
    CalculatorScreen(),
    ScreenThree(),
  ];

  // List of titles for the AppBar based on the tab index
  final List<String> _appBarTitles = ['Home', 'Calculator', 'About'];

  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitles[_selectedIndex]), // Dynamic title
        actions: [
          IconButton(
            onPressed: () {
              context.read<ThemeStateProvider>().setDarkTheme();
            },
            icon:
                context.select((ThemeStateProvider theme) => theme.isDarkTheme)
                    ? const Icon(Icons.dark_mode_outlined)
                    : const Icon(Icons.light_mode_outlined),
          ),
        ],
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onTabSelected,
        selectedItemColor: Colors.blueGrey,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Calculator',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About',
          ),
        ],
      ),
      drawer: DrawerNavigation(
        onItemSelected: _onTabSelected,
        selectedIndex: _selectedIndex, // Pass the selected index
        context: context, // Pass the context
      ),
    );
  }


}

class ScreenOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Text(
            'Welcome to our platform!'
                    ' We are thrilled to have you join our community. Whether you are here to explore new ideas, connect with like-minded individuals, or embark on a journey of learning and growth, you have come to the right place. '
                    'Our platform is designed to be a welcoming and inclusive space where everyone voice is valued and respected. From informative discussions to engaging activities, Welcome aboard!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}

class ScreenThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Text(
            "At our core, we are a passionate team dedicated to fostering a vibrant and supportive community. With a commitment to excellence and innovation, "
                    "we strive to create a platform where individuals from all walks of life can come together to learn, grow, and connect.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}

