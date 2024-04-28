import 'package:flutter/material.dart';

class no_weather_body extends StatelessWidget {
  const no_weather_body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'there is no weather 😔 start',
              style: TextStyle(fontSize: 27),
            ),
            Text(
              'searching now 🔍',
              style: TextStyle(
                fontSize: 27,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
