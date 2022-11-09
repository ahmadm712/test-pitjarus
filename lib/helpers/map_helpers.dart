class MapHelper {
  static MapHelper? _mapHelper;
  MapHelper._instance() {
    _mapHelper = this;
  }

  factory MapHelper() => _mapHelper ?? MapHelper._instance();
}
