import 'package:flutter/material.dart';


class AppBanner extends StatefulWidget implements PreferredSizeWidget {
  final Color? fromColor;
  final Color? toColor;
  final double? toolbarHeight;
  final double? toolbarWidth;
  final Widget? header;
  final Widget? content;
  final Widget? bottom;


  AppBanner({Key? key, this.fromColor, this.toColor, this.toolbarHeight, this.toolbarWidth, this.header, this.content, this.bottom}) : super(key: key);


  @override
  _AppBannerState createState() => _AppBannerState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize {
    return Size(
      this.toolbarWidth ?? double.infinity,
      this.toolbarHeight ?? kToolbarHeight
    );
  }
}

class _AppBannerState extends State<AppBanner> {
  @override
  Widget build(BuildContext context) {
    // initialized empty array for children
    List<Widget> children = <Widget>[];

    // if header is provided, add to children
    if(widget.header != null){
      children.add(widget.header!);
    }

    // if content is provided, add to children

    if(widget.content != null){
      children.add(SizedBox(height: 15,));
      children.add(widget.content!);
    }
    // if bottom is provided, add to children

    if(widget.bottom != null){
      children.add(SizedBox(height: 15,));
      children.add(widget.bottom!);
    }
    // SafeArea prevent widget get rendered on device frame boundary
    return SafeArea(
      child: PreferredSize(
        preferredSize: widget.preferredSize,
        child: Flex(
          direction: Axis.vertical,
         children: [
           Container(
             constraints: BoxConstraints(
               maxHeight: widget.preferredSize.width,
               minHeight: widget.preferredSize.height
             ),
             width: widget.preferredSize.width,
             padding: EdgeInsets.all(25),
             decoration: BoxDecoration(
               gradient: LinearGradient(
                 begin: Alignment.topLeft,
                 end: Alignment.bottomRight,
                 colors: [
                   widget.fromColor ?? Color(0xFF03DAC5), // if from color is not provider fallback to default value
                   widget.toColor ?? Color(0xFF83D4FF),
                 ]
               )
             ),
             child: Column(
                mainAxisSize: MainAxisSize.min,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: children,
             ),
           )
         ],
        ),
      ),
    );
  }
}
