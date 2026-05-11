import 'package:flutter/material.dart';
import 'package:flutter_store_demo/core/themes/app_fonts.dart';
import 'package:flutter_store_demo/core/widgets/gl_app_bar.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlAppBar(),
      body: SafeArea(
        child: RefreshIndicator(
          color: Colors.green,
          backgroundColor: Colors.white,
          onRefresh: () async => (),
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 15).copyWith(top: 20),
            children: [
              Gap(20),
              Row(
                spacing: 10,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {},
                      child: buildCardOrder('Повторить \nпоследний заказ', ''),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCardOrder(String text, String image) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Color(0xff949494).withValues(alpha: .1),
              blurRadius: 20,
              offset: Offset(0, 2),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: AppFonts.w500f14,
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  String getGreeting() {
    final hour = DateTime.now().hour;

    if (hour >= 8 && hour < 12) {
      return 'Доброе утро';
    } else if (hour >= 12 && hour < 18) {
      return 'Добрый день';
    } else if (hour >= 18 && hour < 20) {
      return 'Добрый вечер';
    } else {
      return 'Доброй ночи';
    }
  }
}
