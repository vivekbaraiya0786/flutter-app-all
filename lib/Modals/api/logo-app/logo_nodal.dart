class LogoModal {
  String name;
  String ticker;
  String image;

  LogoModal({
    required this.name,
    required this.ticker,
    required this.image,
  });

  factory LogoModal.fromJson({required Map json}) => LogoModal(
        name: json["name"],
        ticker: json["ticker"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "ticker": ticker,
        "image": image,
      };
}
