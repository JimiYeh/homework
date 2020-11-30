import 'dart:async';
import 'dart:core';

import 'model/album_list_entity.dart';

abstract class Repository {

  Future<List<AlbumListEntity>> getAlbumList();
}

