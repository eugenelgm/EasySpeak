
import 'package:flutter/material.dart';

class SentenceAdd extends StatefulWidget {
  const SentenceAdd({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SentenceAddState();
  }

}

class _SentenceAddState extends State<SentenceAdd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Add a sentence')
      ),
      body: const Center(
        child: Text('body'),
      ),
    );
  }
}