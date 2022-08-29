import 'package:easy_speak_flutter/src/SentenceAdd.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'dart:developer';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'jost'
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<bool> _selected;
  final int listLength = 30;
  
  final FlutterTts tts = FlutterTts();
  final TextEditingController controller = TextEditingController(text: 'Hello world');

  _MyHomePageState() {
    log("test");
    tts.setLanguage('en');
    tts.setSpeechRate(0.4);
  }

  @override
  void initState() {
    super.initState();
    _selected = List<bool>.generate(listLength, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(icon: SvgPicture.asset(
            'assets/icons/ic_menu_s24.svg',
            color: Colors.black,
          ), onPressed: () {})
        ],
      ),*/
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.none,
                  title: const Text("Studying\n69 Sentences",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    )
                  ),
                ),
                /*bottom: PreferredSize(
                  preferredSize: Size.fromHeight(100.0),
                  child: Column(
                    children: const <Widget>[
                      Text("Test")
                    ]
                  ),
                ),*/
              ),
            ];
          },
          body: ListBuilder(
            isSelectionMode: false,
            selectedList: _selected,
            onSelectionChange: (bool x) {},
          )
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          //tts.speak('Hello, World!');
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SentenceAdd())
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class ListBuilder extends StatefulWidget {
  const ListBuilder({
    Key? key,
    required this.selectedList,
    required this.isSelectionMode,
    required this.onSelectionChange,
  }) : super(key: key);

  final bool isSelectionMode;
  final List<bool> selectedList;
  final Function(bool)? onSelectionChange;

  @override
  State<StatefulWidget> createState() => _ListBuilderState();

}

class _ListBuilderState extends State<ListBuilder> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.selectedList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('item $index'),
            onTap: (){},
            onLongPress: (){},
          );
        },
    );
  }
  
}