import 'package:flutter/material.dart';
import 'package:image_loader_flutter/image_loader_flutter.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String fileIMage = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //load image from assets
            const Text("Load image from assets"),
            SizedBox(
              height: 100,
              width: 100,
              child: ImageLoaderFlutterWidgets(
                radius: 0,
                circle: true,
                image: "assets/emo_image.jpeg",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //load image from network
            const Text("Load image from network"),
            SizedBox(
              height: 100,
              width: 100,
              child: ImageLoaderFlutterWidgets(
                radius: 0,
                circle: true,
                image:
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7berVdqN46i53bSfOr2INy52GYIfKQOAr8w&s",
              ),
            ),
            const Text("Load image from device gallery"),
            fileIMage.isEmpty
                ? Container()
                : SizedBox(
                    height: 100,
                    width: 100,
                    child: ImageLoaderFlutterWidgets(
                      radius: 0,
                      circle: true,
                      image: fileIMage,
                    ),
                  ),
            ElevatedButton(
                onPressed: () async {
                  var image = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);
                  if (image != null) {
                    fileIMage = image.path;
                    setState(() {});
                  }
                },
                child: const Text("Select image"))
          ],
        ),
      ),
    );
  }
}
