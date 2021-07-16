import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:password_saver/src/model/password_model.dart';

Slidable passwordTile(Password myPassword) {
  return Slidable(
    actionPane: SlidableDrawerActionPane(),
    actions: <Widget>[
      IconSlideAction(
        caption: 'Archive',
        color: Colors.blue,
        icon: Icons.archive,
        // onTap: () => _showSnackBar('Archive'),
      ),
      IconSlideAction(
        caption: 'Share',
        color: Colors.indigo,
        icon: Icons.share,
        // onTap: () => _showSnackBar('Share'),
      ),
    ],
    secondaryActions: <Widget>[
      IconSlideAction(
        caption: 'More',
        color: Colors.black45,
        icon: Icons.more_horiz,
        // onTap: () => _showSnackBar('More'),
      ),
      IconSlideAction(
        caption: 'Delete',
        color: Colors.red,
        icon: Icons.delete,
        //    onTap: () => _showSnackBar('Delete'),
      ),
    ],
    child: Container(
      color: Colors.white,
      child: ListTile(
        onTap: null,
        title: Text(myPassword.name!),
        subtitle: Text(myPassword.description!),
      ),
    ),
  );
}