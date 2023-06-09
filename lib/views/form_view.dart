import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:tp_aniversario/aniversario_controller.dart';
import 'package:tp_aniversario/aniversario_model.dart';

class FormView extends StatefulWidget {
  const FormView({super.key});

  @override
  State<FormView> createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {
  AniversarioModel aniversariante = AniversarioModel();
  TextEditingController nomeController = TextEditingController();
  TextEditingController dataController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            constraints: (MediaQuery.of(context).size.width > 1200)
                ? const BoxConstraints(maxWidth: 1200)
                : BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0)),
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(30),
              constraints: (MediaQuery.of(context).size.width > 500)
                  ? const BoxConstraints(maxWidth: 500)
                  : BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
              height: 400,
              child: Column(
                children: [
                  Text(
                    'Formulário',
                    style: TextStyle(
                        color: Colors.pink.shade200,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: 'PlayfairDisplay'),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Container(
                                  decoration: const BoxDecoration(),
                                  child: Text(
                                    'Primeiro Nome',
                                    style: TextStyle(
                                        color: Colors.pink.shade200,
                                        fontFamily: 'PlayfairDisplay',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                ),
                                TextField(
                                  controller: nomeController,
                                  onChanged: (nome) {
                                    aniversariante.primeiroNome = nome;
                                  },
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Container(
                                  decoration: const BoxDecoration(),
                                  child: Text(
                                    'Data De Nascimento',
                                    style: TextStyle(
                                        color: Colors.pink.shade200,
                                        fontFamily: 'PlayfairDisplay',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                ),
                                TextField(
                                  controller: dataController,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    MaskTextInputFormatter(mask: "##/##/####")
                                  ],
                                  onChanged: (data) {
                                    aniversariante.dataNascimento = data;
                                  },
                                  maxLength: 10,
                                  decoration: InputDecoration(
                                      hintText:
                                          'Exemplo: ${DateFormat("dd/MM/yyyy").format(DateTime.now())}'),
                                ),
                              ],
                            ),
                          )
                        ]),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        var controller = AniversarioController();
                        controller.verificarDataNascimento(
                            aniversariante, context);
                      },
                      child: const Text(
                        'Próximo Passo',
                        style: TextStyle(
                            fontFamily: 'PlayfairDisplay',
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ))
                ],
              ),
            )),
      ),
    );
  }
}
