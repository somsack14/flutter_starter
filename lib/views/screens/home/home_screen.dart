import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lod_laos/components/constants/strings.dart';
import 'package:lod_laos/components/poviders/calculate_providers/calculate_provider.dart';
import 'package:lod_laos/components/router/router.dart';
import 'package:lod_laos/components/styles/size_config.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final calculate = ref.watch(stateCalculateProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          Strings.txtHome,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontFamily: "Orange", fontSize: SizeConfig.textMultiplier * 3),
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.push(PageName.settingRoute);
            },
            icon: Icon(
              Icons.settings,
              color: Theme.of(context).iconTheme.color,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.small(
        onPressed: calculate.calculate,
        child: const Icon(Icons.cached),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(" a : ${calculate.getA}"),
            // Text(" c = $c"),
          ],
        ),
      ),
    );
  }
}
