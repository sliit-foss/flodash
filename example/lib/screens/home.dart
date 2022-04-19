import 'package:example/services/user_service.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Enhanced Cloud Firestore Demo",
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.black,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Expanded(
            child: FutureBuilder(
              future: UserService.fetchUsers(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text(
                            snapshot.data[index]['name'],
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          subtitle: Text(
                            snapshot.data[index]['email'],
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        );
                      });
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                ),
                onPressed: () async {
                  await UserService.deleteUsers();
                  setState(() {});
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                  child: Text(
                    "Clear users",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 60,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () async {
                  await UserService.addUser();
                  setState(() {});
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                  child: Text(
                    "Add random user",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
