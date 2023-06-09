import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tp_aniversario/views/aniversario_view.dart';

import 'aniversario_model.dart';

class AniversarioController {
  verificarDataNascimento(
      AniversarioModel aniversariante, BuildContext context) {
    DateTime dataAniversario =
        DateFormat('dd/MM/yyyy').parse(aniversariante.dataNascimento);
    DateTime dataHoje = DateTime.now();
    if (dataHoje.month == dataAniversario.month &&
        dataHoje.day == dataAniversario.day) {
      aniversariante.idade = dataHoje.year - dataAniversario.year;
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => AniversarioView(
                  aniversariante: aniversariante,
                )),
      );
    } else {
      int diasTotais = _calculoDias(aniversariante.dataNascimento);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Ainda faltam $diasTotais dias para o seu aniversário.'),
      ));
    }
  }

  _calculoDias(String dataNascimento) {
    DateTime datanascimento = DateFormat('dd/MM/yyyy').parse(dataNascimento);
    DateTime dataHoje = DateTime.now();
    int diasTotais = DateTime(
            (datanascimento.month <= dataHoje.month &&
                    datanascimento.day <= dataHoje.day)
                ? (dataHoje.year + 1)
                : dataHoje.year,
            datanascimento.month,
            datanascimento.day)
        .difference(dataHoje)
        .inDays;
    if (dataHoje.difference(datanascimento).inHours > 1) {
      diasTotais++;
    }
    return diasTotais;
  }
}
