import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  MyAppState createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  List<Data> listData = [
    Data('Securinvest Sharia Sukuk Fund', '4.50', 'Pendapatan Tetap', 6.2,
        '1.087,59', '3.3T', 's1.png', 'medali1.png'),
    Data('Start Stable Income Fund', '4.00', 'Pendapatan Tetap', 12.0,
        '1.788,33', '256M', 's2.png', 'medali2.png'),
    Data('Syailendra Pendapatan Tetap Premium', '4.00', 'Pendapatan Tetap', 5.1,
        '1.070,55', '133M', 's3.png', 'medali3.png')
  ];

  String pilihanWaktu = '6';

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> waktu = [];

    var itm1 = const DropdownMenuItem<String>(
      value: '6',
      child: Text("6 Bulan"),
    );
    var itm2 = const DropdownMenuItem<String>(
      value: '1',
      child: Text("1 Tahun"),
    );

    waktu.add(itm1);
    waktu.add(itm2);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hello App',
      home: Scaffold(
          appBar: AppBar(
              leading: const FlutterLogo(),
              backgroundColor: Colors.blueGrey,
              title: const Text('Quiz Flutter'),
              actions: const <Widget>[
                ButtonNamaKelompok(),
                ButtonPerjanjian()
              ]),
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text("Periode Imbal Hasil"),
                    DropdownButton(
                        value: pilihanWaktu,
                        items: waktu,
                        onChanged: (String? newValue) {
                          setState(() {
                            if (newValue != null) pilihanWaktu = newValue;
                          });
                        }),
                  ],
                )),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: listData.length,
                  itemBuilder: (context, index) {
                    String idx = listData.elementAt(index).toString();
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(5),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(14),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Image.asset("${listData[index].logo}"),
                                  height: 40,
                                ),
                                Container(
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(5),
                                        child: Text(
                                          '${listData[index].nama}',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Row(children: [
                                        Icon(
                                          Icons.star,
                                          size: 15,
                                          color: Colors.green,
                                        ),
                                        Text(
                                            '${listData[index].skor} ${listData[index].jenis}',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold)),
                                      ]),
                                    ],
                                  ),
                                ),
                                Container(
                                  child:
                                      Image.asset("${listData[index].medali}"),
                                  height: 30,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(5),
                                        child: Text('Imbal hasil'),
                                      ),
                                      Container(
                                        child: pilihanWaktu == '6'
                                            ? Text(
                                                '${listData[index].imbalHasil}%',
                                                style: const TextStyle(
                                                    color: Colors.green,
                                                    fontWeight:
                                                        FontWeight.bold))
                                            // '6 bulan')
                                            : Text(
                                                '${listData[index].imbalHasil + 2}%',
                                                style: const TextStyle(
                                                    color: Colors.green,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                        // '1 tahun')
                                        // const Text('%'),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(5),
                                        child: Text('Harga/Unit'),
                                      ),
                                      Row(children: [
                                        Text('${listData[index].hargaUnit}',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        Icon(
                                          Icons.arrow_upward,
                                          size: 15,
                                          color: Colors.green,
                                        ),
                                      ]),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(5),
                                        child: Text('Dana Kelolaan'),
                                      ),
                                      Container(
                                        child: Text(
                                            '${listData[index].danaKelolaan}',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          )),
    );
  }
}

class ButtonNamaKelompok extends StatelessWidget {
  const ButtonNamaKelompok({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.account_circle_rounded),
      onPressed: () {
        // icon account di tap
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Kelompok 1'),
            content: const Text(
                'Rafi Arsalan Miraj (raparsalan00@upi.edu) ; Rifqi Fajar Indrayadi (rifqi.fajar@upi.edu)'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ButtonPerjanjian extends StatelessWidget {
  const ButtonPerjanjian({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.access_alarm_rounded),
      onPressed: () {
        // icon setting ditap
        const snackBar = SnackBar(
          duration: Duration(seconds: 20),
          content: Text(
              'Kami berjanji Kami berjanji  tidak akan berbuat curang dan atau membantu kelompok lain berbuat curang'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
    );
  }
}

class Data {
  String nama = "";
  String skor = "";
  String jenis = "";
  double imbalHasil = 0;
  String hargaUnit = "";
  String danaKelolaan = "";

  String logo = "";
  String medali = "";

  Data(String nama, String skor, String jenis, double imbalHasil,
      String hargaUnit, String danaKelolaan, String logo, String medali) {
    this.nama = nama;
    this.skor = skor;
    this.jenis = jenis;
    this.imbalHasil = imbalHasil;
    this.hargaUnit = hargaUnit;
    this.danaKelolaan = danaKelolaan;
    this.logo = logo;
    this.medali = medali;
  }

  String getNama() {
    return nama;
  }
}
