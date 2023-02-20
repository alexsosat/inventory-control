import 'package:get/get.dart';
import '../../../data/models/tag/tag.dart';

import '../../../data/models/lote/lote.dart';

class LoteSearchController extends GetxController {
  int? dateOrder;
  int? dateAscDesc;
  List<LoteStatus> loteStatus = [];
  List<Tag> tags = [];
}
