import 'package:api_mobile/components/theme/colors.dart';
import 'package:flutter/material.dart';

class IndividualMemberRequirements extends StatefulWidget {
  const IndividualMemberRequirements({super.key});

  @override
  State<IndividualMemberRequirements> createState() =>
      _IndividualMemberRequirementsState();
}

class _IndividualMemberRequirementsState
    extends State<IndividualMemberRequirements> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 0, 0),
        title: Text('Syarat Individu'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(
                              top: 40,
                              left: 25,
                              right: 25,
                            ),
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: [
                                BoxShadow(
                                  color: grey.withOpacity(0.03),
                                  spreadRadius: 10,
                                  blurRadius: 3,
                                  // changes position of shadow
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 10,
                                bottom: 10,
                                right: 5,
                                left: 20,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: (size.width - 50) * 0.8,
                                      margin: const EdgeInsets.symmetric(
                                        vertical: 12.0,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          Text(
                                            "Syarat Menjadi Anggota : \n",
                                            style: TextStyle(
                                              fontSize: 19,
                                              color: black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "1. ",
                                                style: TextStyle(
                                                  fontSize: 19,
                                                  color: black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  "Mengisi formulir keanggotaan dengan jujur dan lengkap. untuk form manual dapat di download disini.",
                                                  style: TextStyle(
                                                    fontSize: 19,
                                                    color: black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "2. ",
                                                style: TextStyle(
                                                  fontSize: 19,
                                                  color: black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  "Memiliki dedikasi yang tinggi untuk memajukan API dan seluruh anggota API.",
                                                  style: TextStyle(
                                                    fontSize: 19,
                                                    color: black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "3. ",
                                                style: TextStyle(
                                                  fontSize: 19,
                                                  color: black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  "Berpengalaman dalam bidang pengelasan atau teknologi terkait.",
                                                  style: TextStyle(
                                                    fontSize: 19,
                                                    color: black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "4. ",
                                                style: TextStyle(
                                                  fontSize: 19,
                                                  color: black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  "Bersetifikasi Las (diutamakan).",
                                                  style: TextStyle(
                                                    fontSize: 19,
                                                    color: black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "5. ",
                                                style: TextStyle(
                                                  fontSize: 19,
                                                  color: black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  "Membayar biaya keanggotaan untuk 1 tahun untuk perorangan sebesar Rp 250.000,-/orang dan mahasiswa Rp.150.000 ( dilampirkan KTM yang berlaku).",
                                                  style: TextStyle(
                                                    fontSize: 19,
                                                    color: black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "6. ",
                                                style: TextStyle(
                                                  fontSize: 19,
                                                  color: black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  "Biaya Registrasi sebesar Rp.150.000",
                                                  style: TextStyle(
                                                    fontSize: 19,
                                                    color: black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "7. ",
                                                style: TextStyle(
                                                  fontSize: 19,
                                                  color: black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  "Melampirkan scan bukti transfer pembayaran pada halaman formulir pendaftaran dan mengirimkanya ke email sekretariat@api-iws.org untuk mendapatkan approval.",
                                                  style: TextStyle(
                                                    fontSize: 19,
                                                    color: black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(
                              top: 40,
                              left: 25,
                              right: 25,
                            ),
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: [
                                BoxShadow(
                                  color: grey.withOpacity(0.03),
                                  spreadRadius: 10,
                                  blurRadius: 3,
                                  // changes position of shadow
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 10,
                                bottom: 10,
                                right: 5,
                                left: 10,
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 45,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: const Center(
                                      child: Icon(Icons.add_moderator),
                                      // child: Icon(Icons.admin_panel_settings_sharp)
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      width: (size.width - 50) * 0.7,
                                      margin: const EdgeInsets.symmetric(
                                        vertical: 12.0,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          Text(
                                            "Keuntungan : \n",
                                            style: TextStyle(
                                              fontSize: 19,
                                              color: black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "1. ",
                                                style: TextStyle(
                                                  fontSize: 19,
                                                  color: black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  "Mendapatkan informasi terbaru tentang perkembangan teknologi pengelasan melalui media yang dikeluarkan oleh API secara berkala (Bulletin, Jurnal dan lainnya).",
                                                  style: TextStyle(
                                                    fontSize: 19,
                                                    color: black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "2. ",
                                                style: TextStyle(
                                                  fontSize: 19,
                                                  color: black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  "Mendapatkan potongan harga untuk mengikuti seminar/workshop dan training yang diadakan oleh API.",
                                                  style: TextStyle(
                                                    fontSize: 19,
                                                    color: black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "3. ",
                                                style: TextStyle(
                                                  fontSize: 19,
                                                  color: black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  "Mendapatkan akses dan petunjuk praktis untuk mengatasi permasalahan tentang pengelasan.",
                                                  style: TextStyle(
                                                    fontSize: 19,
                                                    color: black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "4. ",
                                                style: TextStyle(
                                                  fontSize: 19,
                                                  color: black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  "Memperoleh kemudahan untuk mendapatkan akses dengan sesama rekan seprofesi dan perusahaan yang bergerak di bidang pengelasan baik didalam negeri maupun luar negeri.",
                                                  style: TextStyle(
                                                    fontSize: 19,
                                                    color: black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "5. ",
                                                style: TextStyle(
                                                  fontSize: 19,
                                                  color: black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  "Dapat Join kedalam milist yang up to date melalui email mengenai berita dan event API-IWS.",
                                                  style: TextStyle(
                                                    fontSize: 19,
                                                    color: black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "6. ",
                                                style: TextStyle(
                                                  fontSize: 19,
                                                  color: black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  "Biaya Registrasi sebesar Rp.150.000",
                                                  style: TextStyle(
                                                    fontSize: 19,
                                                    color: black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "7. ",
                                                style: TextStyle(
                                                  fontSize: 19,
                                                  color: black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  "Melampirkan scan bukti transfer pembayaran pada halaman formulir pendaftaran dan mengirimkanya ke email sekretariat@api-iws.org untuk mendapatkan approval.",
                                                  style: TextStyle(
                                                    fontSize: 19,
                                                    color: black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                   
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
