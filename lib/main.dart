import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DatePickerPage(),
    );
  }
}

class DatePickerPage extends StatefulWidget {
  const DatePickerPage({Key? key}) : super(key: key);

  @override
  State<DatePickerPage> createState() => _DatePickerPageState();
}

class _DatePickerPageState extends State<DatePickerPage> {
  TextEditingController dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Date Picker"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: TextFormField(
            controller: dateController,
            decoration: InputDecoration(
              hintText: "Choose date",
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey, width: 1),
              ),
              prefixIcon: Icon(
                Icons.calendar_month_outlined,
                color: Colors.grey,
                size: 18,
              ),
            ),
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1950),
                  lastDate: DateTime(2100));

              if (pickedDate != null) {
                print(pickedDate);
                String formattedDate =
                    DateFormat('yyyy-MM-dd').format(pickedDate);
                print(formattedDate);
                setState(() {
                  dateController.text = formattedDate;
                });
              } else {}
            },
          ),
        ),
      ),
    );
  }
}
