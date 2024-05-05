import 'dart:developer' as dev;

import 'package:anonymous/counter%20app/provider/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  @override
  Widget build(BuildContext context) {
    dev.log("Counter App build...!");
    CounterProvider provider =
        Provider.of<CounterProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Rebuild Screen',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.blueAccent,
                        fontSize: 20,
                      ),
                ),
                IconButton(
                    onPressed: () {
                      setState(() {});
                    },
                    icon: const Icon(
                      Icons.refresh,
                      color: Colors.blueAccent,
                    )),
              ],
            ),
            Text(
              'Value when screen is building: ${provider.counterModel.count}',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.black,
                    fontSize: 20,
                  ),
            ),
            AspectRatio(
              aspectRatio: 1,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child:
                    Consumer<CounterProvider>(builder: (context, value, child) {
                  return Stack(
                    fit: StackFit.expand,
                    children: [
                      TweenAnimationBuilder(
                        duration: const Duration(seconds: 1),
                        tween: Tween<double>(
                          begin: (value.counterModel.count - 1).toDouble(),
                          end: value.counterModel.count.toDouble(),
                        ),
                        builder: (context, progress, child) =>
                            CircularProgressIndicator(
                          value: progress / 10,
                          strokeWidth: 10,
                        ),
                      ),
                      Center(
                          child: Text(
                        value.counterModel.count.toString(),
                      )),
                    ],
                  );
                }),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              provider.decreaseCount();
            },
            child: const Icon(Icons.remove),
          ),
          const SizedBox(
            width: 20,
          ),
          FloatingActionButton(
            onPressed: () {
              provider.increaseCount();
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
