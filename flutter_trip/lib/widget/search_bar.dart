import 'package:flutter/material.dart';

enum SearchBarType { home, normal, homeLight }
class SearchBar extends StatefulWidget {
  final bool enabled; // 是否禁止搜索
  final bool hideLeft;  // 是否隐藏
  final SearchBarType searchBarType;
  final String hint;  // 提示文案
  final String defaultText;
  final void Function() leftButtonClick;
  final void Function() rightButtonClick;
  final void Function() speakClick;
  final void Function() inputBoxClick;
  final ValueChanged<String> onChanged;


  SearchBar(this.enabled, this.hideLeft, this.searchBarType, this.hint,
      this.defaultText, this.leftButtonClick, this.rightButtonClick,
      this.speakClick, this.inputBoxClick, this.onChanged);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return null;
  }

}

class _SearchBarState extends State<SearchBar> {
  bool showClear = false;
  final TextEditingController _controller = TextEditingController(); // 可获取搜索框的变化

  @override
  void initState() {
    if(widget.defaultText!=null) {
      setState(() {
        _controller.text = widget.defaultText;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.searchBarType == SearchBarType.normal
        ? _genNormalSearch(): _genHomeSearch();
  }
  _genNormalSearch() {
    return Container(
      child: Row(
        children: <Widget>[
          _wrapTap(
              Container(
              child: widget?.hideLeft??false?null:Icon(Icons.arrow_back_ios,
              color: Colors.grey,size: 26,),
            ),
            widget.leftButtonClick
          ),
          Expanded(
            flex: 1,
            child: _inputBox(),
          ),
          _wrapTap(
              Container(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: Text(
                  '搜索',
                  style: TextStyle(color: Colors.blue, fontSize: 17),
                ),
              ),
              widget.rightButtonClick
          )
        ],
      ),
    );
  }
  _genHomeSearch() {

  }
  _inputBox() {
    Color inputBoxColor;
    if (widget.searchBarType == SearchBarType.home) {
      inputBoxColor = Colors.white;
    } else {
      inputBoxColor = Color(int.parse('0xffEDEDED'));
    }
    return Container(
      child: Row(
        children: <Widget>[
          Icon(
            Icons.search,
            size: 20,
            color: widget.searchBarType == SearchBarType.normal
              ? Color(0xffA9A9A9)
              : Colors.blue,
          ),
          Expanded(
            flex: 1,
            child: widget.searchBarType == SearchBarType.normal,
          )
        ],
      ),
    )
  }
  _wrapTap(Widget child, void Function() callback) {
    return GestureDetector(
      onTap: () {

      },
      child: child,
    );
  }

}