class ModelClass {
  String? country;
  List<String>? domains;
  String? alphaTwoCode;
  String? stateProvince;
  List<String>? webPages;
  String? name;

  ModelClass(
      {required this.country,
      this.domains,
      this.alphaTwoCode,
      this.stateProvince,
      this.webPages,
      required this.name});

  ModelClass.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    domains = json['domains'].cast<String>();
    alphaTwoCode = json['alpha_two_code'];
    stateProvince = json['state-province'];
    webPages = json['web_pages'].cast<String>();
    name = json['name'];
  }
}