enum SportEvent {
  search('search','搜索菜品'),
  back('back','返回'),
  backToRoot('backToRoot','返回首页'),
  backToTable('backToTable','进入桌台'),
  backToCover('backToCover','返回封面'),
  goToShoppingCart('goToShoppingCart','购物车'),
  intoFood('foodPage','进入菜单'),
  scan('scan','扫码');

  final String value;
  final String name;
  const SportEvent(this.value,this.name);
}
