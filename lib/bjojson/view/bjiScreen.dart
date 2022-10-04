import 'package:flutter/material.dart';
import 'package:jsondata/bjojson/modal/bjoModal.dart';
import 'package:jsondata/bjojson/provider/bjoProvider.dart';
import 'package:provider/provider.dart';

class BjiScreen extends StatefulWidget {
  const BjiScreen({Key? key}) : super(key: key);

  @override
  State<BjiScreen> createState() => _BjiScreenState();
}

class _BjiScreenState extends State<BjiScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: FutureBuilder(
            future: Provider.of<BjoProvider>(context, listen: false)
                .getUserData(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('${snapshot.error}');
              } else if (snapshot.hasData) {
                List<dynamic> listdata = snapshot.data!;
                return Expanded(
                  child: ListView.builder(
                    itemCount: listdata.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Text('${listdata[index].id}'),
                         title: Text('${listdata[index].name}'),
                         trailing: Container(
                           width: 215,
                           child: Row(
                             children: [
                               Text(
                                   '${listdata[index].address!.city}\n\n\n'),
                               Text('${listdata[index].address!.suite}'),
                             ],
                           ),
                         ),
                         subtitle:
                             Text('${listdata[index].address!.street}'),
                      );
                    },
                  ),
                );
              }
              return CircularProgressIndicator();
            }),
      ),
    ));
  }
}
