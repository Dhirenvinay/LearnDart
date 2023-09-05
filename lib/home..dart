import 'package:flutter/material.dart';
import 'package:uiassignment/model/dummy_data.dart';
import 'package:uiassignment/widget/filterbutton.dart';
import 'package:uiassignment/widget/bottomnavigation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.data,required this.intro}) : super(key: key);
  final List<Dummy_Data> data;
  final List<Dummy_Data> intro;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {

  int selectedIndex = 0;
  String searchText = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffD3D3D3),
      appBar: AppBar(title: const  Text('EXAMPLES'),
    centerTitle: true,
    backgroundColor: Colors.white,
      elevation: 0.0,
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.person)),
      ],),
      body: Column(children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: 50,
          margin: const EdgeInsets.only(left: 20,top: 20,),

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey),
          color: Colors.white,

          ),
          child: Row(children: [
            const Padding(
              padding:  EdgeInsets.all(8.0),
              child: Icon(Icons.search),
            ),
            Expanded(
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      searchText = value.toLowerCase();
                    });
                  },
                  decoration:const InputDecoration(hintText: 'Search for Examples',border: InputBorder.none),
            ))
          ],),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
        children: [
        FilterButton(
        isSelected: selectedIndex == 0,
          onTap: () {
            setState(() {
              selectedIndex = 0;
            });
          },
          text: 'All Topics',
        ),
          FilterButton(
          isSelected: selectedIndex == 1,
          onTap: () {
            setState(() {
              selectedIndex = 1;
            });
},
          text: 'Introduction',
        ),
        FilterButton(
          isSelected: selectedIndex == 2,
          onTap: () {
            setState(() {
              selectedIndex = 2;
            });
            // Handle the onTap event here
          },
          text: 'Decision Making & Loop',
        ),
        FilterButton(
          isSelected: selectedIndex == 3,
          onTap: () {
            setState(() {
              selectedIndex = 3;
            });
          },
          text: 'Fundamental',
        ),
      ],
      ),
        ),
        const  SizedBox(height: 15,),
        if(selectedIndex ==0 )
          Expanded(
            child: ListView.builder(
              itemCount: widget.data.length,
              itemBuilder: (context, index) {
                final item = widget.data[index];
                if (item.title.toLowerCase().contains(searchText.toLowerCase())) {
                  return Container(
                    height: 100,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey,width: 0.5),
                        color: Colors.white
                    ),
                    child: Row(children: [
                      Container(
                          height: 40,
                          width: 40,
                          margin:const  EdgeInsets.all(8),
                          decoration:  const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.lightBlueAccent,
                          ),
                          child: Center(child: Text('${item.num}',
                            style: const TextStyle(fontSize: 20),))),
                      const  SizedBox(width: 10,),
                      Expanded(child: Text(item.title, style: const TextStyle(fontSize: 20),)),
                    ],),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ),

        if(selectedIndex == 1)
        Expanded(
          child: ListView.builder(
            itemCount: widget.intro.length,
            itemBuilder: (context, index) {
              final item = widget.intro[index];
              if (item.title.toLowerCase().contains(searchText)) {
                return Container(
                  height: 100,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      color: Colors.white
                  ),
                  child: Row(children: [
                    Container(
                        height: 40,
                        width: 40,

                        margin: const EdgeInsets.all(8),
                        decoration:const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.lightBlueAccent,

                        ),
                        child: Center(child: Text('${item.num}',
                          style: const TextStyle(fontSize: 15),))),
                    const SizedBox(width: 10,),
                    Expanded(child: Text(item.title, style: const TextStyle(fontSize: 20),)),
                  ],),
                );
              }
              else {
                return  const SizedBox();
              }
            },
          ),
        ),
      ],
    ),
      bottomNavigationBar: const MyBottomNavigationBar(),
    );
  }
}


