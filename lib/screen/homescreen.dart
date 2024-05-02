import 'package:flutter/material.dart';
import 'package:network_to_file_image/network_to_file_image.dart';
import 'package:preloading/data/data.dart';
import 'package:preloading/model/model.dart';
import 'package:preloading/utils/utils.dart';
import 'package:preloading/widget/widget.dart';

class MainPage extends StatefulWidget {
  final String title;
  const MainPage({super.key, required this.title});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool loading = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => loadData());
  }

  Future loadData() async {
    setState(() {
      loading = true;
    });

    await Future.wait(fruits
        // ignore: non_constant_identifier_names
        .map((Fruit) => Utils.cacheImage(context, Fruit.urlImage))
        .toList());

    setState(() {
      loading = false;
    });
  }

  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            IconButton(
                onPressed: () {
                  loadData;
                },
                icon: const Icon(Icons.refresh))
          ],
        ),
        body: ListView.separated(
          physics:const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(12),
          itemCount: fruits.length,
           separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (BuildContext context,int index){
              final fruit=fruits[index];
              return loading? buildSkeleton(context):buildResult(fruit);
            } 
          ),
      );
      @override
  
  Widget buildSkeleton(BuildContext context)=>Row(
   children: <Widget>[
    SkeletonContainer.circular(
      width: 70,
      height: 70,
    ),
    SizedBox(width: 16,),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>
      [SkeletonContainer.rounded(
        width: MediaQuery.of(context).size.width*0.6,
        height: 25,
      ),
      const SizedBox(height:8,),
      SkeletonContainer.rounded(
        width: 60,
        height: 13,
      )
      ],
    )
   ],
  );



Widget buildResult(Fruit fruit)=>Row(
  children: <Widget>[
    Container(
      child: CircleAvatar(
        backgroundImage: NetworkToFileImage(
         url: fruit.urlImage,
         debug: false,
          ),
          radius: 35,
      ),
    ),
     const SizedBox(width: 16),
     Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(fruit.name,style: TextStyle(fontSize: 15),),
        const SizedBox(height: 8,),
        Text(fruit.description,style: TextStyle(fontSize: 13),)
      ],
     )
  ],
);



}
