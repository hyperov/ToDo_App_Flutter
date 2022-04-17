import 'package:get/get.dart';
import 'package:to_do_app_flutter/notes/model/Note.dart';

class SharedViewModel extends GetxController {
    Rx<Note?> selectedNote =Note().obs;
}
