class QuotesModel {
  int id;
  String quote;
  String author;
  String image;

  QuotesModel({
    required this.id,
    required this.quote,
    required this.author,
    required this.image,
  });

  factory QuotesModel.fromMap({required Map quotes}) {
    return QuotesModel(
        id: quotes["id"],
        quote: quotes["quote"],
        author: quotes["author"],
        image: quotes["image"]);
  }
}
