import 'package:consumo_servico_avancado/controller/controllerhome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/post.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: const Text('Consumo de serviço avançado'),
        ),
        body: FutureBuilder<List<Post>>(
          future: controller.recuperarPost(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case ConnectionState.active:
              case ConnectionState.done:
                if (snapshot.hasError) {
                } else {
                  final list = snapshot.data;
                  return ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      final item = list?[index];
                      return ListTile(
                        title: Text(
                          item!.title,
                          textScaleFactor: 1.2,
                          style: const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          item.id.toString(),
                          textScaleFactor: 1,
                        ),
                      );
                    },
                  );
                }
                break;
            }
            return const Text('data');
          },
        ),
        floatingActionButton: SpeedDial(
          icon: Icons.settings,
          backgroundColor: Colors.black,
          children: [
            SpeedDialChild(
                child: const Icon(Icons.add),
                label: 'Adicionar',
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('TextView Dialog'),
                        content: const Form(
                          child: Column(
                            children: [],
                          ),
                        ),
                        actions: <Widget>[
                          ElevatedButton(
                            child: const Text('Fechar'),
                            onPressed: () {
                              Navigator.of(context).pop(); // Fecha o diálogo
                            },
                          ),
                        ],
                      );
                    },
                  );
                }),
          ],
        ));
  }

  Future<void> openDialog() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Adicionar List'),
          content: const Column(
            children: [
              TextField(),
            ],
          ),
          contentPadding: const EdgeInsets.only(top: 10),
          actions: [
            GestureDetector(
              child: const Text('Fechar'),
            )
          ],
        ),
      );
}
