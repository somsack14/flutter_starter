import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:lod_laos/components/constants/strings.dart';
import 'package:lod_laos/components/styles/size_config.dart';

import '../../../components/poviders/dark_mode_provider/dark_mode_provider.dart';

class SettingScreen extends ConsumerStatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends ConsumerState<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    final darkTheme = ref.watch(darkThemeProviderProvider);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          Strings.txtSetting.tr,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontFamily: "Orange", fontSize: SizeConfig.textMultiplier * 3),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Switch.adaptive(
        value: darkTheme.darkTheme,
        onChanged: (value) {
          darkTheme.darkTheme = value;
        },
      ),
    );
  }
}
