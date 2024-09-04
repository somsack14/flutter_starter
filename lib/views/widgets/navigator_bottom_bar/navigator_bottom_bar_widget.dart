import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lod_laos/components/poviders/bottom_bar_provider/bottom_bar_provider.dart';
import 'package:lod_laos/views/screens/home/home_screen.dart';
import 'package:lod_laos/views/screens/settings/setting_screen.dart';

import '../../../components/constants/colors.dart';

final listMenu = <Widget>[
  const HomeScreen(),
  Container(),
  Container(),
  const SettingScreen(),
];

class NavigatorBottomBar extends ConsumerWidget {
  const NavigatorBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomBarProvider = ref.watch(stateBottomBarProvider);
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation
          .centerDocked, //specify the location of the FAB
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        elevation: 4.0,
        child: Container(
          margin: const EdgeInsets.all(15.0),
          child: Icon(
            Icons.add,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
      body: listMenu[bottomBarProvider.getSelectedIndex],
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        //color of the BottomAppBar
        color: Theme.of(context).colorScheme.onPrimary,
        child: Container(
          margin: const EdgeInsets.only(left: 12.0, right: 12.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                //update the bottom app bar view each time an item is clicked
                onPressed: () {
                  bottomBarProvider.updateTabSelection(
                      index: 0, buttonText: "HOME");
                },
                iconSize: 27.0,
                icon: Icon(
                  Icons.home,
                  //darken the icon if it is selected or else give it a different color
                  color: bottomBarProvider.getSelectedIndex == 0
                      ? kPrimaryColor
                      : Colors.grey.shade400,
                ),
              ),
              IconButton(
                onPressed: () {
                  bottomBarProvider.updateTabSelection(
                      index: 1, buttonText: "DISCOVERY");
                },
                iconSize: 27.0,
                icon: Icon(
                  Icons.call_made,
                  color: bottomBarProvider.getSelectedIndex == 1
                      ? kPrimaryColor
                      : Colors.grey.shade400,
                ),
              ),
              //to leave space in between the bottom app bar items and below the FAB
              const SizedBox(
                width: 50.0,
              ),
              IconButton(
                onPressed: () {
                  bottomBarProvider.updateTabSelection(
                      index: 2, buttonText: "WISHLIST");
                },
                iconSize: 27.0,
                icon: Icon(
                  Icons.call_received,
                  color: bottomBarProvider.getSelectedIndex == 2
                      ? kPrimaryColor
                      : Colors.grey.shade400,
                ),
              ),
              IconButton(
                onPressed: () {
                  bottomBarProvider.updateTabSelection(
                      index: 3, buttonText: "SETTING");
                },
                iconSize: 27.0,
                icon: Icon(
                  Icons.settings,
                  color: bottomBarProvider.getSelectedIndex == 3
                      ? kPrimaryColor
                      : Colors.grey.shade400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
