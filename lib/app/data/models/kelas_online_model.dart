class KelasOnline {
  String? paketbimbelId;
  String? paketbimbelNama;
  String? paketbimbelNominal;
  String? nominalpendaftaran;
  String? status;
  String? date;
  String? buatKelas;
  String? foto;
  String? deskripsi;

  KelasOnline(
      {this.paketbimbelId,
      this.paketbimbelNama,
      this.paketbimbelNominal,
      this.nominalpendaftaran,
      this.status,
      this.date,
      this.buatKelas,
      this.foto,
      this.deskripsi});

  KelasOnline.fromJson(Map<String, dynamic> json) {
    paketbimbelId = json['paketbimbel_id'];
    paketbimbelNama = json['paketbimbel_nama'];
    paketbimbelNominal = json['paketbimbel_nominal'];
    nominalpendaftaran = json['nominalpendaftaran'];
    status = json['status'];
    date = json['date'];
    buatKelas = json['buat_kelas'];
    foto = json['foto'];
    deskripsi = json['deskripsi'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['paketbimbel_id'] = paketbimbelId;
    data['paketbimbel_nama'] = paketbimbelNama;
    data['paketbimbel_nominal'] = paketbimbelNominal;
    data['nominalpendaftaran'] = nominalpendaftaran;
    data['status'] = status;
    data['date'] = date;
    data['buat_kelas'] = buatKelas;
    data['foto'] = foto;
    data['deskripsi'] = deskripsi;
    return data;
  }
  static List<KelasOnline> fromJsonList(List? data) {
    if (data == null || data.length == 0) return [];
    return data.map((e) => KelasOnline.fromJson(e)).toList();
  }
}
