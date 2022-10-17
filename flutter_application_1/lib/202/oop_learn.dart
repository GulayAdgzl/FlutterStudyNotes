import 'dart:html';

import 'package:url_launcher/url_launcher.dart';

import 'custom_exception.dart';

abstract class IFileDownload {
  bool? downloadItem(FileItem? fileItem);
   void toShare(String path) async {
      await launch(path);
    }
}

class FileDownload extends IFileDownload with ShareMixin{
  @override
  bool? downloadItem(FileItem? fileItem) {
    if (fileItem == null) throw FileDownloadsException();

    print('a');
    return true;
  }
  
  @override
  void toShare(String path) {
    // TODO: implement toShare
  }
}

class FileItem {
  final String name;
  final File file;

  FileItem(this.name, this.file);
}

//on sadece IFileDownload lardan treyenlere kullanacağım demek oluyor
mixin ShareMixin on  IFileDownload{

}