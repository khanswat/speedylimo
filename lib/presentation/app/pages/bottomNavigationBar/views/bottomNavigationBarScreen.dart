import 'package:flutter/material.dart';
import 'package:speedylimo/presentation/app/app.dart';

class BttomNavigationScreen extends StatefulWidget {
  const BttomNavigationScreen({Key? key}) : super(key: key);

  @override
  State<BttomNavigationScreen> createState() => _BttomNavigationScreenState();
}

// to store nested tabs
final PageStorageBucket bucket = PageStorageBucket();
Widget currentScreen = const PassengerHomeScreen();

class _BttomNavigationScreenState extends State<BttomNavigationScreen>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  // ignore: unused_field
  static const List<Widget> _bodyView = <Widget>[
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
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            child,
            Text(label, style: const TextStyle(fontSize: 8)),
          ],
        ));
  }

  final List<String> _labels = ['SPEEDY LIMO', 'PROFILE', 'CALL NOW'];
  final List<Widget> screens = [
    const PassengerHomeScreen(),
    const ProfileScreen(),
    const CallNowScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    List<Widget> _icons = const [
      Icon(Icons.directions_car),
      Icon(Icons.account_circle),
      Icon(Icons.wifi_calling_3)
    ];

    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: currentScreen,
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
                colors: [Colors.yellow, Colors.amber],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: TabBar(
                onTap: (x) {
                  setState(() {
                    _selectedIndex = x;
                    if (_selectedIndex == x) {
                      currentScreen = screens[x];
                    }
                  });
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


// class HomeWidget extends StatefulWidget {
//   const HomeWidget({super.key});

//   @override
//   State<HomeWidget> createState() => _HomeWidgetState();
// }

// int currentTab = 0; // to keep track of active tab index
// final List<Widget> screens = [
//   const HomeScreen(),
//   LoginScreen(),
//   const CallNowWidget(),
// ]; // to store nested tabs
// final PageStorageBucket bucket = PageStorageBucket();
// Widget currentScreen = const HomeScreen(); // Our first view in viewport

// class _HomeWidgetState extends State<HomeWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SizedBox(
//         height: MediaQuery.of(context).size.height,
//         child: currentScreen,
//       ),
//       bottomNavigationBar: Container(
//         height: 60,
//         decoration: const BoxDecoration(
//             color: Colors.black,
//             borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(0), topRight: Radius.circular(0))),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: <Widget>[
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 MaterialButton(
//                   minWidth: 40,
//                   onPressed: () {
//                     setState(() {
//                       currentScreen =
//                           const HomeScreen(); // if user taps on this dashboard tab will be active
//                       currentTab = 0;
//                     });
//                   },
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       Icon(
//                         Icons.directions_car,
//                         color: currentTab == 0 ? Colors.blue : Colors.white,
//                         size: currentTab == 0 ? 30 : 25,
//                       ),
//                       Text(
//                         'SPEEDY LIMO',
//                         style: TextStyle(
//                           color: currentTab == 0 ? Colors.blue : Colors.white,
//                           fontSize: currentTab == 0 ? 16 : 14,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),

//             // Right Tab bar icons

//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 MaterialButton(
//                   minWidth: 40,
//                   onPressed: () {
//                     setState(() {
//                       currentScreen =
//                           LoginScreen(); // if user taps on this dashboard tab will be active
//                       currentTab = 1;
//                     });
//                   },
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       Icon(
//                         Icons.person_pin,
//                         color: currentTab == 1 ? Colors.blue : Colors.white,
//                         size: currentTab == 1 ? 30 : 25,
//                       ),
//                       Text(
//                         'LOGIN/SIGNUP',
//                         style: TextStyle(
//                           color: currentTab == 1 ? Colors.blue : Colors.white,
//                           fontSize: currentTab == 1 ? 16 : 14,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 MaterialButton(
//                   minWidth: 40,
//                   onPressed: () {
//                     setState(() {
//                       currentScreen = const CallNowWidget()
//                           as Widget; // if user taps on this dashboard tab will be active
//                       currentTab = 2;
//                     });
//                   },
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       Container(
//                         child: Icon(
//                           Icons.wifi_calling_3,
//                           color: currentTab == 2 ? Colors.blue : Colors.white,
//                           size: currentTab == 2 ? 30 : 25,
//                         ),
//                       ),
//                       Text(
//                         'CALL NOW',
//                         style: TextStyle(
//                           color: currentTab == 2 ? Colors.blue : Colors.white,
//                           fontSize: currentTab == 2 ? 16 : 14,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
