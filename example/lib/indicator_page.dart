import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tab_indicator/flutter_tab_indicator.dart';

class IndicatorPage extends StatefulWidget {
  @override
  _IndicatorPageState createState() => _IndicatorPageState();

  final TabIndicator tabIndicator;
  final String title;

  const IndicatorPage({required this.tabIndicator, required this.title});
}

class _IndicatorPageState extends State<IndicatorPage>
    with SingleTickerProviderStateMixin {
  List<String> list = [
    'Follow',
    '推荐',
    'Popular',
    '视频',
    'Latest',
    '免费小说',
    '新时代',
    '抗疫',
    '小视频',
    '新时代',
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: list.length);
    setState() => _tabController.index = 0;
    _tabController.addListener(() {
      if (_tabController.index == _tabController.animation?.value) {
        if (kDebugMode) {
          print(_tabController.index);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(splashFactory: NoSplash.splashFactory,) ,
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
            bottom: TabBar(
              automaticIndicatorColorAdjustment: true,
              controller: _tabController,
              labelColor: Colors.redAccent,
              unselectedLabelColor: Colors.black,
              isScrollable: true,
              indicatorWeight: 0,
              indicator: widget.tabIndicator,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: list.map((e) => Tab(child: Text(e, style: const TextStyle(height: 1), //解决中文垂直居中问题
                      ))).toList(),
            ),
          ),
          body:TabBarView(
        controller: _tabController,
        children: list.map((String e) => Center(child:Text(e))).toList(),
      ),
    ));
  }
}
