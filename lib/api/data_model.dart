class DataDoa {
  String id;
  String doa;
  String ayat;
  String latin;
  String artinya;

  DataDoa({
    required this.id,
    required this.doa,
    required this.ayat,
    required this.latin,
    required this.artinya,
  });

  factory DataDoa.fromJson(Map<String, dynamic> json) {
    return DataDoa(
        id: json['id'],
        doa: json['doa'],
        ayat: json['ayat'],
        latin: json['latin'],
        artinya: json['artinya']);
  }
}
