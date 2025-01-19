import 'package:expressions/expressions.dart';
import 'package:flutter/material.dart';

class Calculadora extends StatefulWidget {
  const Calculadora({super.key});

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  final String _limpar = 'Limpar';
  String _expressao = '';
  String _resultado = '';

  Widget _botao(String valor) {
    return TextButton(
      child: Text(
        valor,
        style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
      ),
      onPressed: () => _pressionarBotao(valor),
    );
  }

  void _pressionarBotao(String valor) {
    setState(() {
      if (valor == _limpar) {
        _expressao = '';
        _resultado = '';
      } else if (valor == '=') {
        _calcularResultado();
      } else {
        _expressao += valor;
      }
    });
  }

  void _calcularResultado() {
    setState(() {
      _resultado = _avaliarExpressao(_expressao).toString();
    });
  }

  double _avaliarExpressao(String expressao) {
    try {
      // Avaliar a expressao com a biblioteca expressions
      ExpressionEvaluator avaliador = const ExpressionEvaluator();
      var resultado = avaliador.eval(Expression.parse(expressao), {});
      return resultado is num ? resultado.toDouble() : double.nan;
    } catch (e) {
      // Caso ocorra um erro na avaliação da expressão
      return double.nan;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            _expressao,
            style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10.0),
          Text(
            _resultado,
            style: const TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20.0),
          Expanded(
            child: GridView.count(
              crossAxisCount: 4,
              padding: const EdgeInsets.all(5.0),
              children: <String>[
                '7', '8', '9', '/',
                '4', '5', '6', '*',
                '1', '2', '3', '-',
                '.', '0', '=', '+',
                _limpar
              ].map((valor) => _botao(valor)).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
