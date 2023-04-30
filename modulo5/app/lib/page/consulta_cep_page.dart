import 'dart:convert';

import 'package:app_modulo_05/model/via_cep_model.dart';
import 'package:app_modulo_05/repository/via_cep_repository.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ConsultaCepPage extends StatefulWidget {
  const ConsultaCepPage({super.key});

  @override
  State<ConsultaCepPage> createState() => _ConsultaCepPageState();
}

class _ConsultaCepPageState extends State<ConsultaCepPage> {
  var consultaCepField = TextEditingController(text: "");
  bool statusResult = false;
  ViaCepModel? viaCepModel;
  var viaCepRepository = ViaCepRepository();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Consulta CEP')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Consulta CEP",
              style: TextStyle(fontSize: 22.0),
            ),
            TextField(
              controller: consultaCepField,
              maxLength: 8,
              keyboardType: TextInputType.number,
              onChanged: (String value) async {
                // var cep = value.trim().replaceAll("-", "");
                var cep = value.replaceAll(new RegExp(r'[^0-9]'), '');
                if (cep.length == 8) {
                  setState(() {
                    loading = true;
                  });
                  viaCepModel = await viaCepRepository.consultarCep(cep);
                  print(viaCepModel!.error);
                  if (viaCepModel!.error) {
                    setState(() {
                      loading = false;
                      statusResult = false;
                    });
                    return;
                  } else {
                    statusResult = true;
                  }
                } else {
                  statusResult = false;
                }
                setState(() {
                  loading = false;
                });
              },
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Resultado",
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            Visibility(
              visible: loading,
              child: const CircularProgressIndicator(),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: statusResult
                  ? [
                      Text(
                        "Rua: ${viaCepModel!.logradouro}",
                        style: TextStyle(fontSize: 18.0),
                      ),
                      Text(
                        "Cidade: ${viaCepModel!.localidade}",
                        style: TextStyle(fontSize: 18.0),
                      ),
                      Text(
                        "Bairro: ${viaCepModel!.bairro}",
                        style: TextStyle(fontSize: 18.0),
                      ),
                      Text(
                        "Estado: ${viaCepModel!.uf}",
                        style: TextStyle(fontSize: 18.0),
                      )
                    ]
                  : !loading
                      ? [
                          const Center(
                            child: Text(
                              "Nenhum resultado encontrado",
                              style: TextStyle(fontSize: 18.0),
                            ),
                          ),
                        ]
                      : [],
            ),
          ],
        ),
      ),
    );
  }
}
