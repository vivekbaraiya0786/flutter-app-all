class QoutesModal {
  String quote;
  String author;
  String category;

  QoutesModal({
    required this.quote,
    required this.author,
    required this.category,
  });

  factory QoutesModal.fromJson({required Map json}) => QoutesModal(
        quote: json["quote"],
        author: json["author"],
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "quote": quote,
        "author": author,
        "category": category,
      };
}
