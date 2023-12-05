import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speedylimo/presentation/app/app.dart';

import '../../../../../business_logic/cubits/cubits.dart';

class BttomNavigationScreen extends StatefulWidget {
  const BttomNavigationScreen({Key? key}) : super(key: key);

  @override
  State<BttomNavigationScreen> createState() => _BttomNavigationScreenState();
}

// to store nested tabs
final PageStorageBucket bucket = PageStorageBucket();

class _BttomNavigationScreenState extends State<BttomNavigationScreen>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static final List<Widget> _bodyView = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  // ignore: unused_element
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  late TabController _tabController;

  @override
  void initState() {
    // tODO: implement initState
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  Widget _tabItem(Widget child, String label, Widget screen,
      {bool isSelected = false}) {
    return AnimatedContainer(
        margin: const EdgeInsets.all(8),
        alignment: Alignment.center,
        duration: const Duration(milliseconds: 500),
        decoration: !isSelected
            ? null
            : BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black,
              ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            child,
            SizedBox(
              height: 5,
            ),
            Text(label,
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
          ],
        ));
  }

  final List<String> _labels = ['SPEEDY LIMO', 'PROFILE', 'CALL NOW'];

  @override
  Widget build(BuildContext context) {
    final data = context.read<UserCubit>().state.userData?.user;
    var _icons = <Widget>[
      Icon(
        Icons.directions_car,
        size: 30,
      ),
      Icon(
        Icons.account_circle,
        size: 30,
      ),
      Icon(
        Icons.wifi_calling_3,
        size: 30,
      )
    ];
    final screens = <Widget>[
      data?.roles?[0].name == 'Passenger'
          ? PassengerHomeScreen()
          : DriverHomeScreen(),
      ProfileScreen(),
      const CallNowScreen(),
    ];

    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: screens.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        height: 100,
        padding: const EdgeInsets.all(12),
        color: Colors.transparent,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50.0),
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Color(0xff00C6FF)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: TabBar(
                onTap: (x) {
                  _onItemTapped(x);
                },
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white,
                indicator: const UnderlineTabIndicator(
                  borderSide: BorderSide.none,
                ),
                tabs: [
                  for (int i = 0; i < _icons.length; i++)
                    _tabItem(
                      _icons[i],
                      _labels[i],
                      screens[i],
                      isSelected: i == _selectedIndex,
                    ),
                ],
                controller: _tabController),
          ),
        ),
      ),
    );
  }
}
