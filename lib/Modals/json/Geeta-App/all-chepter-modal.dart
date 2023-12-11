class AllChepter {
  int chapterNumber;
  String chapterSummary;
  String chapterSummaryHindi;
  int id;
  String imageName;
  String name;
  String nameMeaning;
  String nameTranslation;
  int versesCount;
  String? jsonPath;

  AllChepter({
    required this.chapterNumber,
    required this.chapterSummary,
    required this.chapterSummaryHindi,
    required this.id,
    required this.imageName,
    required this.name,
    required this.nameMeaning,
    required this.nameTranslation,
    required this.versesCount,
    required this.jsonPath,
  });

  factory AllChepter.fromJson({required Map<String, dynamic> json}) =>
      AllChepter(
        chapterNumber: json["chapter_number"],
        chapterSummary: json["chapter_summary"],
        chapterSummaryHindi: json["chapter_summary_hindi"],
        id: json["id"],
        imageName: json["image_name"],
        name: json["name"],
        nameMeaning: json["name_meaning"],
        nameTranslation: json["name_translation"],
        versesCount: json["verses_count"],
        jsonPath: json["json_path"],
      );

  Map<String, dynamic> toJson() => {
        "chapter_number": chapterNumber,
        "chapter_summary": chapterSummary,
        "chapter_summary_hindi": chapterSummaryHindi,
        "id": id,
        "image_name": imageName,
        "name": name,
        "name_meaning": nameMeaning,
        "name_translation": nameTranslation,
        "verses_count": versesCount,
        "json_path": jsonPath,
      };
}
