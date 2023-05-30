import 'package:add_app/job_detail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class See_advs extends StatefulWidget {
  const See_advs({super.key});

  @override
  State<See_advs> createState() => _See_advsState();
}

class _See_advsState extends State<See_advs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Advertisements"),
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

                    return Card(
                      elevation: 5,
                      child: ListTile(
                        leading: Icon(
                          Icons.work,
                          size: 40,
                          color: Colors.red,
                        ),
                        title: Text(
                          "Job Name: " + x['job'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        subtitle: Text("Publiser Name: " + x['Name']),
                        onTap: () => [
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Job_prof(inst: snapshot.data!.docs[i])))
                        ],
                      ),
                    );
                  });
            }),
      ),
    );
  }
}
