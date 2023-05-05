import 'package:app_modulo_05/model/characters_model.dart';
import 'package:app_modulo_05/repository/marvel/marvel_repository.dart';
import 'package:flutter/material.dart';

class MarvelPage extends StatefulWidget {
  const MarvelPage({super.key});

  @override
  State<MarvelPage> createState() => _MarvelPageState();
}

class _MarvelPageState extends State<MarvelPage> {
  ScrollController _scrollController = ScrollController();
  late MarvelRepository marvelRepository;
  CharactersModel characters = CharactersModel();
  bool loading = false;
  int offset = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      var posicaoParaPaginar = _scrollController.position.maxScrollExtent * 0.7;
      if (_scrollController.position.pixels > posicaoParaPaginar) {
        carregarDados();
      }
    });
    marvelRepository = MarvelRepository();
    carregarDados();
  }

  carregarDados() async {
    if (loading) return;
    if (characters.data == null || characters.data!.results == null) {
      setState(() {
        loading = true;
      });
      print(offset);
      characters = await marvelRepository.getCharacters(offset);
    } else {
      setState(() {
        loading = true;
      });
      offset += characters.data!.count!;
      print(offset);
      var tempList = await marvelRepository.getCharacters(offset);
      characters.data!.results!.addAll(tempList.data!.results!);
    }
    // print(characters.data!.results!);
    loading = false;
    setState(() {});
  }

  int retornaQuantidadeHerois() {
    try {
      return characters.data!.total!;
      setState(() {});
    } catch (e) {
      return 0;
    }
  }

  int retornaQuantidadeHeroisAtual() {
    try {
      return offset + characters.data!.count!;
      setState(() {});
    } catch (e) {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Personagens Marvel"),
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.all(16),
              child: Row(
                children: [
                  Text(
                      "Quantidade de Personagens: ${retornaQuantidadeHeroisAtual()}/${retornaQuantidadeHerois()}")
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
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
            loading
                ? const Center(child: CircularProgressIndicator())
                : ElevatedButton(
                    onPressed: () {
                      carregarDados();
                    },
                    child: Text("Carregar mais itens"),
                  ),
          ],
        ),
      ),
    );
  }
}
