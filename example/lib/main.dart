import 'package:flutter/material.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';
import 'package:scroll_date_picker/src1/models/be_date_time.dart';

void main() {
  runApp(MaterialApp(home: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  BEDateTime _selectedDate = BEDateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scroll Date Picker Example"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 100,
            alignment: Alignment.center,
            child: Text(
              "$_selectedDate",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 48),
            child: TextButton(
              onPressed: () {
                setState(() {
                  _selectedDate = BEDateTime.now();
                });
              },
              child: Text(
                "TODAY",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ),
          SizedBox(
            height: 250,
            child: ScrollDatePicker(
              indicatorColor: Colors.red.withOpacity(0.1),
              maximumDate: BEDateTime(2600),
              minimumDate: BEDateTime(2500),
              scrollViewOptions: DatePickerScrollViewOptions(
                year: ScrollViewDetailOptions(
                  alignment: Alignment.center,
                  selectedTextStyle: TextStyle(color: Colors.red,fontSize: 18,fontWeight: FontWeight.bold),
                ),
                month: ScrollViewDetailOptions(
                  alignment: Alignment.center,
                  selectedTextStyle: TextStyle(color: Colors.red,fontSize: 18,fontWeight: FontWeight.bold),
                ),
                day: ScrollViewDetailOptions(
                  alignment: Alignment.center,
                  selectedTextStyle: TextStyle(color: Colors.red,fontSize: 18,fontWeight: FontWeight.bold),
                ),
              ),
              options: DatePickerOptions(
                perspective: 0.000000000000001
              ),
              selectedDate: _selectedDate,
              locale: Locale('en'),
              onDateTimeChanged: (BEDateTime value) {
                setState(() {
                  _selectedDate = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
