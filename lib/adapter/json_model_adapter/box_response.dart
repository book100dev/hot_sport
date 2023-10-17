class BoxResponse<T> {
  /// Indicates if a show confirmation call has been confirmed or rejected.
  /// null will be returned when it's not a confirmation dialog.
  final bool confirmed;

  /// A place to put any response data from dialogs that may contain text fields
  /// or multi selection options
  final T? data;

  BoxResponse({
    this.confirmed = false,
    this.data,
  });
}