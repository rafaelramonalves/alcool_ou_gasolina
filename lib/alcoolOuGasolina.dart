import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class alcoolOuGasolina extends StatefulWidget {
  @override
  _alcoolOuGasolinaState createState() => _alcoolOuGasolinaState();
}

class _alcoolOuGasolinaState extends State<alcoolOuGasolina> {

  TextEditingController _textEditingControllerAlcool = TextEditingController();
  TextEditingController _textEditingControllerGasolina = TextEditingController();
  String resultado = "";



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou Gasolina"),
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.asset("image/logo.png"),
              Divider(
                color: Colors.white,
              ),
              Text(
                "Saiba Qual a melhor opção para"
                    " abastecimento do seu carro",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                ),
              ),
              Divider(
                color: Colors.white,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "Preço do Álcool (Ex: 1.60)",
                ),
                keyboardType: TextInputType.number,
                style: TextStyle(
                    fontSize: 22
                ),
                controller: _textEditingControllerAlcool,
              ),
              Divider(
                color: Colors.white,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "Preço da Gasolina (Ex: 4.00)",
                  hintText: _textEditingControllerGasolina.text
                ),
                keyboardType: TextInputType.number,
                style: TextStyle(
                    fontSize: 22
                ),
                controller: _textEditingControllerGasolina,
              ),
              Divider(
                color: Colors.white,
              ),
              RaisedButton(
                color: Colors.blue,
                textColor: Colors.white,
                child: Text(
                  "Calcular",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20
                  ),
                ),
                onPressed: calcular,

              ),
              Divider(
                color: Colors.white,
              ),
              Text(resultado,
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                ),)
            ],
          ),
        ),
      )
    );

  }

  calcular() {
    double precoAlcool = double.tryParse(_textEditingControllerAlcool.text);
    double precoGasolina = double.tryParse(_textEditingControllerGasolina.text);

    if(precoAlcool == null || precoGasolina==null){
      setState(() {
        resultado="Número inválido, digite números maiores que zero "
            "e utilizando (.)";
      });
    }else{
      if((precoAlcool/precoGasolina)>=0.8){
        setState(() {
          resultado = "Melhor abastecer com gasolina";
        });

      }else{
        setState(() {
          resultado = "Melhor abastecer com álcool";
        });
      }
    }

    //Fazer o teclado desaparecer
    FocusScopeNode currentFocus = FocusScope.of(context);
    if(!currentFocus.hasPrimaryFocus){
      currentFocus.unfocus();
    }
  }

}
