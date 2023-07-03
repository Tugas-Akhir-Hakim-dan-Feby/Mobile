class ModelSkillsChart {
    String info;
    Data data;

    ModelSkillsChart({
        required this.info,
        required this.data,
    });

    factory ModelSkillsChart.fromJson(Map<String, dynamic> json) {
    return ModelSkillsChart(
      info: json['info'],
      data: Data.fromJson(json['data']),
    );
  }

}

class Data {
    int keahlianDua;
    int keahlianSatu;

    Data({
        required this.keahlianDua,
        required this.keahlianSatu,
    });

    factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      keahlianDua: json['Keahlian Dua'],
      keahlianSatu: json['Keahlian Satu'],
    );
  }

}