part of hot_sport;

extension HotSprotFirstWhereExt<T> on List<HotSportModel> {
  HotSportModel? hotSportFirstWhereOrNull({required String componentName}) {
    HotSportModel? findModel;
    recursiveTraverseHotSportData(HotSportModel parentHotsport) {
      if (parentHotsport.widgetInfo?.componentName == componentName) {
        findModel = parentHotsport;
      } else {
        parentHotsport.components?.forEach((element) {
          recursiveTraverseHotSportData(element);
        });
      }
    }

    for (var element in this) {
      recursiveTraverseHotSportData(element);
    }
    return findModel;
  }

  hotSportSetEventWhereOrNull(
      {required String componentTag, SportMoldeEvent? event}) {
    recursiveTraverseHotSportData(HotSportModel parentHotsport) {
      if (parentHotsport.widgetInfo?.componentTag == componentTag) {
        event?.event = parentHotsport.componetOption?.event?.event;
        parentHotsport.componetOption?.event = event;
      }
      parentHotsport.components?.forEach((element) {
        recursiveTraverseHotSportData(element);
      });
    }

    for (var element in this) {
      recursiveTraverseHotSportData(element);
    }
  }
}
