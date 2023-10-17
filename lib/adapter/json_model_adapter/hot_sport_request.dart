
// import 'package:stacked/stacked.dart';
// import 'box_request.dart';

part of hot_sport;

class HotSportRequest<T> extends BoxRequest<T> {
  HotSportRequest({
    dynamic variant,
    String? content,
    String? hotSportId,
    T? data,
    BaseViewModel? viewModel
  }) : super(
          variant: variant,
          content: content,
          data: data,
          viewModel: viewModel,
        );
}
