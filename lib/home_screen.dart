import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final hello = Provider<String>((ref) {
  return "Subscribers";
});

final counter = StateProvider<int>((ref) {
  return 0;
});

final switchProvider = StateProvider<bool>((ref){
  return false;
});



class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final text = ref.watch(hello);
    log('message1');
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(text,style: TextStyle(fontSize: 40, color: Colors.black54)),
                Consumer(
                  builder: (BuildContext context, WidgetRef ref, Widget? child) {
                    log('message2');
                    final count = ref.watch(counter);
                    return Text(
                      " $count",
                      style: TextStyle(fontSize: 40, color: Colors.black54),
                    );
                  },
                ),
              ],),

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
            Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                log('message3');
                final toggleSwitch = ref.watch(switchProvider);
                return Switch(value: toggleSwitch, onChanged: (value){
                  ref.read(switchProvider.notifier).state = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

