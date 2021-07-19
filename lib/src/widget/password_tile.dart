import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:password_saver/src/model/password_model.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Slidable passwordTile(Password myPassword, BuildContext context) {
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
        onTap: () => {
          Alert(
              context: context,
              title: myPassword.name!,
              content: Column(
                children: [
                  //_formField(Icons.lock, myPassword.password!),
                  _formField(Icons.lock, myPassword.password!),
                  _formField(Icons.description, myPassword.description!)
                ],
              ),
              buttons: [
                DialogButton(
                  onPressed: null,
                  child: Text(
                    'Create',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                )
              ]).show()
        },
        title: Text(myPassword.name!),
        subtitle: Text(myPassword.description!),
      ),
    ),
  );
}

Row _formField(IconData icon, String text) {
  return Row(
    children: [
      Expanded(
        child: TextField(
          controller: TextEditingController(text: text),
          readOnly: true,
          enabled: false,
          minLines: 1,
          maxLines: 3,
          decoration: InputDecoration(
            fillColor: Colors.white,
            border: InputBorder.none,
            errorBorder: InputBorder.none,
            icon: Icon(icon),
          ),
        ),
      ),
      IconButton(
        onPressed: () {
          Clipboard.setData(ClipboardData(text: text));
        },
        icon: Icon(Icons.copy),
        color: Colors.blue,
      ),
    ],
  );
}
