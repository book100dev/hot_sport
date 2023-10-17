import 'package:stacked/stacked.dart';
class BoxRequest<T> {
  final dynamic variant;
  String? content;
  final T? data;
  BaseViewModel? viewModel;
  BoxRequest({this.variant, this.content, this.data, this.viewModel});
}
