import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lista_cidades/models/cidades_model.dart';
import 'package:url_launcher/url_launcher.dart';

class CidadesDetalhesScreen extends StatelessWidget {
  CidadesModel cidadesModel;

  @override
  Widget build(BuildContext context) {
    cidadesModel = ModalRoute.of(context).settings.arguments;

    final levelIndicator = Container(
      child: Container(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );

    final cidadesMoeda = Container(
      padding: const EdgeInsets.all(7.0),
      decoration: new BoxDecoration(
        border: new Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Center(
        child: Text(
          cidadesModel.moeda,
          style: TextStyle(color: Colors.white)
        ),
      ),
    );

    final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 80.0),
        Icon(
          Icons.location_city,
          color: Colors.white,
          size: 40.0,
        ),
        Container(
          width: 90.0,
          child: new Divider(color: Colors.green),
        ),
        SizedBox(height: 10.0),
        Text(
          cidadesModel.nome,
          style: TextStyle(
            color: Colors.white,
            fontSize: 45.0,
          ),
        ),
        SizedBox(height: 22.7),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: levelIndicator,
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  cidadesModel.idioma,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: cidadesMoeda,
            ),
          ],
        ),
      ],
    );

    final topContent = Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 10.0),
          height: MediaQuery.of(context).size.height * 0.5,
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage(cidadesModel.imagem),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: EdgeInsets.all(40.0),
          width: MediaQuery.of(context).size.width,
         /* decoration: BoxDecoration(color: Color.fromRGBO(135,206,250, .9)),*/
          child: Center(
            child: topContentText,
          ),
        ),
        Positioned(
          left: 8.0,
          top: 60.0,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        )
      ],
    );

    final bottomContentText = Text(
      cidadesModel.conteudo,
      style: TextStyle(fontSize: 18.0),
      textAlign: TextAlign.justify,
    );

    final readButton = Container(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      width: MediaQuery.of(context).size.width,
      child: RaisedButton(
        onPressed: _launchURL,
        color: Color.fromRGBO(65,105,225, 1.0),
        child: Text(
          "Buscar Pacotes",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );

    final bottomContent = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          children: <Widget>[
            bottomContentText,
            readButton,
          ],
        ),
      ),
    );

    return Scaffold(
      body: Column(
        children: <Widget>[
          topContent,
          bottomContent,
        ],
      ),
    );
  }

  _launchURL() async {
    String url = cidadesModel.link_pacote;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

}
