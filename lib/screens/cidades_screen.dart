import 'package:flutter/material.dart';
import 'package:lista_cidades/models/cidades_model.dart';
import 'package:lista_cidades/repository/cidades_repository.dart';

class CidadesScreen extends StatefulWidget {
  @override
  _CidadesScreenState createState() => _CidadesScreenState();
}

class _CidadesScreenState extends State<CidadesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(65,105,225, .9),
        title: Text("Cidades Turísticas"),
      ),
      body: FutureBuilder<List<CidadesModel>>(
        future: CidadesRepository().findAllAsync(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return buildListView(snapshot.data);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  ListView buildListView(List<CidadesModel> cidades) {
    return ListView.builder(
      itemCount: cidades == null ? 0 : cidades.length,
      itemBuilder: (BuildContext ctx, int index) {
        return cardCurso(cidades[index]);
      },
    );
  }

  Card cardCurso(CidadesModel cidades) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 12.0,
      margin: new EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 6.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(65,105,225, .9),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 10.0,
          ),
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: new BoxDecoration(
              border: new Border(
                right: new BorderSide(
                  width: 1.0,
                  color: Colors.white24,
                ),
              ),
            ),
            child: Icon(
              Icons.location_searching,
              color: Colors.white,
            ),
          ),
          title: Text(
            cidades.nome,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(
                    cidades.pais,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            color: Colors.white,
            size: 30.0,
          ),
          onTap: () {

            Navigator.pushNamed(
              context,
              "/cidades_detalhes",
              arguments: cidades,
            );

          },
        ),
      ),
    );
  }

  
}
