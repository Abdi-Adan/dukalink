class StepperModel {
  StepperModel({
    this.isSelected = false,
    this.isComplete = false,
    this.title,
    this.data,
  });

  bool isSelected;
  bool isComplete;
  String? title;
  dynamic data;

  factory StepperModel.fromJson(Map<String, dynamic> json) => StepperModel(
        isSelected: json["isSelected"],
        isComplete: json["isComplete"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "isSelected": isSelected,
        "isComplete": isComplete,
        "title": title,
      };
}

List<StepperModel> demoCarModel = [
  StepperModel(
    data: [],
    title: "Incident",
  ),
  StepperModel(
    data: [],
    title: "Car Model",
  ),
  StepperModel(
    data: [],
    title: "Location",
  ),
  StepperModel(
    data: [],
    title: "Loc",
  ),
];
