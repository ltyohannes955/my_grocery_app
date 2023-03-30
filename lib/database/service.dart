import 'package:my_grocery_app/database/rep.dart';
import '../model/items.dart';

class Service {
  Repository? _repository;

  Service() {
    _repository = Repository();
  }

  saveitem(Item item) async {
    return await _repository!.insertData('item', item.toJson());
  }

  readitem() async {
    return await _repository!.readData('item');
  }

  updateitem(Item item) async {
    return await _repository!.updateData('item', item.toJson());
  }

  deleteitem(dispatchId) async {
    return await _repository!.deleteData('item', dispatchId);
  }

  wipeDate() async {
    await _repository!.deleteAllData('item');
  }
}
