import 'package:image_picker/image_picker.dart';

pickedImages(ImageSource source) async {
//initialize image picker
  final ImagePicker _pick = ImagePicker();

  XFile? photoshot = await _pick.pickImage(
    source: source,
  );
  if (photoshot != null) {
    return photoshot.readAsBytes();
  }
}
