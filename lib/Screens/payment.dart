import 'package:bankapp/linkfile/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class transfer extends StatefulWidget {
  const transfer({super.key});

  @override
  State<transfer> createState() => _transferState();
}

class _transferState extends State<transfer> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  String? bank;
  List<Map> _myjson = [
    {
      "id": "1",
      "name": "Access Bank",
      "code": "044",
      "image": "images/logo/acess.png"
    },
    {
      "id": "2",
      "name": " Access Diamond Bank",
      "code": "023",
      "image": "images/logo/acess.png"
    },
    {
      "id": "3",
      "name": "Citibank",
      "code": "063",
      "image": "images/logo/Citibank-Logo.png"
    },
    {
      "id": "4",
      "name": "Dynamic Standard Bank",
      "code": "",
      "image": "images/logo/standard.jpg"
    },
    {
      "id": "5",
      "name": "Ecobank Nigeria",
      "code": "050",
      "image": "images/logo/Ecobank_Logo.jpg"
    },
    {
      "id": "6",
      "name": "Fidelity Bank Nigeria",
      "code": "070",
      "image": "images/logo/fidelity.png"
    },
    {
      "id": "7",
      "name": "First Bank of Nigeria",
      "code": "011",
      "image": "images/logo/First_Bank_of_Nigeria_logo.png"
    },
    {
      "id": "8",
      "name": "First City Monument Bank",
      "code": "214",
      "image": "images/logo/FCMB_Logo.png"
    },
    {
      "id": "9",
      "name": "Guaranty Trust Bank",
      "code": "058",
      "image": "images/logo/GTBank_logo.svg.png"
    },
    {
      "id": "10",
      "name": "Heritage Bank Plc",
      "code": "030",
      "image": "images/logo/heritage-bank.jpg"
    },
    {
      "id": "11",
      "name": "Jaiz Bank",
      "code": "301",
      "image": "images/logo/ng-jaizbank-logo.png"
    },
    {
      "id": "12",
      "name": "Keystone Bank Limited",
      "code": "082",
      "image": "images/logo/Keystone-Bank-Logo.jpg"
    },
    {
      "id": "13",
      "name": "Providus Bank Plc",
      "code": "101",
      "image": "images/logo/Providus-Bank.png"
    },
    {
      "id": "14",
      "name": "Polaris Bank",
      "code": "076",
      "image": "images/logo/New-Polaris-Logo.png"
    },
    {
      "id": "15",
      "name": "Stanbic IBTC Bank Nigeria Limited",
      "code": "221",
      "image": "images/logo/standard.jpg"
    },
    {
      "id": "16",
      "name": "Standard Chartered Bank",
      "code": "068",
      "image": "images/logo/standardchartered@2x.png"
    },
    {
      "id": "17",
      "name": "Sterling Bank",
      "code": "232",
      "image": "images/logo/ng-sterln-logo.png"
    },
    {
      "id": "18",
      "name": "Suntrust Bank Nigeria Limited",
      "code": "100",
      "image": "images/logo/MR5I2VBHGJHMHKDBIXJLILCV6Y.png"
    },
    {
      "id": "19",
      "name": "Union Bank of Nigeria",
      "code": "032",
      "image": "images/logo/Union-Bank.png"
    },
    {
      "id": "20",
      "name": "United Bank for Africa",
      "code": "033",
      "image": "images/logo/uba.jpeg.webp"
    },
    {
      "id": "21",
      "name": "Unity Bank Plc",
      "code": "215",
      "image": "images/logo/ng-unityb-logo.png"
    },
    {
      "id": "22",
      "name": "Wema Bank",
      "code": "035",
      "image": "images/logo/Wema-Bank.jpg"
    },
    {
      "id": "23",
      "name": "Zenith Bank",
      "code": "057",
      "image": "images/logo/Zenith_Bank_logo.svg.png"
    }
  ];

  @override
  Widget build(BuildContext context) {
    final getdetail = Provider.of<getdetails>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          'Transfer to recipitent',
          style: TextStyle(
            color: Colors.white,
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: CupertinoPageScaffold(
        child: SingleChildScrollView(
          child: Container(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.04,
                  left: MediaQuery.of(context).size.width * 0.06,
                ),
                child: Text(
                  'SOURCE ACCOUNT',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(.5)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Card(
                  elevation: 2.5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Theme.of(context).colorScheme.primaryContainer,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.09,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: CircleAvatar(
                                radius:
                                    MediaQuery.of(context).size.height * 0.032,
                                backgroundImage: AssetImage('images/caleb.png'),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                    margin: EdgeInsets.only(
                                      // horizontal: MediaQuery.of(context).size.height * 0.01,
                                      top: MediaQuery.of(context).size.width *
                                          0.03,
                                    ),
                                    height: MediaQuery.of(context).size.height *
                                        0.029,
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    child: FittedBox(
                                        child: Text(
                                      'Caleb Oruta',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ))),
                                Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.03,
                                    width: MediaQuery.of(context).size.width *
                                        0.25,
                                    child: Text(
                                      'Account 1',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSurface
                                              .withOpacity(.5)),
                                    )),
                              ],
                            ),
                          ],
                        ),
                        Container(
                            margin: EdgeInsets.symmetric(
                              // horizontal: MediaQuery.of(context).size.height * 0.01,
                              vertical:
                                  MediaQuery.of(context).size.width * 0.03,
                            ),
                            height: MediaQuery.of(context).size.height * 0.023,
                            width: MediaQuery.of(context).size.width * 0.25,
                            child: FittedBox(
                                child: Text(
                              '${getdetail.balance}',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color:
                                      Theme.of(context).colorScheme.onSurface),
                            ))),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Form(
                  key: _key,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Amount:',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          //   validator: _validateName,
                          onSaved: (value) => setState(() {
                            // ID = value!;
                          }),
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                              errorBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 1.0),
                              ),
                              focusedErrorBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 1.7),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 101, 101, 101),
                                    width: 1.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 101, 101, 101),
                                    width: 1.7),
                              ),
                              labelText: 'Amount',
                              labelStyle: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onSurface)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Bank:',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 60,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1,
                                  color: Color.fromARGB(255, 101, 101, 101)),
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: DropdownButtonHideUnderline(
                                    child: ButtonTheme(
                                  alignedDropdown: true,
                                  child: DropdownButton<String>(
                                    isDense: true,
                                    hint: Text('Select Bank'),
                                    value: bank,
                                    onChanged: (value) => setState(() {
                                      bank = value!;
                                    }),
                                    items: _myjson.map((Map map) {
                                      return DropdownMenuItem<String>(
                                          value: map["id"].toString(),
                                          child: Row(
                                            children: [
                                              Image.asset(
                                                map["image"],
                                                width: 20,
                                              ),
                                              Container(
                                                margin:
                                                    EdgeInsets.only(left: 10),
                                                child: Text(map["name"]),
                                              )
                                            ],
                                          ));
                                    }).toList(),
                                  ),
                                )),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Account Number:',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          //validator: _validateEmail,
                          onSaved: (value) => setState(() {
                            // PIN = value!;
                          }),
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            errorBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 1.0),
                            ),
                            focusedErrorBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 1.7),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 101, 101, 101),
                                  width: 1.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 101, 101, 101),
                                  width: 1.7),
                            ),

                            // hintText: 'Enter Your Email Here',
                            labelText: '0123456789',
                            labelStyle: TextStyle(
                                color: Theme.of(context).colorScheme.onSurface),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Add a note:',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          //validator: _validateEmail,
                          onSaved: (value) => setState(() {
                            // PIN = value!;
                          }),
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                              errorBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 1.0),
                              ),
                              focusedErrorBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 1.7),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 101, 101, 101),
                                    width: 1.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 101, 101, 101),
                                    width: 1.7),
                              ),

                              // hintText: 'Enter Your Email Here',
                              labelText: 'What is this for?',
                              labelStyle: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onSurface)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.width * 0.0,
                            MediaQuery.of(context).size.height * 0.0,
                            MediaQuery.of(context).size.width * 0.0,
                            MediaQuery.of(context).size.height * 0.0,
                          ),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: 60,
                            child: CupertinoButton(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(5.0),
                              onPressed: () {
                                // _sendToServer();
                              },
                              child: Text(
                                'Next',
                                style: TextStyle(color: CupertinoColors.white),
                              ),
                            ),
                          ),
                        ),
                      ]),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
