import 'package:stacked/stacked.dart';
import 'package:ozcoffee/models/menu.dart';

class HomeViewModel extends BaseViewModel {
  String _selectedCategory = 'All';
  String get selectedCategory => _selectedCategory;

  List<Menu> get filteredMenuItems {
    if (_selectedCategory == 'All') {
      return MenuItems.menuItem;
    }
    return MenuItems.menuItem
        .where((item) => item.category == _selectedCategory)
        .toList();
  }

  void updateCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }
}
