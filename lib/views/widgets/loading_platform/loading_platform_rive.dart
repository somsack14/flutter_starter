import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../../../components/styles/size_config.dart';

class LoadingPlatformRive extends StatelessWidget {
  final Color? color;
  const LoadingPlatformRive({Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: SizeConfig.imageSizeMultiplier * 40,
          // width: SizeConfig.imageSizeMultiplier * 50,
          child: const RiveAnimation.asset(
            "assets/rives/clean_the_car.riv",
            fit: BoxFit.fitHeight,
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Text(
        //     "LodLaos",
        //     style: Theme.of(context).textTheme.titleMedium!.copyWith(
        //         fontWeight: FontWeight.w500,
        //         fontSize: SizeConfig.textMultiplier * 2.2),
        //   ),
        // ),
      ],
    );
  }
}
