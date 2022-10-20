import 'package:bankapp/Screens/quicksave.dart';
import 'package:bankapp/linkfile/providerlink/loader.dart';
import 'package:bankapp/pages/orders.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class saveme extends StatefulWidget {
  const saveme({super.key});

  @override
  State<saveme> createState() => _savemeState();
}

class _savemeState extends State<saveme> {
  final items = ['Daily', 'Weekly', 'Monthly'];
  late FixedExtentScrollController _scrollController;
  late TextEditingController _controller;
  final GlobalKey<FormState> _savekey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: items[index]);
    _scrollController = FixedExtentScrollController(initialItem: index);
  }

  int index = 0;
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _scrollController.dispose();
  }

  DateTime dateTime = DateTime.now();
  DateTime dateTime2 = DateTime.now();
  String finalday = DateTime.now().day.toString();
  String finalmonth = DateTime.now().month.toString();
  String finalyear = DateTime.now().year.toString();
  late String amount;
  var append;
  List listmonths = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];
  @override
  Widget build(BuildContext context) {
    final day = context.watch<timepicker>().finalday;
    var dayint = int.parse(day.split('')[1]);

    if (dayint == 1) {
      append = 'st';
    } else if (dayint == 2) {
      append = 'nd';
    } else if (dayint == 3) {
      append = 'rd';
    } else {
      append = 'th';
    }
    final month = context.watch<timepicker>().finalmonth;
    final year = context.watch<timepicker>().finalyear;
    var monthint = listmonths[int.parse(month) - 1];

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
                    Text(
                      'Amount:',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
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
                    Text(
                      'How will you like to save:',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        _scrollController.dispose();
                        _scrollController =
                            FixedExtentScrollController(initialItem: index);
                        showCupertinoModalPopup(
                            context: context,
                            builder: (context) => CupertinoActionSheet(
                                  title: Container(
                                    child: Text(
                                      'How will you like to save',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ),
                                  cancelButton: CupertinoActionSheetAction(
                                      child: Text(
                                        'Cancel',
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).primaryColor),
                                      ),
                                      onPressed: (() =>
                                          Navigator.pop(context))),
                                  actions: [
                                    buildpicker(),
                                  ],
                                ));
                      },
                      child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1,
                                  color: Color.fromARGB(255, 101, 101, 101)),
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                children: [
                                  Text(
                                    items[
                                        context.watch<savingprovider>().index],
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Next Withdrawal:',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        showCupertinoModalPopup(
                            context: context,
                            builder: (context) => CupertinoActionSheet(
                                  title: Container(
                                    child: Text(
                                      'When will you like to withdraw your savings',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ),
                                  cancelButton: CupertinoActionSheetAction(
                                      child: Text(
                                        'Done',
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).primaryColor),
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                        final value = dateTime.toString();
                                        final splithis = value.split(' ')[0];
                                        finalmonth = splithis.split('-')[1];
                                        finalday = splithis.split('-')[2];
                                        finalyear = splithis.split('-')[0];
                                      }),
                                  actions: [
                                    buildpicker2(),
                                  ],
                                ));
                      },
                      child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1,
                                  color: Color.fromARGB(255, 101, 101, 101)),
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                children: [
                                  Text(
                                    '${day}${append}, ${monthint} ${year}',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      // color: Colors.red,
                      height: MediaQuery.of(context).size.height * 0.045,
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: FittedBox(
                          child: Text(
                        'Calculator:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      //color: Colors.red,
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Text(
                        context.watch<calculatesavings>().decide
                            ? 'Enter amount to get a Calculation'
                            : context.watch<calculatesavings>().restrict
                                ? "You Can't Save less than ₦200 ${items[context.watch<savingprovider>().index]}"
                                : context.watch<calculatesavings>().status
                                    ? '${context.watch<calculatesavings>().getText}'
                                    : '${context.watch<calculatesavings>().getText}${day}${append}, ${monthint} ${year}',
                        style: context.watch<calculatesavings>().restrict
                            ? TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.red)
                            : TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor),
                        softWrap: true,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 60,
                      child: CupertinoButton(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(5.0),
                        onPressed: () {
                          //  print(context.watch<timepicker>().getdate);
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (context) => register()));
                        },
                        child: Text(
                          'Turn on Autosave',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 60,
                      child: CupertinoButton(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0),
                        onPressed: () {
                          Navigator.of(context).pushNamed('/saveinstant');
                        },
                        child: Text(
                          'Quick Save',
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                      ),
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

  SizedBox buildpicker() {
    return SizedBox(
      height: 200,
      child: StatefulBuilder(
        builder: (context, setState) => CupertinoPicker(
          scrollController: _scrollController,
          selectionOverlay: CupertinoPickerDefaultSelectionOverlay(
            background: Theme.of(context).primaryColor.withOpacity(0.3),
          ),
          itemExtent: 60,
          children: List.generate(items.length, (index) {
            final isSelected =
                this.context.watch<savingprovider>().index == index;
            final item = items[index];
            final color = isSelected
                ? CupertinoColors.activeBlue
                : CupertinoColors.black.withOpacity(.5);
            return Center(
              child: Text(
                item,
                style: TextStyle(fontSize: 23, color: color),
              ),
            );
          }),
          onSelectedItemChanged: (index) {
            context.read<savingprovider>().showindex(index);
            context.read<calculatesavings>().getDaily(index);
            setState(() {
              this.index = index;
            });
          },
        ),
      ),
    );
  }

  SizedBox buildpicker2() {
    return SizedBox(
      height: 200,
      child: CupertinoDatePicker(
        // minimumYear: dateTime2.year,
        minimumDate: dateTime2,
        mode: CupertinoDatePickerMode.date,
        //initialDateTime: dateTime,
        onDateTimeChanged: (dateTime) {
          final thisdate = dateTime;
          final value = dateTime.toString();
          final splithis = value.split(' ')[0];
          finalmonth = splithis.split('-')[1];
          finalday = splithis.split('-')[2];
          finalyear = splithis.split('-')[0];
          context
              .read<timepicker>()
              .showindex(finalday, finalmonth, finalyear, thisdate);
          context.read<calculatesavings>().getDate(thisdate);
        },
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
