import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class CardListScreen extends StatelessWidget {
  const CardListScreen({super.key});

  Future<List<dynamic>> _fetchCards() async {
    String data = await rootBundle.loadString('assets/dummy.json');
    final cards = json.decode(data);
    return cards;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Card List"),
      ),
      body: FutureBuilder(
        future: _fetchCards(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                final card = snapshot.data?[index];
                return Card(
                  child: Column(
                    children: <Widget>[
                      Image.network(card["image"]),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Text(card["title"]),
                            const SizedBox(height: 8.0),
                            Text(card["description"]),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
