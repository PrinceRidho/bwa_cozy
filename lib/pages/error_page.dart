import 'package:bwa_cozy/theme.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Text(
          'This is Error Page',
          style: blackTextStyle,
        ),
      ),
    );
  }
}
