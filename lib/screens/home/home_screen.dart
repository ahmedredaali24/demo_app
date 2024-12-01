import 'package:demo_app/screens/home/tabs/home_page.dart';
import 'package:demo_app/screens/home/tabs/message_page.dart';
import 'package:demo_app/screens/home/tabs/search_page.dart';
import 'package:demo_app/screens/home/tabs/setting_page.dart';
import 'package:demo_app/screens/auth_mobile/login.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../widgets/custom_button_navigationbar.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  int selectedIndex = 0;
  List<Widget> tabs = [HomePage(), SearchPage(), MessagePage(), SettingPage()];

  // Controller لإدارة التبويبات
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  // قوائم التبويبات
  List<Tab> desktopTabs = const [
    Tab(icon: Icon(Icons.home), text: "الرئيسية"),
    Tab(icon: Icon(Icons.search), text: "بحث"),
    Tab(icon: Icon(Icons.message), text: "الرسائل"),
    Tab(icon: Icon(Icons.settings), text: "الإعدادات"),
  ];

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      if (sizingInformation.isDesktop) {
        return Scaffold(
          appBar: AppBar(
            title: Text("واجهة سطح المكتب"),
            bottom: TabBar(
              controller: _tabController,
              tabs: desktopTabs,
              indicatorColor: Colors.white,
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        Login.routeName, (predicate) => false);
                  },
                  icon: const Icon(Icons.exit_to_app_outlined))
            ],
          ),
          body: TabBarView(
            controller: _tabController,
            children: tabs,
          ),
        );
      }

      return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      Login.routeName, (predicate) => false);
                },
                icon: Icon(Icons.exit_to_app_outlined))
          ],
        ),
        bottomNavigationBar: buildCustomBottomNavigationBar(
          context: context,
          selectedIndex: selectedIndex,
          onTapFunction: (index) {
            selectedIndex = index;
            setState(() {});
          },
        ),
        body: tabs[selectedIndex],
      );
    });
  }
}
