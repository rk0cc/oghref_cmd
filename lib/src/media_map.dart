import 'package:oghref_model/model.dart';
import 'package:meta/meta.dart';

@internal
extension AudioInfoMapConversion on AudioInfo {
  Map<String, dynamic> toMap() {
    return Map.unmodifiable({
      "url": url?.toString(),
      "secure_url": secureUrl?.toString(),
      "type": type
    }..removeWhere((key, value) => value == null));
  }
}

@internal
extension ImageInfoMapConversion on ImageInfo {
  Map<String, dynamic> toMap() {
    return Map.unmodifiable({
      "url": url?.toString(),
      "secure_url": secureUrl?.toString(),
      "type": type,
      "width": width,
      "height": height, 
      "alt": alt
    }..removeWhere((key, value) => value == null));
  }
}

@internal
extension VideoInfoMapConversion on VideoInfo {
  Map<String, dynamic> toMap() {
    return Map.unmodifiable({
      "url": url?.toString(),
      "secure_url": secureUrl?.toString(),
      "type": type,
      "width": width,
      "height": height
    }..removeWhere((key, value) => value == null));
  }
}
