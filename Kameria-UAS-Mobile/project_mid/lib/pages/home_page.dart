import 'package:flutter/material.dart';
import 'package:project_mid/models/dummy_data.dart';
import 'package:project_mid/widgets/home_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final makanan = dummyData;  

    return Scaffold(
      body: ListView.builder(
        itemCount: makanan.length,
        itemBuilder: (context, index) {
          return HomeCard(makanan: makanan[index]);
        },
      ),
    );
  }
}