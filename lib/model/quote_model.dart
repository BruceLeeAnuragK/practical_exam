class QuotesModel {
  int id;
  String quote;
  String author;

  QuotesModel({
    required this.id,
    required this.quote,
    required this.author,
  });

  factory QuotesModel.fromMap({required Map quotes}) {
    return QuotesModel(
      id: quotes["id"],
      quote: quotes["quote"],
      author: quotes["author"],
    );
  }
}
