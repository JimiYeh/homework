import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'model/album_list_entity.dart';

part 'api.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com/")
abstract class API {
  factory API(Dio dio) = _API;

  @GET("/photos")
  Future<List<AlbumListEntity>> getAlbumList();
}