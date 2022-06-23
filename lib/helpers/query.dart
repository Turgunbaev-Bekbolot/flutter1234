const String query = '''query{
  characters{
    results{
      name
      status
      species
      gender
      origin{name}
      location{name}
      image
    }
  }
}''';
