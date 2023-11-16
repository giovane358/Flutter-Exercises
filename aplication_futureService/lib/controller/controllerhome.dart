import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../global/service.dart';
import '../model/post.dart';

class HomeController extends GetxController {
  final global = Get.put(ServicoHTTP());
  var iconSpeeddialog = Icons.settings;

  Future<List<Post>> recuperarPost() async {
    http.Response response = await http.get(global.urlPosts);
    var dadosJson = json.decode(response.body);

    List<Post> postagem = [];
    for (var post in dadosJson) {
      Post p = Post(post["userId"], post["id"], post["title"], post["body"]);
      postagem.add(p);
    }
    return postagem;
  }

  Future<void> onpenDialogSave(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) {
        final TextEditingController uiController = TextEditingController();
        final TextEditingController idController = TextEditingController();
        final TextEditingController titleController = TextEditingController();
        final TextEditingController bodyController = TextEditingController();
        final fromKey = GlobalKey<FormState>();

        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              content: Form(
                key: fromKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: uiController,
                      decoration: const InputDecoration(
                        label: Text('User ID'),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo Obrigatorio';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: idController,
                      decoration: const InputDecoration(
                        label: Text('Id'),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo Obrigatorio';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: titleController,
                      decoration: const InputDecoration(
                        label: Text('Titulo'),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo Obrigatorio';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: bodyController,
                      decoration: const InputDecoration(
                        label: Text('Descrição'),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo Obrigatorio';
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: null,
                            child: const Text(
                              'Salvar',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Cancelar'),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Future<void> onpenDialogDelet(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) {
        final TextEditingController uiController = TextEditingController();
        final TextEditingController idController = TextEditingController();
        final TextEditingController titleController = TextEditingController();
        final TextEditingController bodyController = TextEditingController();
        final fromKey = GlobalKey<FormState>();

        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              content: Form(
                key: fromKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: uiController,
                      decoration: const InputDecoration(
                        label: Text('User ID'),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo Obrigatorio';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: idController,
                      decoration: const InputDecoration(
                        label: Text('Id'),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo Obrigatorio';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: titleController,
                      decoration: const InputDecoration(
                        label: Text('Titulo'),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo Obrigatorio';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: bodyController,
                      decoration: const InputDecoration(
                        label: Text('Descrição'),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo Obrigatorio';
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: null,
                            child: const Text(
                              'Salvar',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Cancelar'),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Future<void> onpenDialogAdd(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) {
        final TextEditingController uiController = TextEditingController();
        final TextEditingController idController = TextEditingController();
        final TextEditingController titleController = TextEditingController();
        final TextEditingController bodyController = TextEditingController();
        final fromKey = GlobalKey<FormState>();

        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              content: Form(
                key: fromKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: uiController,
                      decoration: const InputDecoration(
                        label: Text('User ID'),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo Obrigatorio';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: idController,
                      decoration: const InputDecoration(
                        label: Text('Id'),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo Obrigatorio';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: titleController,
                      decoration: const InputDecoration(
                        label: Text('Titulo'),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo Obrigatorio';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: bodyController,
                      decoration: const InputDecoration(
                        label: Text('Descrição'),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo Obrigatorio';
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: null,
                            child: const Text(
                              'Salvar',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Cancelar'),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
