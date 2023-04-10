import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:social_share/social_share.dart';
import 'package:what_to_do/card/activity_card.dart';

import '../data/data.dart';
import '../object/activity.dart';

class Progress extends StatelessWidget {
  const Progress({super.key});

  static late BuildContext buildContext;
  static ScreenshotController screenshotController = ScreenshotController();

  static Future<void> shareScreenshot() async {
    // Tomar el screenshot y guardarlo en el almacenamiento del dispositivo
    final directory = await getApplicationDocumentsDirectory();
    final imagePath = await screenshotController.captureAndSave(directory.path);

    // Verificar si la imagen se guardó correctamente
    if (imagePath != null) {
      // Compartir el screenshot en la historia de Instagram
      SocialShare.shareInstagramStory(
        appId: 'com.example.what_to_do',
        imagePath: imagePath,
      );
    } else {
      // Mostrar un mensaje de error al usuario
      print('Error al guardar el screenshot');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Card(
              elevation: 10,
              child: SizedBox(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: listActivity.isEmpty
                        ? const Center(
                            child: Text(
                              "No tasks, no progress. Add a task today!",
                              style: TextStyle(fontSize: 28),
                            ),
                          )
                        : ListView.builder(
                            itemCount: listActivity.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: LinearGradient(
                                      colors: [
                                        Theme.of(context).colorScheme.primary,
                                        Activity.typeColors[
                                                listActivity[index].type] ??
                                            Colors.amber,
                                      ],
                                    ),
                                  ),
                                  child: ListTile(
                                      trailing: Icon(Activity
                                          .typeIcons[listActivity[index].type]),
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext cont) {
                                            buildContext = cont;
                                            return Dialog(
                                              elevation: 0,
                                              child: SizedBox(
                                                width: constraints.maxWidth >
                                                        600
                                                    ? constraints.maxWidth / 2
                                                    : 300,
                                                height: 300,
                                                child: Screenshot(
                                                  controller:
                                                      screenshotController,
                                                  child: ActivityCard(
                                                    activity:
                                                        listActivity[index],
                                                    challenge: false,
                                                    page: 0,
                                                    index: index,
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      title:
                                          Text(listActivity[index].activity)),
                                ),
                              );
                            },
                          ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
