import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mum_k4/models/users.dart';
import 'package:provider/provider.dart';
import 'package:mum_k4/services/database.dart';
import 'package:mum_k4/models/aahnik.dart';

class Addaahnikdata extends StatefulWidget {
  String today;
  Addaahnikdata(this.today);
  @override
  _AddaahnikdataState createState() => _AddaahnikdataState(this.today);
}

class _AddaahnikdataState extends State<Addaahnikdata> {
  String today;
  String month;
  _AddaahnikdataState(this.today);
  final _formKey = GlobalKey<FormState>();
  final List<String> aarti = ['0', '1', '2', '3', '4', '5'];
  final List<String> mansi = ['0', '1', '2', '3', '4', '5'];
  final List<String> nityap = ['Yes', 'No'];
  final List<String> vanchan = ['Yes', 'No'];
  final List<String> chesta = ['Yes', 'No'];
  final List<String> gharsabha = ['Yes', 'No'];
  // final List<String> sahan = ['Yes', 'No'];
  final List<String> jivan = ['Yes', 'No'];
  // form values
  String _currentAarti;
  String _currentMansi;
  String _currentNityap;
  String _currentVanchan;
  String _currentChesta;
  String _currentGharsabha;
  // String _currentSahan;
  String _currentJivan;
  var name;
  var montharray;
  String monthstring;
  @override
  Widget build(BuildContext context) {
    // //Today's logic
    monthstring = today.toString();
    montharray = monthstring.split("-");
    month = montharray[0] + '-' + montharray[1];
    final user = Provider.of<User>(context);
    DocumentReference documentReference =
        Firestore.instance.collection("users").document(user.uid);
    documentReference.get().then((val) {
      name = val.data['name'];
      // print(val.data['name']);
    });
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/red_blue_back.png"),
          fit: BoxFit.cover,
          // alignment: Alignment.bottomLeft,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          // backgroundColor: Colors.orange[600],
          title: Text("Add Today's Aahnik"),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Colors.red, Colors.blue]),
            ),
          ),
        ),
        body: StreamBuilder<Aahnik>(
            stream: DatabaseService(uid: user.uid, day: today).aahnikData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Aahnik aahnikdata = snapshot.data;
                _currentAarti = aahnikdata.aarti;
                _currentMansi = aahnikdata.mansi;
                _currentNityap = aahnikdata.nityap;
                _currentVanchan = aahnikdata.vanchan;
                _currentChesta = aahnikdata.chesta;
                _currentGharsabha = aahnikdata.gharsabha;
                _currentJivan = aahnikdata.jivan;
                return Form(
                  key: _formKey,
                  child: ListView(
                    children: <Widget>[
                      // Text(
                      //   "Add Today's Aahnik.",
                      //   style: TextStyle(fontSize: 18.0),
                      // ),
                      SizedBox(height: 10.0),
                      // RaisedButton(
                      //   child: Text('Click me to Set Date'),
                      //   color: pressAttention ? Colors.green : Colors.red,
                      //   onPressed: () {
                      //     showDatePicker(
                      //             context: context,
                      //             initialDate: DateTime.now(),
                      //             firstDate: DateTime(2020),
                      //             lastDate: DateTime(2022))
                      //         .then((date) {
                      //       setState(() {
                      //         _dateTime = date;
                      //         today = _dateTime.toString().split(" ");
                      //       });
                      //     });
                      //     setState(() => pressAttention = true);
                      //     today = new DateTime.now().toString().split(" ");
                      //     print(today);
                      //   },
                      // ),
                      SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(children: <Widget>[
                            SizedBox(
                              width: 20,
                            ),
                            Center(
                              child: Text(
                                "Aarti:",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 23,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 165,
                            ),
                            Container(
                              width: 100.0,
                              child: DropdownButtonFormField(
                                value: _currentAarti != null
                                    ? _currentAarti
                                    : _currentAarti = '0',
                                items: aarti.map((aarti) {
                                  return DropdownMenuItem(
                                    value: aarti,
                                    child: Text(
                                      '$aarti',
                                      textAlign: TextAlign.center,
                                    ),
                                  );
                                }).toList(),
                                onChanged: (val) =>
                                    setState(() => _currentAarti = val),
                              ),
                            ),
                          ])),
                      SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(children: <Widget>[
                            SizedBox(
                              width: 20,
                            ),
                            Center(
                              child: Text(
                                "Mansi:",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 23,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 150,
                            ),
                            Container(
                              width: 100.0,
                              child: DropdownButtonFormField(
                                value: _currentMansi != null
                                    ? _currentMansi
                                    : _currentMansi = '0',
                                items: mansi.map((mansi) {
                                  return DropdownMenuItem(
                                    value: mansi,
                                    child: Text(
                                      '$mansi',
                                      textAlign: TextAlign.center,
                                    ),
                                  );
                                }).toList(),
                                onChanged: (val) =>
                                    setState(() => _currentMansi = val),
                              ),
                            ),
                          ])),
                      SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(children: <Widget>[
                            SizedBox(
                              width: 20,
                            ),
                            Center(
                              child: Text(
                                "Nitya Prerna:",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 21,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 99,
                            ),
                            Container(
                              width: 100.0,
                              child: DropdownButtonFormField(
                                value: _currentNityap != null
                                    ? _currentNityap
                                    : _currentNityap = 'No',
                                items: nityap.map((nityap) {
                                  return DropdownMenuItem(
                                    value: nityap,
                                    child: Text(
                                      '$nityap',
                                      textAlign: TextAlign.center,
                                    ),
                                  );
                                }).toList(),
                                onChanged: (val) =>
                                    setState(() => _currentNityap = val),
                              ),
                            ),
                          ])),
                      SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(children: <Widget>[
                            SizedBox(
                              width: 15,
                            ),
                            Center(
                              child: Text(
                                "Vachnamrut &\n Swami Ni Vato:",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 22,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 70,
                            ),
                            Container(
                              width: 100.0,
                              child: DropdownButtonFormField(
                                value: _currentVanchan != null
                                    ? _currentVanchan
                                    : _currentVanchan = 'No',
                                items: vanchan.map((vanchan) {
                                  return DropdownMenuItem(
                                    value: vanchan,
                                    child: Text(
                                      '$vanchan',
                                      textAlign: TextAlign.center,
                                    ),
                                  );
                                }).toList(),
                                onChanged: (val) =>
                                    setState(() => _currentVanchan = val),
                              ),
                            ),
                          ])),
                      SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(children: <Widget>[
                            SizedBox(
                              width: 20,
                            ),
                            Center(
                              child: Text(
                                "Chesta:",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 23,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 140,
                            ),
                            Container(
                              width: 100.0,
                              child: DropdownButtonFormField(
                                value: _currentChesta != null
                                    ? _currentChesta
                                    : _currentChesta = 'No',
                                items: chesta.map((chesta) {
                                  return DropdownMenuItem(
                                    value: chesta,
                                    child: Text(
                                      '$chesta',
                                      textAlign: TextAlign.center,
                                    ),
                                  );
                                }).toList(),
                                onChanged: (val) =>
                                    setState(() => _currentChesta = val),
                              ),
                            ),
                          ])),
                      SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(children: <Widget>[
                            SizedBox(
                              width: 20,
                            ),
                            Center(
                              child: Text(
                                "Ghar Sabha:",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 21,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 100,
                            ),
                            Container(
                              width: 100.0,
                              child: DropdownButtonFormField(
                                value: _currentGharsabha != null
                                    ? _currentGharsabha
                                    : _currentGharsabha = 'No',
                                items: gharsabha.map((gharsabha) {
                                  return DropdownMenuItem(
                                    value: gharsabha,
                                    child: Text(
                                      '$gharsabha',
                                      textAlign: TextAlign.center,
                                    ),
                                  );
                                }).toList(),
                                onChanged: (val) =>
                                    setState(() => _currentGharsabha = val),
                              ),
                            ),
                          ])),
                      // SingleChildScrollView(
                      //     scrollDirection: Axis.horizontal,
                      //     child: Row(children: <Widget>[
                      //       SizedBox(
                      //         width: 20,
                      //       ),
                      //       Center(
                      //         child: Text(
                      //           "Sahajanad Namavali:",
                      //           textAlign: TextAlign.center,
                      //           style: TextStyle(
                      //             fontSize: 22,
                      //           ),
                      //         ),
                      //       ),
                      //       SizedBox(
                      //         width: 10,
                      //       ),
                      //       Container(
                      //         width: 100.0,
                      //         child: DropdownButtonFormField(
                      //           value: _currentSahan != null
                      //               ? _currentSahan
                      //               : _currentSahan = 'No',
                      //           items: sahan.map((sahan) {
                      //             return DropdownMenuItem(
                      //               value: sahan,
                      //               child: Text(
                      //                 '$sahan',
                      //                 textAlign: TextAlign.center,
                      //               ),
                      //             );
                      //           }).toList(),
                      //           onChanged: (val) =>
                      //               setState(() => _currentSahan = val),
                      //         ),
                      //       ),
                      //     ])),
                      SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(children: <Widget>[
                            SizedBox(
                              width: 20,
                            ),
                            Center(
                              child: Text(
                                "Jivan Charitra:",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 22,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 75,
                            ),
                            Container(
                              width: 100.0,
                              child: DropdownButtonFormField(
                                value: _currentJivan != null
                                    ? _currentJivan
                                    : _currentJivan = 'No',
                                items: jivan.map((jivan) {
                                  return DropdownMenuItem(
                                    value: jivan,
                                    child: Text(
                                      '$jivan',
                                      textAlign: TextAlign.center,
                                    ),
                                  );
                                }).toList(),
                                onChanged: (val) =>
                                    setState(() => _currentJivan = val),
                              ),
                            ),
                          ])),
                      SizedBox(height: 10.0),
                      SizedBox(
                        height: 100,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 50,
                            width: 140,
                            child: RaisedButton(
                                color: Colors.lightBlue,
                                child: Text(
                                  'Submit',
                                  style: TextStyle(color: Colors.white),
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(80.0))),
                                onPressed: () async {
                                  // print(today);
                                  // print(_currentAarti);
                                  // print(_currentMansi);
                                  // print(_currentNityap);
                                  // print(_currentVanchan);
                                  // print(_currentChesta);
                                  // print(_currentGharsabha);
                                  // print(_currentSahan);
                                  // print(_currentJivan);
                                  await DatabaseService(uid: user.uid)
                                      .addaahnikdata(
                                    _currentAarti,
                                    _currentMansi,
                                    _currentNityap,
                                    _currentVanchan,
                                    _currentChesta,
                                    _currentGharsabha,
                                    // _currentSahan,
                                    _currentJivan,
                                    today,
                                    month,
                                    name,
                                    // percent
                                  );
                                  // print(name);
                                  Navigator.popUntil(
                                      context,
                                      ModalRoute.withName(
                                          Navigator.defaultRouteName));
                                }),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
                // return Container(
                //   child: Center(
                //     child: Column(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: <Widget>[
                //         Text(
                //             "Your Aahnik for today has been succesfully added."),
                //         RaisedButton(
                //             color: Colors.orangeAccent,
                //             child: Text(
                //               'Go Back',
                //               style: TextStyle(color: Colors.white),
                //             ),
                //             onPressed: () {
                //               Navigator.popUntil(
                //                   context,
                //                   ModalRoute.withName(
                //                       Navigator.defaultRouteName));
                //             }),
                //       ],
                //     ),
                //   ),
                // );
              } else {
                return Form(
                  key: _formKey,
                  child: ListView(
                    children: <Widget>[
                      // Text(
                      //   "Add Today's Aahnik.",
                      //   style: TextStyle(fontSize: 18.0),
                      // ),
                      SizedBox(height: 10.0),
                      // RaisedButton(
                      //   child: Text('Click me to Set Date'),
                      //   color: pressAttention ? Colors.green : Colors.red,
                      //   onPressed: () {
                      //     showDatePicker(
                      //             context: context,
                      //             initialDate: DateTime.now(),
                      //             firstDate: DateTime(2020),
                      //             lastDate: DateTime(2022))
                      //         .then((date) {
                      //       setState(() {
                      //         _dateTime = date;
                      //         today = _dateTime.toString().split(" ");
                      //       });
                      //     });
                      //     setState(() => pressAttention = true);
                      //     today = new DateTime.now().toString().split(" ");
                      //     print(today);
                      //   },
                      // ),
                      SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(children: <Widget>[
                            SizedBox(
                              width: 20,
                            ),
                            Center(
                              child: Text(
                                "Aarti:",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 23,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 165,
                            ),
                            Container(
                              width: 100.0,
                              child: DropdownButtonFormField(
                                value: _currentAarti != null
                                    ? _currentAarti
                                    : _currentAarti = '0',
                                items: aarti.map((aarti) {
                                  return DropdownMenuItem(
                                    value: aarti,
                                    child: Text(
                                      '$aarti',
                                      textAlign: TextAlign.center,
                                    ),
                                  );
                                }).toList(),
                                onChanged: (val) =>
                                    setState(() => _currentAarti = val),
                              ),
                            ),
                          ])),
                      SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(children: <Widget>[
                            SizedBox(
                              width: 20,
                            ),
                            Center(
                              child: Text(
                                "Mansi:",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 23,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 150,
                            ),
                            Container(
                              width: 100.0,
                              child: DropdownButtonFormField(
                                value: _currentMansi != null
                                    ? _currentMansi
                                    : _currentMansi = '0',
                                items: mansi.map((mansi) {
                                  return DropdownMenuItem(
                                    value: mansi,
                                    child: Text(
                                      '$mansi',
                                      textAlign: TextAlign.center,
                                    ),
                                  );
                                }).toList(),
                                onChanged: (val) =>
                                    setState(() => _currentMansi = val),
                              ),
                            ),
                          ])),
                      SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(children: <Widget>[
                            SizedBox(
                              width: 20,
                            ),
                            Center(
                              child: Text(
                                "Nitya Prerna:",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 21,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 99,
                            ),
                            Container(
                              width: 100.0,
                              child: DropdownButtonFormField(
                                value: _currentNityap != null
                                    ? _currentNityap
                                    : _currentNityap = 'No',
                                items: nityap.map((nityap) {
                                  return DropdownMenuItem(
                                    value: nityap,
                                    child: Text(
                                      '$nityap',
                                      textAlign: TextAlign.center,
                                    ),
                                  );
                                }).toList(),
                                onChanged: (val) =>
                                    setState(() => _currentNityap = val),
                              ),
                            ),
                          ])),
                      SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(children: <Widget>[
                            SizedBox(
                              width: 15,
                            ),
                            Center(
                              child: Text(
                                "Vachnamrut &\n Swami Ni Vato:",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 22,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 70,
                            ),
                            Container(
                              width: 100.0,
                              child: DropdownButtonFormField(
                                value: _currentVanchan != null
                                    ? _currentVanchan
                                    : _currentVanchan = 'No',
                                items: vanchan.map((vanchan) {
                                  return DropdownMenuItem(
                                    value: vanchan,
                                    child: Text(
                                      '$vanchan',
                                      textAlign: TextAlign.center,
                                    ),
                                  );
                                }).toList(),
                                onChanged: (val) =>
                                    setState(() => _currentVanchan = val),
                              ),
                            ),
                          ])),
                      SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(children: <Widget>[
                            SizedBox(
                              width: 20,
                            ),
                            Center(
                              child: Text(
                                "Chesta:",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 23,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 140,
                            ),
                            Container(
                              width: 100.0,
                              child: DropdownButtonFormField(
                                value: _currentChesta != null
                                    ? _currentChesta
                                    : _currentChesta = 'No',
                                items: chesta.map((chesta) {
                                  return DropdownMenuItem(
                                    value: chesta,
                                    child: Text(
                                      '$chesta',
                                      textAlign: TextAlign.center,
                                    ),
                                  );
                                }).toList(),
                                onChanged: (val) =>
                                    setState(() => _currentChesta = val),
                              ),
                            ),
                          ])),
                      SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(children: <Widget>[
                            SizedBox(
                              width: 20,
                            ),
                            Center(
                              child: Text(
                                "Ghar Sabha:",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 21,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 100,
                            ),
                            Container(
                              width: 100.0,
                              child: DropdownButtonFormField(
                                value: _currentGharsabha != null
                                    ? _currentGharsabha
                                    : _currentGharsabha = 'No',
                                items: gharsabha.map((gharsabha) {
                                  return DropdownMenuItem(
                                    value: gharsabha,
                                    child: Text(
                                      '$gharsabha',
                                      textAlign: TextAlign.center,
                                    ),
                                  );
                                }).toList(),
                                onChanged: (val) =>
                                    setState(() => _currentGharsabha = val),
                              ),
                            ),
                          ])),
                      // SingleChildScrollView(
                      //     scrollDirection: Axis.horizontal,
                      //     child: Row(children: <Widget>[
                      //       SizedBox(
                      //         width: 20,
                      //       ),
                      //       Center(
                      //         child: Text(
                      //           "Sahajanad Namavali:",
                      //           textAlign: TextAlign.center,
                      //           style: TextStyle(
                      //             fontSize: 22,
                      //           ),
                      //         ),
                      //       ),
                      //       SizedBox(
                      //         width: 10,
                      //       ),
                      //       Container(
                      //         width: 100.0,
                      //         child: DropdownButtonFormField(
                      //           value: _currentSahan != null
                      //               ? _currentSahan
                      //               : _currentSahan = 'No',
                      //           items: sahan.map((sahan) {
                      //             return DropdownMenuItem(
                      //               value: sahan,
                      //               child: Text(
                      //                 '$sahan',
                      //                 textAlign: TextAlign.center,
                      //               ),
                      //             );
                      //           }).toList(),
                      //           onChanged: (val) =>
                      //               setState(() => _currentSahan = val),
                      //         ),
                      //       ),
                      //     ])),
                      SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(children: <Widget>[
                            SizedBox(
                              width: 20,
                            ),
                            Center(
                              child: Text(
                                "Jivan Charitra:",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 22,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 75,
                            ),
                            Container(
                              width: 100.0,
                              child: DropdownButtonFormField(
                                value: _currentJivan != null
                                    ? _currentJivan
                                    : _currentJivan = 'No',
                                items: jivan.map((jivan) {
                                  return DropdownMenuItem(
                                    value: jivan,
                                    child: Text(
                                      '$jivan',
                                      textAlign: TextAlign.center,
                                    ),
                                  );
                                }).toList(),
                                onChanged: (val) =>
                                    setState(() => _currentJivan = val),
                              ),
                            ),
                          ])),
                      SizedBox(height: 10.0),
                      SizedBox(
                        height: 100,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 50,
                            width: 140,
                            child: RaisedButton(
                                color: Colors.lightBlue,
                                child: Text(
                                  'Submit',
                                  style: TextStyle(color: Colors.white),
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(80.0))),
                                onPressed: () async {
                                  // print(today);
                                  // print(_currentAarti);
                                  // print(_currentMansi);
                                  // print(_currentNityap);
                                  // print(_currentVanchan);
                                  // print(_currentChesta);
                                  // print(_currentGharsabha);
                                  // print(_currentSahan);
                                  // print(_currentJivan);
                                  await DatabaseService(uid: user.uid)
                                      .addaahnikdata(
                                    _currentAarti,
                                    _currentMansi,
                                    _currentNityap,
                                    _currentVanchan,
                                    _currentChesta,
                                    _currentGharsabha,
                                    // _currentSahan,
                                    _currentJivan,
                                    today,
                                    month,
                                    name,
                                    // percent
                                  );
                                  // print(name);
                                  Navigator.popUntil(
                                      context,
                                      ModalRoute.withName(
                                          Navigator.defaultRouteName));
                                }),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
            }),
      ),
    );
  }
}
