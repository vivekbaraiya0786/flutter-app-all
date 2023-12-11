class ChapterModal {
  String verse;
  String san;
  String en;
  String guj;
  String hi;
  String? translation;

  ChapterModal({
    required this.verse,
    required this.san,
    required this.en,
    required this.guj,
    required this.hi,
    this.translation,
  });

  factory ChapterModal.fromJson({required Map<String, dynamic> json}) =>
      ChapterModal(
        verse: json["verse"],
        san: json["san"],
        en: json["en"],
        guj: json["guj"],
        hi: json["hi"],
      );

  Map<String, dynamic> toJson() => {
        "verse": verse,
        "san": san,
        "en": en,
        "guj": guj,
        "hi": hi,
      };
}
