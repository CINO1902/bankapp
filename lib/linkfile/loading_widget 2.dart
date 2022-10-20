// import 'package:flutter/material.dart';

// class LoadingWidget extends StatefulWidget {
//   const LoadingWidget({super.key});

//   @override
//   State<LoadingWidget> createState() => _LoadingWidgetState();
// }

// class _LoadingWidgetState extends State<LoadingWidget> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     // Future.delayed(const Duration(seconds: 72)).then((value) {
//     //   setState(() {});
//     // });
//   }

//   bool isVisible = true;
//   bool isVisible2 = false;
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(children: [
//         Visibility(
//           visible: isVisible,
//           child: Container(
//             padding: const EdgeInsets.all(15),
//             height: 100,
//             width: 100,
//             child: Image.asset(
//               "images/loading.gif",
//               height: 125.0,
//               width: 125.0,
//             ),
//           ),
//         ),
//       ]),
//     );
//   }
// }

// class retry extends StatelessWidget {
//   const retry({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         padding: const EdgeInsets.all(15),
//         height: 70,
//         width: 100,
//         child: ElevatedButton(
//           style: ButtonStyle(
//               backgroundColor: MaterialStateProperty.all<Color>(
//             Theme.of(context).primaryColor,
//           )),
//           onPressed: () {},
//           child: Text('Retry'),
//         ));
//   }
// }
