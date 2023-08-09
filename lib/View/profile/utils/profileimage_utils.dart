import 'package:image_picker/image_picker.dart';
import 'package:learnopus/ViewModel/provider/imagemodel_provider.dart';
import 'package:provider/provider.dart';

String selectedImagePath = '';

Future<void> selectImage(context) async {
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: ImageSource.gallery);

  if (pickedFile != null) {
    final imageProvider =
        Provider.of<ImageProviderModel>(context, listen: false);
    imageProvider.updateImagePath(pickedFile.path); //implement provider here
  }
}
