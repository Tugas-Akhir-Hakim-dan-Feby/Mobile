import 'dart:convert';

import 'package:api_mobile/model/model_skills_chart.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:d_chart/d_chart.dart';
import 'package:sp_util/sp_util.dart';

class WelderSkillChart extends StatefulWidget {
  const WelderSkillChart({Key? key}) : super(key: key);

  @override
  State<WelderSkillChart> createState() => _WelderSkillChartState();
}

class _WelderSkillChartState extends State<WelderSkillChart> {
  late Future<ModelSkillsChart> _getDataFuture;

  @override
  void initState() {
    super.initState();
    _getDataFuture = fetchChartData();
  }

  Future<ModelSkillsChart> fetchChartData() async {
    final token = SpUtil.getString('token');
    final response = await http.get(
      Uri.parse('https://develop-ta.berobatplus.shop/api/v1/chart/skill'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      print(response.body);
      final jsonData = json.decode(response.body);
      return ModelSkillsChart.fromJson(jsonData);
    } else {
      throw Exception('Failed to fetch chart data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Grafik Keahlian Member')),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: FutureBuilder<ModelSkillsChart>(
                future: _getDataFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    final data = snapshot.data!.data;
                    final int firstSkill = data.keahlianDua;
                    final int secondSkill = data.keahlianSatu;
                    final String infoYear = snapshot.data!.info;

                    final Color firstSkillColor =
                        Colors.lightBlue; // Ganti warna kotak Keahlian satu
                    final Color secondSkillColor = Colors.orange;

                    final int totalMembers = firstSkill +
                        secondSkill; // Ganti warna kotak Keahlian Dua
                    return Column(
                      children: [
                        AspectRatio(
                          aspectRatio: 4 / 3,
                          child: DChartPie(
                            data: [
                              {
                                'domain': 'keahlianSatu',
                                'measure': firstSkill,
                              },
                              {
                                'domain': 'keahlianDua',
                                'measure': secondSkill,
                              },
                            ],
                            fillColor: (pieData, index) {
                              switch (pieData['domain']) {
                                case 'keahlianSatu':
                                  return firstSkillColor;
                                case 'keahlianDua':
                                  return secondSkillColor;
                                default:
                                  return Colors.blueAccent;
                              }
                            },
                            pieLabel: (pieData, index) {
                              final measure = pieData['measure'] as int;
                              final percentage = (measure / totalMembers * 100)
                                  .toStringAsFixed(2);
                              return "$percentage%";
                            },
                            labelPosition: PieLabelPosition.auto,
                            labelColor: Colors.white,
                            labelFontSize: 14,
                            labelLineColor: Colors.grey,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(16),
                          child: Row(
                            children: [
                              RotatedBox(
                                quarterTurns: 3,
                                child: Text(
                                  'Anggota',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    AspectRatio(
                                      aspectRatio: 16 / 9,
                                      child: DChartBar(
                                        data: [
                                          {
                                            'id': 'Bar 1',
                                            'data': [
                                              {
                                                'domain': infoYear,
                                                'measure': firstSkill
                                              },
                                              {'domain': '2021', 'measure':30},
                                              {'domain': '2022', 'measure': 45},
                                              {'domain': '2023', 'measure': 65},
                                            ],
                                          },
                                          {
                                            'id': 'Bar 2',
                                            'data': [
                                              {
                                                'domain': infoYear,
                                                'measure': secondSkill
                                              },
                                              {'domain': '2021', 'measure': 103},
                                              {'domain': '2022', 'measure': 103},
                                              {'domain': '2023', 'measure': 103},
                                            ],
                                          },
                                        ],
                                        minimumPaddingBetweenLabel: 1,
                                        domainLabelPaddingToAxisLine: 16,
                                        axisLineTick: 2,
                                        axisLinePointTick: 2,
                                        axisLinePointWidth: 10,
                                        axisLineColor: Colors.green,
                                        measureLabelPaddingToAxisLine: 16,
                                        barColor: (barData, index, id) =>
                                            id == 'Bar 1'
                                                ? firstSkillColor
                                                : id == 'Bar 2'
                                                    ? secondSkillColor
                                                    : const Color.fromARGB(
                                                        255, 0, 0, 0),
                                        barValue: (barData, index) =>
                                            '${barData['measure']}',
                                        showBarValue: true,
                                        barValueFontSize: 12,
                                        barValuePosition:
                                            BarValuePosition.outside,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 8),
                                      child: Text(
                                        'Tahun',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 5),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 16),
                              Padding(
                                padding: EdgeInsets.only(left: 8),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 20,
                                      height: 20,
                                      color:
                                          firstSkillColor, // Warna kotak Keahlian satu
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      'Keahlian satu:',
                                      style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 16),
                                child: Text(
                                  'Keahlian dimiliki oleh $firstSkill Anggota',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Padding(
                                padding: EdgeInsets.only(left: 8),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 20,
                                      height: 20,
                                      color:
                                          secondSkillColor, // Warna kotak Keahlian Dua
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      'Keahlian Dua:',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 16),
                                child: Text(
                                  'Keahlian dimiliki $secondSkill Anggota',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
