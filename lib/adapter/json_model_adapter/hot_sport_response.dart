part of hot_sport;

class HotSportResponse<T> extends BoxResponse<T> {
  HotSportResponse({
    bool confirmed = false,
    this.builder,
    T? data,
  }) : super(
          confirmed: confirmed,
          data: data,
        );
   WidgetBuilder? builder;

 
}
