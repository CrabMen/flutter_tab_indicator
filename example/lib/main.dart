import 'package:flutter/material.dart';
import 'package:flutter_tab_indicator/flutter_tab_indicator.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: FlutterAwesomeSegment(),) ;
  }
}

class FlutterAwesomeSegment extends StatefulWidget {
  @override
  _FlutterAwesomeSegmentState createState() => _FlutterAwesomeSegmentState();
}

class _FlutterAwesomeSegmentState extends State<FlutterAwesomeSegment> with SingleTickerProviderStateMixin{

  List <String> list = [
    '关注',
    '推荐',
    '热榜',
    '科技',
    '免费小说',
    '关注',
    '关注',
    '新时代',
    '抗疫',
    '问答',
    '数码',
    '要闻',
    '视频',
  ];


  late TabController _tabController;//注意 在TabBar和TabBarView中都需要配置controller
  var color = Colors.red;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: list.length);
    setState(() {
      _tabController.index=1;
    });
    //监听器
    _tabController.addListener(() {
      //点击切换tab的时候执行了一个动画效果，滑动切换的时候是没有的，在这个过程中触发了一次Listener,所以触发了两次addListener方法
      // 解决点击tab执行2次的问题
      if(_tabController.index ==_tabController.animation?.value) {
        //实现自定义的功能
        print(_tabController.index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:  Theme(
          child: TabBar(
            labelStyle: const TextStyle(fontSize: 13),
            unselectedLabelStyle: const TextStyle(fontSize: 10),
            automaticIndicatorColorAdjustment: true,
            controller: _tabController,
            indicatorColor: Colors.redAccent,
            labelColor: color,
            unselectedLabelColor: Colors.black,
            isScrollable: true,
            indicatorWeight: 0,
            indicator: const TabIndicatior(),
            indicatorSize: TabBarIndicatorSize.tab,
            tabs:  list.map((e) => SizedBox( width: 60,child:Tab(text:e ,))).toList(),
            onTap: (index){
              setState(() {
                color = index%2 == 0 ? Colors.red : Colors.green;
              });
            },
          ),
          data:Theme.of(context).copyWith(splashFactory: NoSplash.splashFactory),
        )
    );

  }
}

