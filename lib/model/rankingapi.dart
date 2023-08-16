class Fields {
  List<double>? geoPoint2D;
  //int? ns;
  //int? hici;
  String? universityName;
  String? nationalRank;
  int? worldRankInt;
  String? iso3Code;
  //GeoShape? geoShape;
  String? iso2Code;
  String? worldRank;
  String? country;
  String? year;
  double? pcp;
  int? totalScore;
  //int? alumni;
  int? pub;
  //int? award;

  Fields(
      {this.geoPoint2D,
      //this.ns,
      //this.hici,
      this.universityName,
      this.nationalRank,
      this.worldRankInt,
      this.iso3Code,
      this.iso2Code,
      this.worldRank,
      this.country,
      this.year,
      this.pcp,
      this.totalScore,
      //this.alumni,
      this.pub,
      //this.award
      });

  Fields.fromJson(Map<String, dynamic> json) {
    geoPoint2D = json["geo_point_2d"] == null
        ? null
        : List<double>.from(json["geo_point_2d"]);
   // ns = json["ns"];
    //hici = json["hici"];
    universityName = json["university_name"];
    nationalRank = json["national_rank"];
    worldRankInt = json["world_rank_int"];
    iso3Code = json["iso3_code"];
    //geoShape = json["geo_shape"] == null ? null : GeoShape.fromJson(json["geo_shape"]);
    iso2Code = json["iso2_code"];
    worldRank = json["world_rank"];
    country = json["country"];
    year = json["year"];
    pcp = json["pcp"];
   // totalScore = json["total_score"];
    //alumni = json["alumni"];
    //pub = json["pub"];
    //award = json["award"];
  }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (geoPoint2D != null) {
//       data["geo_point_2d"] = geoPoint2D;
//     }
//     data["ns"] = ns;
//     data["hici"] = hici;
//     data["university_name"] = universityName;
//     data["national_rank"] = nationalRank;
//     data["world_rank_int"] = worldRankInt;
//     data["iso3_code"] = iso3Code;
//     // if(geoShape != null) {
//     //     data["geo_shape"] = geoShape?.toJson();
//     // }
//     data["iso2_code"] = iso2Code;
//     data["world_rank"] = worldRank;
//     data["country"] = country;
//     data["year"] = year;
//     data["pcp"] = pcp;
//     data["total_score"] = totalScore;
//     data["alumni"] = alumni;
//     data["pub"] = pub;
//     data["award"] = award;
//     return data;
//   }
}
