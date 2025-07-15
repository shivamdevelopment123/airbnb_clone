import 'package:airbnb/screens/dashboard/tabScreens/experiences_screen.dart';
import 'package:airbnb/screens/dashboard/tabScreens/home_screen.dart';
import 'package:airbnb/screens/dashboard/tabScreens/services_screen.dart';
import 'package:flutter/material.dart';
import '../../widgets/custom_search_bar.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  final tabs = [
    {'iconPath': 'assets/images/house.png',      'label': 'Homes'},
    {'iconPath': 'assets/images/ballon.png',     'label': 'Experiences'},
    {'iconPath': 'assets/images/bell.png',       'label': 'Services'},
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: NestedScrollView(
        headerSliverBuilder: (ctx, innerScrolled) => [
          SliverAppBar(
            backgroundColor: Colors.white,
            pinned: true,
            floating: true,
            forceElevated: innerScrolled,
            elevation: 4,
            expandedHeight: 130,
            collapsedHeight: 70,
            flexibleSpace: Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.grey.shade400,
                          Colors.white,
                        ],
                        stops: [0.0, 0.7],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: topPadding + 8,
                  left: 16,
                  right: 16,
                  child: CustomSearchBar(),
                ),
              ],
            ),
            bottom: TabBar(
              controller: _tabController,
              labelColor: const Color(0xFF242424),
              unselectedLabelColor: Colors.grey.shade600,
              indicatorColor: const Color(0xFF242424),
              indicatorWeight: 3.0,
              tabs: tabs.map((tab) {
                return Tab(
                  icon: Image.asset(tab['iconPath']!, height: 24, width: 24),
                  text: tab['label'] as String,
                );
              }).toList(),
            ),
          ),
        ],
        body: TabBarView(
          controller: _tabController,
          children: const [
            HomeScreen(),
            ExperiencesScreen(),
            ServicesScreen(),
          ],
        ),
      ),
    );
  }
}

