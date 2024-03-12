import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FAQTEMPELATE extends StatefulWidget {
  final String question;
  final String answer;
  final TextStyle? queStyle;
  final TextStyle? ansStyle;
  final bool? isExpanded;
  final Widget? expandedIcon;
  final Widget? collapsedIcon;
  final EdgeInsets? ansPadding;
  final Widget? separator;
  final BoxDecoration? ansDecoration, queDecoration;

  const FAQTEMPELATE(
      {super.key,
      required this.question,
      required this.answer,
      this.queStyle,
      this.ansStyle,
      this.isExpanded = false,
      this.expandedIcon,
      this.collapsedIcon,
      this.ansPadding,
      this.separator,
      this.ansDecoration,
      this.queDecoration});

  @override
  State<FAQTEMPELATE> createState() => _FAQState();
}

class _FAQState extends State<FAQTEMPELATE> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ListExpandableWidget(
      ansDecoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(size.width * 0.02))),
      queDecoration: const BoxDecoration(
        color: Colors.white,
      ),
      ansPadding: EdgeInsets.all(size.width * 0.03),
      ansMargin:
          EdgeInsets.fromLTRB(0, size.width * 0.01, 0, size.width * 0.01),
      isExpanded: widget.isExpanded,
      expandedIcon: const Icon(Icons.keyboard_arrow_down),
      collapsedIcon: const Icon(Icons.keyboard_arrow_right),
      header: Text(
        widget.question,
        style: GoogleFonts.orbitron(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: size.width * 0.03),
      ),
      items: Text(
        widget.answer,
        textAlign: TextAlign.justify,
        style: GoogleFonts.poppins(
            color: const Color.fromARGB(186, 8, 7, 7),
            fontWeight: FontWeight.w700,
            fontSize: size.width * 0.03),
      ),
    );
  }
}

class ListExpandableWidget extends StatefulWidget {
  final bool? isExpanded;
  final Widget? header;
  final Widget items;
  final EdgeInsets ansMargin;
  final Widget expandedIcon;
  final EdgeInsets ansPadding;
  final BoxDecoration ansDecoration, queDecoration;
  final Widget collapsedIcon;
  const ListExpandableWidget(
      {super.key,
      this.isExpanded,
      this.header,
      required this.items,
      required this.ansMargin,
      required this.expandedIcon,
      required this.collapsedIcon,
      required this.ansPadding,
      required this.ansDecoration,
      required this.queDecoration});

  @override
  State<ListExpandableWidget> createState() => _ListExpandableWidgetState();
}

class _ListExpandableWidgetState extends State<ListExpandableWidget> {
  bool? _isExpanded;

  @override
  void initState() {
    super.initState();
    _updateExpandState(widget.isExpanded!);
  }

  void _updateExpandState(bool isExpanded) =>
      setState(() => _isExpanded = isExpanded);

  @override
  Widget build(BuildContext context) {
    return _isExpanded! ? _buildListItems(context) : _wrapHeader();
  }

  Widget _wrapHeader() {
    List<Widget> children = [];
    children.add(Container(
      decoration: widget.queDecoration,
      child: ListTile(
        style: ListTileStyle.drawer,
        title: widget.header,
        trailing: _isExpanded! ? widget.expandedIcon : widget.collapsedIcon,
        onTap: () => _updateExpandState(!_isExpanded!),
      ),
    ));
    return Ink(
      child: Column(
        children: children,
      ),
    );
  }

  Widget _buildListItems(BuildContext context) {
    List<Widget> titles = [];
    titles.add(_wrapHeader());
    titles.add(Container(
        width: double.infinity,
        decoration: widget.ansDecoration,
        padding: widget.ansPadding,
        margin: widget.ansMargin,
        child: widget.items));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: ListTile.divideTiles(tiles: titles, context: context).toList(),
    );
  }
}
