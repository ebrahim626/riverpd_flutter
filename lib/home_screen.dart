import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final hello = Provider<String>((ref) {
  return "Subscribers";
});

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final text = ref.watch(hello);
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Riverpod Test",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Colors.white,
              fontSize: 25,
            ),
          ),
        ),
        backgroundColor: Colors.lightBlue,
      ),
      body: Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 40, color: Colors.black54),
        ),
      ),
    );
  }
}
