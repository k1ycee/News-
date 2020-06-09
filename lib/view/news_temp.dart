import 'package:flutter/material.dart';


class Template extends StatefulWidget {

  final Text name;
  final Text id;
  final Text status;
  final Color color;

  const Template({Key key, this.name, this.id, this.status, this.color}) : super(key: key);

  @override
  _TemplateState createState() => _TemplateState();
}

class _TemplateState extends State<Template> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 300,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: widget.color),
      child: ListTile(leading: widget.id, title: widget.name, trailing: widget.status,)
    );
  }
}

