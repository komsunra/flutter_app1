import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class RandomWord extends StatefulWidget {
  @override
  _RandomWordState createState() => _RandomWordState();
}

class _RandomWordState extends State<RandomWord> {

  final randomWords = new WordPair.random();
  final randomWordArray = <WordPair>[];
  Widget buildListTile(WordPair wordPair){
    return ListTile(
      title: Text(wordPair.asUpperCase),
      subtitle: Text('Sub title'),
      leading: Icon(Icons.person),
      trailing: Icon(Icons.keyboard_arrow_right),
      isThreeLine: true,

    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Random Words'),),
      body: ListView.builder(itemBuilder: (context,index){
        if(index >= randomWordArray.length){
          randomWordArray.addAll(generateWordPairs().take(10));
        }
        return buildListTile(randomWordArray[index]);
      },
      itemCount: 20,)
    );
  }
}
