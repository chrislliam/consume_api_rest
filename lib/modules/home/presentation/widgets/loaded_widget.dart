import 'package:flutter/material.dart';

import '../controllers/home_controller.dart';

class LoadedWidget extends StatelessWidget {
  final Loaded myValueLoaded;
  final HomeController controller;
  const LoadedWidget({
    Key? key,
    required this.myValueLoaded,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => controller.fetchData(),
      child: Column(children: [
        const Text('Posts'),
        Expanded(
            child: ListView.builder(
                itemCount: myValueLoaded.list.length,
                itemBuilder: (context, index) {
                  var post = myValueLoaded.list[index];
                  return ListTile(
                      leading: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(255, 160, 35, index)),
                        child: Text(
                          post.title[1].toUpperCase(),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 21),
                        ),
                      ),
                      title: Text(post.title),
                      subtitle: Text(post.body));
                }))
      ]),
    );
  }
}
