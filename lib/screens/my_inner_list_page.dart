import 'package:flutter/material.dart';

class MyInnerListPage extends StatefulWidget {
  const MyInnerListPage({Key? key}) : super(key: key);

  @override
  State<MyInnerListPage> createState() => _MyInnerListPageState();
}

class _MyInnerListPageState extends State<MyInnerListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            title: const Text("Title"),
            expandedHeight: 200,
            flexibleSpace: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Positioned.fill(
                    child: Image.network(
                  "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                  fit: BoxFit.cover,
                )),
                Positioned.fill(
                    child: Image.network(
                  "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                  fit: BoxFit.cover,
                )),
                Positioned.fill(
                    child: Image.network(
                  "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                  fit: BoxFit.cover,
                ))
              ],
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(childCount: 10,
                  (BuildContext context, index) {
            return Container(
              height: 100,
              child: Text("Text"),
            );
          })),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 4.0,
            ),
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.teal[100 * (index % 9)],
                  child: Text('Grid Item $index'),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}

//
// Column(
// children: [
// Expanded(
// child: ListView(
// physics: BouncingScrollPhysics(),
// shrinkWrap: true,
// children: [
// SizedBox(
// height: MediaQuery.of(context).size.width / 3,
// child: Row(
// children: [
// Text("CATEGORY"),
// Expanded(
// child: ListView.builder(
// scrollDirection: Axis.horizontal,
// itemCount: 200,
// itemBuilder: (BuildContext c, index) {
// return Container(
// height: 100,
// color: Colors.blueAccent,
// child: Text("Text"),
// );
// }),
// )
// ],
// ),
// ),
// ...List.generate(
// 100,
// (index) => Text("HELLO"),
// ),
// ListView.builder(
// physics: ClampingScrollPhysics(),
// shrinkWrap: true,
// itemCount: 100,
// itemBuilder: (BuildContext context, index) {
// return Container(
// height: 50,
// color: Colors.red.shade400,
// child: const Center(child: Text('Entry B')),
// );
// })
// ],
// ))
// ],
// ),
