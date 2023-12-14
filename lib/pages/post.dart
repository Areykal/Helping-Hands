import 'dart:math';
import 'package:flutter/material.dart';
import 'package:helping_hands/classes/database.dart';
import 'package:helping_hands/pages/post_second_step.dart';

class PostPage extends StatefulWidget {
  const PostPage(
      {super.key,
      required this.add,
      required this.index,
      required this.eventInfoEdit});

  final bool add;
  final int index;
  final EventInfoEdit eventInfoEdit;

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  late EventInfoEdit _eventInfoEdit;
  // late String _name;
  // late String _type;
  // late String _description;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  final FocusNode _nameFocus = FocusNode();
  final FocusNode _typeFocus = FocusNode();
  final FocusNode _descriptionFocus = FocusNode();

  @override
  void initState() {
    super.initState();

    _eventInfoEdit =
        EventInfoEdit(action: 'Cancel', event: widget.eventInfoEdit.event);
    _eventInfoEdit.event = widget.eventInfoEdit.event;
    _nameController.text = _eventInfoEdit.event.name;
    _typeController.text = _eventInfoEdit.event.type;
    _descriptionController.text = _eventInfoEdit.event.description;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _typeController.dispose();
    _descriptionController.dispose();
    _nameFocus.dispose();
    _typeFocus.dispose();
    _descriptionFocus.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Post"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _nameController,
                autofocus: true,
                textInputAction: TextInputAction.next,
                focusNode: _nameFocus,
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                  labelText: "Organization's Name",
                  border: OutlineInputBorder(),
                ),
                onSubmitted: (submitted) {
                  FocusScope.of(context).requestFocus(_typeFocus);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _typeController,
                textInputAction: TextInputAction.next,
                focusNode: _typeFocus,
                textCapitalization: TextCapitalization.sentences,
                decoration: const InputDecoration(
                  labelText: "Organization's Type",
                  border: OutlineInputBorder(),
                ),
                onSubmitted: (submitted) {
                  FocusScope.of(context).requestFocus(_descriptionFocus);
                },
                maxLines: null,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _descriptionController,
                textCapitalization: TextCapitalization.sentences,
                focusNode: _descriptionFocus,
                textInputAction: TextInputAction.newline,
                maxLines: null,
                decoration: const InputDecoration(
                  labelText: "Event's Description",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.upload),
                  Text("Upload Poster"),
                ],
              ),
            ),
            ElevatedButton(
                child: const Text("Cancel"),
                onPressed: () {
                  _eventInfoEdit.action = 'Cancel';
                  Navigator.pop(context, _eventInfoEdit);
                }),
            ElevatedButton(
              child: const Text("Next"),
              onPressed: () {
                _eventInfoEdit.action = 'Save';
                String id = widget.add
                    ? Random().nextInt(9999999).toString()
                    : _eventInfoEdit.event.id;
                _eventInfoEdit.event = EventInfo(
                  id: id,
                  name: _nameController.text,
                  type: _typeController.text,
                  description: _descriptionController.text,
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PostPageSecond(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
