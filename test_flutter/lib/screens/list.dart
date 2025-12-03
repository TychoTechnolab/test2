import 'package:flutter/material.dart';
import 'package:test_flutter/env.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(Env.apiUrl),
    );
  }
}