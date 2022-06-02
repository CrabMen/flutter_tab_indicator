import 'package:flutter/material.dart';
import 'package:flutter_tab_indicator/flutter_tab_indicator.dart';
import 'package:flutter_tab_indicator_example/indicator_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> titles = [
    '下划线',
    '下划线_固定宽度',
    '圆点',
    '圆点_上方',
    '遮罩',
  ];

  TabIndicatior getIndicator(int index) {
   if (index == 0) {
     return const TabIndicatior();
   } else if (index == 1) {
     return const TabIndicatior(width: 20);
   } else if (index == 2) {
     return const TabIndicatior(width: 4,height: 4,radius: 2);
   } else if (index == 3) {
     return const TabIndicatior(width: 4,height: 4,radius: 2,align: TabIndicatiorAlignVertical.up);
   }else if (index == 4) {
     return const TabIndicatior(
       align: TabIndicatiorAlignVertical.center,
       height:26,
       radius: 13,
       padding: EdgeInsets.symmetric(horizontal: -12,vertical: 0),
       color: Color.fromARGB(100, 26, 26, 255),
     );
   } else {
     return const TabIndicatior();
   }
  }
  void onTap(int index) {
    String title = titles[index];
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return IndicatorPage(
        tabIndicatior: getIndicator(index),
        title: title,
      );
    }));
  }

//buildListTile相当于ListView的Adapter
  Widget buildListTile(BuildContext context, String item) {
    return ListTile(
      title: Text(item),
      trailing: const Icon(Icons.arrow_right),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('example')),
      body: ListView.separated(
        itemCount: titles.length,
        itemBuilder: (BuildContext context, int index) => ListTile(
          title: Text(titles[index]),
          trailing: const Icon(Icons.arrow_right),
          onTap: () => onTap(index),
        ),
        separatorBuilder: (BuildContext context, int index) =>
            const Divider(height: 1.0, color: Colors.black38),
      ),
    );
  }
}
