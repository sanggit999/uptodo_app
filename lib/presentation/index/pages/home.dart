import 'package:flutter/material.dart';
import 'package:uptodo_app/presentation/index/widgets/header.dart';
import 'package:uptodo_app/presentation/index/widgets/tasks.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Padding(
      padding: EdgeInsets.only(top: 40, left: 16, right: 16),
      child: Column(
        children: [
          Header(),
          SizedBox(height: 20),
          Tasks(),
        ],
      ),
    ));
  }
}
