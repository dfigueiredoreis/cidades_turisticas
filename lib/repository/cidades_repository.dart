import 'package:lista_cidades/models/cidades_model.dart';

import 'database.dart';

class CidadesRepository {


  Future<List<CidadesModel>> findAllAsync() async {
    var db = Database();
    await db.createDatabase();

    List<CidadesModel> cidades = new List<CidadesModel>();

    if (db.created) {
      cidades = new List<CidadesModel>();
      cidades.add(
        new CidadesModel(
          id: 1,
          nome: 'Orlando',
          pais: 'Estados Unidos',
          idioma: 'Idioma: Inglês',
          moeda: 'Moeda: Dolar',
          conteudo:
              'Orlando, uma cidade no centro da Flórida, abriga mais de uma dezena de parques temáticos.',
          imagem: 'orlando.jpg',
          link_pacote: 'https://www.google.com/search?sxsrf=ALeKk01wnPWuqSmJHxkaFvF17E2_KAnRpA%3A1587767377157&ei=UWijXvSMCZmf5OUPlMS5qAE&q=pacotes+orlando&oq=pacotes+orlando&gs_lcp=CgZwc3ktYWIQAzICCAAyAggAMgIIADICCAAyAggAMgIIADICCAAyAggAMgIIADICCAA6BAgAEEc6BQgAEIMBUJBkWItuYMBvaABwA3gAgAF4iAHABZIBAzQuM5gBAKABAaoBB2d3cy13aXo&sclient=psy-ab&ved=0ahUKEwi0-YC0joLpAhWZD7kGHRRiDhUQ4dUDCAw&uact=5',
        ),
      );
      cidades.add(
        new CidadesModel(
          id: 1,
          nome: 'Pernambuco',
          pais: 'Brasil',
          idioma: 'Idioma: Português',
          moeda: 'Moeda: Real',
          conteudo:
              'Pernambuco é um estado no nordeste do Brasil, no Oceano Atlântico. A sua capital moderna, o Recife, inclui um porto, a cidade velha e a popular área balnear de Boa Viagem.',
          imagem: 'pernambuco.jpg',
          link_pacote: 'https://www.google.com/search?sxsrf=ALeKk01sUNY8SPBBpgxdLXdnsRzzgKEkYg%3A1587767362029&ei=QmijXsaxAaa55OUPl8WiwAo&q=pacotes+pernambuco&oq=pacotes+pernambuco&gs_lcp=CgZwc3ktYWIQAzICCAAyAggAMgYIABAWEB4yBggAEBYQHjIGCAAQFhAeMgYIABAWEB4yBggAEBYQHjIGCAAQFhAeMgYIABAWEB4yBggAEBYQHjoECAAQRzoECCMQJzoFCCEQoAFQ3lZYx2lgrG5oAXADeACAAZkBiAGTCZIBAzQuN5gBAKABAaoBB2d3cy13aXo&sclient=psy-ab&ved=0ahUKEwjG2uWsjoLpAhWmHLkGHZeiCKgQ4dUDCAw&uact=5',
        ),
      );
      cidades.add(
        new CidadesModel(
          id: 1,
          nome: 'Paris',
          pais: 'Franca',
          idioma: 'Idioma: Francês',
          moeda: 'Moeda: Euro',
          conteudo:
              'Paris, a capital da França, é uma importante cidade europeia e um centro mundial de arte, moda, gastronomia e cultura. Sua paisagem urbana do século XIX é cortada por avenidas largas e pelo rio Sena.',
          imagem: 'paris.jpg',
          link_pacote: 'https://www.google.com/search?sxsrf=ALeKk00NMZt4N2AS_8PUxYvhpA5hVNafwg%3A1587767344052&ei=MGijXp_aAujB5OUPj-ah2AY&q=pacotes+paris&oq=pacotes+paris&gs_lcp=CgZwc3ktYWIQAzICCAAyAggAMgIIADICCAAyAggAMgIIADICCAAyAggAMgIIADICCAA6BAgAEEc6BAgAEENQ4YABWLaEAWDGhQFoAHADeACAAYUBiAHVBJIBAzAuNZgBAKABAaoBB2d3cy13aXo&sclient=psy-ab&ved=0ahUKEwifspykjoLpAhXoILkGHQ9zCGsQ4dUDCAw&uact=5',
        ),
      );
      cidades.add(
        new CidadesModel(
          id: 1,
          nome: 'Amsterdã',
          pais: 'Holanda',
          idioma: 'Idioma: Holandês',
          moeda: 'Moeda: Euro',
          conteudo:
              'Amsterdã é a capital da Holanda, conhecida por seu patrimônio artístico, um elaborado sistema de canais e casas estreitas com telhados de duas águas, legados da era dourada do século XVII na cidade.',
          imagem: 'amsterda.jpg',
          link_pacote: 'https://www.google.com/search?q=pacotes+amsterd%C3%A3&oq=pacotes+amsterd%C3%A3&aqs=chrome..69i57j0l5.4284j0j4&sourceid=chrome&ie=UTF-8',
        ),
      );
    }

    return new Future.value(cidades);
  }

}