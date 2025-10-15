import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final hello = Provider<String>((ref) {
  return "Subscribers";
});

final counter = StateProvider<int>((ref) {
  return 0;
});

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final text = ref.watch(hello);
    final count = ref.watch(counter);
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$text $count",
              style: TextStyle(fontSize: 40, color: Colors.black54),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    ref.read(counter.notifier).state--;
                  },
                  child: Icon(Icons.remove, size: 25),
                ),
                SizedBox(width: 15),
                ElevatedButton(
                  onPressed: () {
                    ref.read(counter.notifier).state++;
                  },
                  child: Icon(Icons.add, size: 25),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
