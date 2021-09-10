import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query =
                ''; // o que for digitado na aba de pesquisa será configurado no query. por esse motivo, quando clicado no botão limpar, é setado como vazio!
          },
          icon: Icon(Icons.clear)),
      IconButton(
          onPressed: () {
            close(context, query);
          },
          icon: Icon(Icons.done)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, ''); // voltando para a tela principal
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    close(context,
        query); // passa como parâmetro para a página anterior o resultado da pesquisa.
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    print('resultado: digitado ${query}'); //o que está sendo digitado sugestões

    if (query.isNotEmpty) {
      List<String> suggestions = ["Develpment", "Flutter", "Games"]
          .where((element) => element.toLowerCase().startsWith(query))
          .toList();
      return ListView.builder(
          itemCount: suggestions.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                close(context, suggestions[index]);
              },
              title: Text(suggestions[index]),
            );
          });
    } else {
      return Center(child: Text('Nenhum resultado para pesquisa'));
    }
  }
}
