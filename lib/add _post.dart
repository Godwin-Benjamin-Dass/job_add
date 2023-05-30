import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsForm extends StatefulWidget {
  @override
  _DetailsFormState createState() => _DetailsFormState();
}

class _DetailsFormState extends State<DetailsForm> {
  final _formKey = GlobalKey<FormState>();
  String? _name;
  String? _email;
  String? _phone;
  String? _jobtype;
  String? _salary;
  String? _requrements;
  String? _age;
  String? _location;
  PostAdv() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentuser = _auth.currentUser;

    final _CollectionReference =
        FirebaseFirestore.instance.collection("Adv_List").doc();
    return _CollectionReference.set({
      "Name": _name.toString(),
      "PhoneNumber": _phone.toString(),
      "Salary": _salary.toString(),
      "Age": _age.toString(),
      "job": _jobtype.toString(),
      // "Blood": value == 'Others' ? _BloodController.text : value,
      "Time": DateTime.now(),
      "email": _email.toString(),
      "id": _CollectionReference.id,
      "location": _location.toString(),
      "requirement": _requrements.toString(),
      "Status": "active",
      "posted": FirebaseAuth.instance.currentUser!.email.toString(),
    }).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Details Of The Members Has Been Added"),
        behavior: SnackBarBehavior.floating,
      ));
      Navigator.of(context).pop();
    }).catchError((onError) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("ERROR ${onError.toString()}"),
        behavior: SnackBarBehavior.floating,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Fill Details"),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Name'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _name = value;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Email'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _email = value;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Phone'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _phone = value;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Age'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _age = value;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Location'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter Location';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _location = value;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                          labelText:
                              'Type Writting, Data entry, App dev, etc..'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter requierd Job Type';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _jobtype = value;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration:
                          InputDecoration(labelText: 'Amount: 100, 200,...'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Salary';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _salary = value;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration:
                          InputDecoration(labelText: 'Experince Requiered...'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Experince';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _requrements = value;
                      },
                    ),
                  ),
                  ElevatedButton(
                    child: Text('Submit'),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        // do something with the data
                        PostAdv();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
