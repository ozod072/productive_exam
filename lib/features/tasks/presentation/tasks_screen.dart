import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:productive/assets/constants/icons.dart';
import 'package:productive/features/tasks/presentation/pages/all.dart';
import 'package:productive/features/tasks/presentation/pages/upcoming.dart';

import '../../../assets/constants/colors.dart';
import 'drawer/drawer.dart';
import 'pages/notes_page.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const Drawer(child: MyDrawer()),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          toolbarHeight: 116,
          title: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Builder(builder: (context) {
                      return GestureDetector(
                          onTap: () {
                            Scaffold.of(context).openDrawer();
                            //  Navigator.push(context, MaterialPageRoute(builder: (context)=>const MyDrawer()));
                          },
                          child: SvgPicture.asset(AppIcons.hamburger));
                    }),
                    const Spacer(),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (c) => const NotesPage()));
                        },
                        child: SvgPicture.asset(AppIcons.note)),
                    const SizedBox(width: 24),
                    SvgPicture.asset(AppIcons.notification),
                  ],
                ),
                const SizedBox(height: 16),
                TextField(
                  cursorColor: cursorColor,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 44, vertical: 13.5),
                    prefixIcon: Container(
                      padding: const EdgeInsets.all(10),
                      child: SvgPicture.asset(
                        AppIcons.search,
                      ),
                    ),
                    suffixIcon: Container(
                      padding: const EdgeInsets.all(10),
                      child: GestureDetector(
                          onTap: () {},
                          child: SvgPicture.asset(AppIcons.filter)),
                    ),
                    filled: true,
                    fillColor: textFieldBackgroundColor,
                    hintText: 'Search by events, tasks.. ',
                  ),
                ),
              ],
            ),
          ),
          bottom: TabBar(
            controller: tabController,
            tabs: const [
              Tab(child: Text("Upcoming")),
              Tab(child: Text("All")),
            ],
          ),
        ),
        body: TabBarView(
          controller: tabController,
          children: const [
            UpcomingPage(),
            AllPage(),
          ],
        ),
      ),
    );
  }
}
