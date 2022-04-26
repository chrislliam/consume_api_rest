import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../domain/usercases/get_list_usecase.dart';
import '../external/data_source/home_repository_impl.dart';
import 'controllers/home_controller.dart';
import 'widgets/loaded_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeRepositoryImpl repository = HomeRepositoryImpl(dio: Dio());
  late HomeController controller;

  @override
  void initState() {
    controller =
        HomeController(usecase: GetListUseCase(repository: repository));
    WidgetsBinding.instance
        ?.addPostFrameCallback((timeStamp) => controller.fetchData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consumo de API REST'),
      ),
      body: ValueListenableBuilder<HomeState>(
          valueListenable: controller,
          builder: (_, value, __) {
            switch (value.runtimeType) {
              case Loading:
                return const Center(child: CircularProgressIndicator());

              case Loaded:
                var myValueLoaded = value as Loaded;
                return LoadedWidget(
                    controller: controller, myValueLoaded: myValueLoaded);
              case Error:
                var error = value as Error;
                return Center(child: Text('Erro :${error.errorMessage}'));
              default:
                return Center(
                    child: GestureDetector(
                        onTap: () => controller.fetchData(),
                        child: const Text('Recarregar')));
            }
          }),
    );
  }
}
