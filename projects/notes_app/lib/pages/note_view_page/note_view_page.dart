import 'package:flutter/material.dart';
import 'package:notes_app/pages/notes_list_page/notes_list_manager.dart';
// import 'package:notes_app/pages/notes_list_page/notifiers/notes_list_notifier.dart';
import 'package:notes_app/services/service_locator.dart';
import 'package:notes_app/utils/note_class.dart';
// import 'package:notes_app/main.dart';
import 'package:notes_app/utils/note_edit_component.dart';
import 'package:notes_app/utils/note_view_component.dart';

class NoteViewPage extends StatefulWidget {
  NoteViewPage({
    super.key,
    required this.note,
    required this.index,
  });

  Note note;
  int index;

  @override
  State<NoteViewPage> createState() => NoteViewPageState();
}

class NoteViewPageState extends State<NoteViewPage> {
  // static const dummyTitle = 'Tasks for EOD';
  // static const dummyBody =
  //     'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,';

  var notesListManager = getIt<NotesListManager>();

  final TextEditingController _titleTextController = TextEditingController();
  final TextEditingController _bodyTextController = TextEditingController();

  var isEditing = false;

  void toggleIsEditing() {
    setState(() {
      isEditing = !isEditing;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hi Vaibhav'),
        backgroundColor: Colors.white,
        actions: [
          Padding(
              padding: EdgeInsets.all(10),
              child:
                  IconButton(onPressed: () {}, icon: Icon(Icons.menu_rounded))),
        ],
        actionsIconTheme: IconThemeData(),
      ),
      body: SelectionArea(
        child: isEditing
            ? NoteEditComponent(
                toggleIsEditing: toggleIsEditing,
                titleTextController: _titleTextController,
                bodyTextController: _bodyTextController)
            : NoteViewComponent(
                note: widget.note,
                index: widget.index,
              ),
      ),
      // body: NoteViewComponent(),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (!isEditing) {
            // Open edit component with the existing note date
            _titleTextController.text = widget.note.title;
            _bodyTextController.text = widget.note.body;
            toggleIsEditing();
          } else {
            // notesListNotifier.editNode()
            Note temp = Note(
              title: _titleTextController.text,
              body: _bodyTextController.text,
            );
            notesListManager.editNode(widget.index, temp);
            toggleIsEditing();
          }
        },
        child: isEditing
            ? Icon(Icons.save_rounded)
            : Icon(Icons.mode_edit_outline_rounded),
      ),
    );
  }
}
