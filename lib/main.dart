import 'package:flutter/material.dart';
import 'dart:math';
import 'package:get/get.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Getx Navigation',
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
        ),
        home: HomePage(),
        getPages: [
          GetPage(name: '/page-three', page: () => PageThree()),
          GetPage(name: '/page-four/:data', page: () => PageFour()),
        ]);
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('GetX Nav'),
        ),
        body: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Navigate screen class'),
                ElevatedButton(
                  onPressed: () => Get.to(
                    PageOne(),
                    arguments: {'id': Random().nextInt(1000).toString()},
                  ),
                  child: Text('Go to page one'),
                ),
                ElevatedButton(
                  onPressed: () => Get.off(
                    PageTwo(),
                    arguments: {'id': Random().nextInt(1000).toString()},
                  ),
                  child: Text('Go to page two'),
                ),
                Divider(),
                Text('Navigate using named route'),
                OutlinedButton(
                  onPressed: () => Get.toNamed(
                    '/page-three',
                    arguments: {'id': Random().nextInt(1000).toString()},
                  ),
                  child: Text('Go to page three'),
                ),
                OutlinedButton(
                  onPressed: () => Get.toNamed(
                    '/page-four/${Random().nextInt(10000)}',
                  ),
                  child: Text('Go to page four'),
                ),
              ],
            )));
  }
}

// Page One
class PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page One'),
      ),
      body: Center(
        child: Text(
          Get.arguments['id'] ?? 'Page One',
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}

// Page Two
class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Two'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Get.off(HomePage()),
          child: Text('Go Home'),
        ),
      ),
    );
  }
}

// Page Three
class PageThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Three'),
      ),
      body: Center(
        child: Text(
          Get.arguments['id'] ?? 'Page Three',
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}

// Page Four
class PageFour extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Four'),
      ),
      body: Center(
        child: Text(
          Get.parameters['data'] ?? 'Page Four',
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}
