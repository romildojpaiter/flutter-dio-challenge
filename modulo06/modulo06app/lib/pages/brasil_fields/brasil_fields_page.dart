import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BrasilFieldsPage extends StatefulWidget {
  const BrasilFieldsPage({super.key});

  @override
  State<BrasilFieldsPage> createState() => _BrasilFieldsPageState();
}

class _BrasilFieldsPageState extends State<BrasilFieldsPage> {
  //
  var _cpfController = TextEditingController();
  var _centavosController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("CEP"),
            TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: [
                // obrigatório
                FilteringTextInputFormatter.digitsOnly,
                CepInputFormatter(),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text("CPF"),
            TextFormField(
              controller: _cpfController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                // obrigatório
                FilteringTextInputFormatter.digitsOnly,
                CpfInputFormatter(),
              ],
            ),
            Center(
              child: TextButton(
                onPressed: () {
                  print(CPFValidator.isValid(_cpfController.text));
                  print(CPFValidator.isValid(CPFValidator.generate()));
                },
                child: Text("Continuar"),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Centavos"),
            TextFormField(
              controller: _centavosController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                // obrigatório
                FilteringTextInputFormatter.digitsOnly,
                CentavosInputFormatter(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
