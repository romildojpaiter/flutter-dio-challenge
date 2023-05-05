import 'package:app_modulo_05/model/characters_model.dart';
import 'package:app_modulo_05/repository/marvel/marvel_repository.dart';
import 'package:flutter/material.dart';

class MarvelPage extends StatefulWidget {
  const MarvelPage({super.key});

  @override
  State<MarvelPage> createState() => _MarvelPageState();
}

class _MarvelPageState extends State<MarvelPage> {
  late MarvelRepository marvelRepository;
  CharactersModel characters = CharactersModel();
  bool loading = false;

  @override
  void initState() {
    super.initState();
    marvelRepository = MarvelRepository();
    carregarDados();
  }

  carregarDados() async {
    loading = true;
    characters = await marvelRepository.getCharacters();
    // print(characters.data!.results!);
    loading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Personagens Marvel"),
        ),
        body: loading
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: (characters.data == null ||
                        characters.data!.results == null)
                    ? 0
                    : characters.data!.results!.length,
                itemBuilder: (_, int index) {
                  var character = characters.data!.results![index];
                  return Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 8.0,
                    ),
                    child: Card(
                      elevation: 3,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            character.thumbnail!.path! +
                                "." +
                                character.thumbnail!.extension!,
                            height: 100,
                            width: 100,
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 12.0,
                                vertical: 8.0,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    character.name!,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(character.description!),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
