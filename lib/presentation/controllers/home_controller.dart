import '../../domain/usecases/navigate_to_page.dart';

class HomeController {
  final NavigateToPageUseCase _navigateToPageUseCase;

  HomeController(this._navigateToPageUseCase);

  void onBottomNavTapped(int index) {
    _navigateToPageUseCase.execute(index); // Navigate to the selected page
  }

  void onGoToProfilePagePressed() {
    _navigateToPageUseCase.execute(1); // Assume 1 is the index for the profile page
  }

  void onGoToSettingsPagePressed() {
    _navigateToPageUseCase.execute(2); // Assume 2 is the index for the settings page
  }
  void onGoToMapPavoidgePressed() {
    _navigateToPageUseCase.execute(3); // Assume 3 is the index for the settings page
  }
}
