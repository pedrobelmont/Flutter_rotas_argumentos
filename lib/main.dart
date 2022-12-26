import 'package:flutter/material.dart';
import 'package:list_viewbuid/src/model/argumento.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => PageList(title: 'items pedro'),
        TelaItem.routeName: (context) => TelaItem(),
      },
      // home: PageList(title: 'my itens'),
    );
  }
}

void chamarRota(context) {
  Navigator.pushNamed(context, '/second');
}

var objetos = ['carros', 'roupa', 'tenes', 'musicas'];

class PageList extends StatelessWidget {
  String title;
  PageList({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
            itemCount: 4,
            itemBuilder: ((context, index) => ListTile(
                  title: Text('${objetos[index]}'),
                  leading: const Icon(Icons.shop_2_sharp),
                  onTap: () {
                    Navigator.pushNamed(context, TelaItem.routeName,
                        arguments: ScreenArguments(
                            'compre ${objetos[index]}', 'pedrinho'));
                  },
                ))
            // This trailing comma makes auto-formatting nicer for build methods.
            ));
  }
}

class TelaItem extends StatelessWidget {
  TelaItem({super.key});
  static const routeName = '/telaitem';
  @override
  Widget build(BuildContext context) {
    final ScreenArguments? args =
        ModalRoute.of(context)?.settings.arguments as ScreenArguments?;
    return Scaffold(
      appBar: AppBar(
        title: Text('${args?.message}'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('${args?.title}'),
        ),
      ),
    );
  }
}
