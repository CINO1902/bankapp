import 'package:bankapp/Screens/createbudget.dart';
import 'package:bankapp/linkfile/providerlink/loader.dart';
import 'package:bankapp/linkfile/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class quicksave extends StatefulWidget {
  const quicksave({super.key});

  @override
  State<quicksave> createState() => _quicksaveState();
}

class _quicksaveState extends State<quicksave> {
  final GlobalKey<FormState> _savekey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  int index = 0;
  @override
  void dispose() {
    super.dispose();
  }

  DateTime dateTime = DateTime.now();
  DateTime dateTime2 = DateTime.now();
  String finalday = DateTime.now().day.toString();
  String finalmonth = DateTime.now().month.toString();
  String finalyear = DateTime.now().year.toString();
  late String amount;
  var append;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: CupertinoPageScaffold(
            child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.080,
            horizontal: MediaQuery.of(context).size.width * 0.040,
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.arrow_back,
                    size: 32,
                    color: Colors.black54,
                  ),
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      //color: Colors.red,
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: FittedBox(
                          child: Text(
                        'My Savings balance',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                    ),
                    Container(
                      //color: Colors.red,
                      height: MediaQuery.of(context).size.height * 0.045,
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: FittedBox(
                          child: Text(
                        '₦0.00',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                    ),
                    Container(
                      //color: Colors.red,
                      height: MediaQuery.of(context).size.height * 0.04,
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: FittedBox(
                          child: Text(
                        'Build your savings daily, weekly or Monthly',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                    )
                  ],
                ),
              ),
              Form(
                key: _savekey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Amount:',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          context.watch<getdetails>().balance,
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      validator: _validateAmout,
                      onSaved: (value) => setState(() {
                        amount = value!;
                      }),
                      onChanged: ((value) =>
                          context.read<calculatesavings>().getamount(value)),
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
                          hintText: '100.00'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 60,
                      child: CupertinoButton(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(5.0),
                        onPressed: () {
                          // print(context.watch<timepicker>().getdate);
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (context) => register()));
                        },
                        child: Text(
                          'Quick Save',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              )
            ],
          ),
        )),
      ),
    );
  }

  String? _validateAmout(String? value) {
    if (value!.length == 0) {
      return "Please Input an Amount";
    } else if (int.parse(value) < 200) {
      return "You can't save less than ₦200";
    }
  }
}
