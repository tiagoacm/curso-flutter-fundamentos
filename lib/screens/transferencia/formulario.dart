import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controllerCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controllerCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Criando transferências'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
                controlador: _controllerCampoNumeroConta,
                rotulo: 'Número da conta',
                dica: '0000'),
            Editor(
                controlador: _controllerCampoValor,
                rotulo: 'Valor',
                dica: '0.00',
                icone: Icons.monetization_on),
            RaisedButton(
              onPressed: () {
                _criaTransferencia(context);
              },
              child: Text('CONFIRMAR'),
            )
          ],
        ),
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    print('clicou no confirmar');

    final int numCta = int.tryParse(_controllerCampoNumeroConta.text);
    final double valor = double.tryParse(_controllerCampoValor.text);

    if (numCta != null && valor != null) {
      var tefCriada = Transferencia(valor, numCta);
      // Scaffold.of(context).showSnackBar(SnackBar(content: Text('$tefCriada')));
      debugPrint('$tefCriada');
      Navigator.pop(context, tefCriada);
    } else {
      Scaffold.of(context).showSnackBar(
          SnackBar(content: Text('Informa número da conta e valor')));
    }
  }
}
