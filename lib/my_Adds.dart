import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class my_Ads extends StatefulWidget {
  const my_Ads({super.key});

  @override
  State<my_Ads> createState() => _my_AdsState();
}

class _my_AdsState extends State<my_Ads> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Ads"),
      ),
      body: Center(
        child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("Adv_List")
                .orderBy('Time')
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, i) {
                    QueryDocumentSnapshot x = snapshot.data!.docs[i];
                    if (x['posted'] ==
                        FirebaseAuth.instance.currentUser!.email) {
                      return Card(
                        elevation: 5,
                        child: ListTile(
                          leading: Icon(
                            Icons.work,
                            size: 40,
                            color: Colors.green,
                          ),
                          title: Text(
                            "Job Name: " + x['job'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          subtitle: Text("Ph.No: " + x['PhoneNumber']),
                          trailing: IconButton(
                              onPressed: () {
                                FirebaseFirestore.instance
                                    .collection("Adv_List")
                                    .doc(x['id'])
                                    .delete()
                                    .then((value) => {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            content: Text(
                                                "Your Job Request Is Removed"),
                                            behavior: SnackBarBehavior.floating,
                                          ))
                                        });
                              },
                              icon: Icon(
                                Icons.done,
                                color: Colors.red,
                              )),
                        ),
                      );
                    } else {
                      return Container();
                    }
                  });
            }),
      ),
    );
  }
}
