import 'package:flutter/material.dart';
import 'package:jsondata/userScreen/modal/homeModal.dart';
import 'package:jsondata/userScreen/provider/homeProvider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: FutureBuilder(
            future: Provider.of<HomeProvider>(context, listen: false)
                .getUserData(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('${snapshot.error}');
              } else if (snapshot.hasData) {
                List listdata = snapshot.data!;

                return Expanded(
                  child: ListView.builder(
                      itemCount: listdata.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          subtitle: Text('${listdata[index].userId}'),
                          title: Text('${listdata[index].title}'),
                          leading: Text('${listdata[index].id}'),
                        );
                      }),
                );
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
