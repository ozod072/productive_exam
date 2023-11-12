class OnboardingModel {
  String image;
  String title;
  String desc;

  OnboardingModel({
    required this.image,
    required this.title,
    required this.desc,
  });

  OnboardingModel copyWith({
    String? image,
    String? title,
    String? desc,
  }) =>
      OnboardingModel(
        image: image ?? this.image,
        title: title ?? this.title,
        desc: desc ?? this.desc,
      );

  factory OnboardingModel.fromJson(Map<String, dynamic> json) => OnboardingModel(
    image: json["image"],
    title: json["title"],
    desc: json["desc"],
  );

  Map<String, dynamic> toJson() => {
    "image": image,
    "title": title,
    "desc": desc,
  };
}
