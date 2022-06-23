import 'package:graphql_flutter/graphql_flutter.dart';

class ApiRequester {
  static HttpLink httpLink = HttpLink('https://rickandmortyapi.com/graphql');
  static GraphQLClient? client = GraphQLClient(
    cache: GraphQLCache(
      store: InMemoryStore(),
    ),
    link: httpLink,
  );
}
