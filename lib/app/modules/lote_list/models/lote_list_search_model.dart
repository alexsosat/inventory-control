import '../../../data/models/tag/tag.dart';

import '../../../data/models/lote/lote.dart';

class LoteListSearchModel {
  int? dateOrder;
  int? dateAscDesc;
  List<LoteStatus>? loteStatus;
  List<Tag>? tags;

  LoteListSearchModel({
    this.dateOrder,
    this.dateAscDesc,
    this.loteStatus,
    this.tags,
  });
}
