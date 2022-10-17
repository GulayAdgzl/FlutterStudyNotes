class FileDownloadsException implements Exception {
  @override
  String toString() {
    return 'File download has failed';
  }
}
