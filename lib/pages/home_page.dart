import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rating_model/widgets/colors.dart';
import 'package:rating_model/widgets/icons.dart';
import 'package:rating_model/widgets/text.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static String id = 'HomePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: white,
        elevation: 0,
        title: Text(
          'New Trend',
          style: h5Bold,
        ),
        actions: [
          MyIconButton(
            icon: FontAwesomeIcons.cartPlus,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
