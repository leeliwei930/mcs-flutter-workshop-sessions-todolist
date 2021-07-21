import 'package:flutter/material.dart';
import 'package:todolist/utils/text_styles.dart';


class Tabs extends StatefulWidget {
  
  final List<TabItem> tabs;
  final Function? onTabChanged;

  
  const Tabs({Key? key, required this.tabs, this.onTabChanged}) : super(key: key);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {

  // storing active tab index
  int activeTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: _buildTabItems(),
    );
  }

  // rebuild a list of tab item, inject onTabChanged method
  List<TabItem> _buildTabItems() {
    List<TabItem> tabs = <TabItem>[];
    widget.tabs.asMap().forEach((index, element) {
      // evaluate whether the tab is active by checking the active state index and the current tab index
      bool isActive = this.activeTabIndex == index;

      tabs.add(TabItem(
        title: element.title,
        active: isActive,
        onTap: () => _onTabChanged(index),
      ));
    });

    return tabs;

  }

  void _onTabChanged(int index) {
    setState(() {
      this.activeTabIndex = index;

      // check the callback function provided
      if(widget.onTabChanged != null){
        // if is provided then call the user provided function callback
        this.widget.onTabChanged!(index);
      }
    });
  }
}


class TabItem extends StatefulWidget {
  final bool active;
  final Function? onTap;
  final String title;


  TabItem({Key? key, this.active = false, this.onTap, required this.title}) : super(key: key);

  @override
  _TabItemState createState() => _TabItemState();
}

class _TabItemState extends State<TabItem> with SingleTickerProviderStateMixin {

  late AnimationController animationController;
  late Animation<TextStyle> textStyleTween;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Create animation controller with the duration of 0.5 seconds
    this.animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 500),
      reverseDuration: Duration(milliseconds: 500)
    );
  }
  @override
  Widget build(BuildContext context) {
    // text tween the move the transition of the text style from inactive or active in bi-directional
    this.textStyleTween = TextStyleTween(
      begin:kInactiveTabTextStyle,
      end: kActiveTabTextStyle.copyWith(color: Colors.indigo)
    ).animate(animationController);

    // update the view to show the animation
    this.animationController.addListener(() {
      setState(() {
      });
    });

    // if the widget is active
    if(widget.active) {
      // move the tween in forward
      this.animationController.forward();
    } else {
      // move the transition backward
      this.animationController.reverse();

    }
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => (widget.onTap != null) ? widget.onTap!() : null,
        child: Container(
          padding: EdgeInsets.all(5),
          child: Text(
            widget.title.toUpperCase(),
            style: textStyleTween.value,
          ),
        ),
      ),
    );
  }
}
