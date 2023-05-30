import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';

class Job_prof extends StatelessWidget {
  var inst;
  Job_prof({this.inst});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Job Name: ${inst['job']}"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Poster Name:",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                inst['Name'],
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              Text(
                "Poster Ph.No:",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                inst['PhoneNumber'],
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              Text(
                "Poster Email:",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                inst['email'],
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              Text(
                "Job Type:",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                inst['job'],
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              Text(
                "Location:",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                inst['location'],
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              Text(
                "Age Criteria:",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                inst['Age'],
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              Text(
                "Experiece Needed:",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                inst['requirement'],
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              Text(
                "Salary Told:",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                inst['Salary'],
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(18.0),
              //   child: ElevatedButton(
              //       onPressed: () async {
              //         var url =
              //             "https://api.whatsapp.com/send?phone=${inst['PhoneNumber']}&text=I'm%20Willing%20To%20work%20For%20You";

              //         if (await canLaunch(url)) {
              //           await launch(url);
              //         } else {
              //           throw "cannot launch $url";
              //         }
              //       },
              //       child: Text("Contact")),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
