class StallModel {
  int? id;
  String? code;

  StallModel({
    this.id,
    this.code,
  });

  Map<String, dynamic> toMap() {
    // used when inserting data to the database
    return <String, dynamic>{
      "id": id,
      "code": code,
    };
  }
}
