abstract class States {}

class InitialState extends States {}

class ChangeBottomNavBarState extends States {}

class ChangeModeApp extends States {}

class IconChangeMode extends States {}

class BusinessSuccessState extends States {}

class BusinessErrorState extends States {
  final String error;

  BusinessErrorState(this.error);
}

class BusinessLoadingState extends States {}

class SportsSuccessState extends States {}

class SportsErrorState extends States {
  final String error;

  SportsErrorState(this.error);
}

class SportsLoadingState extends States {}

class ScienceSuccessState extends States {}

class ScienceErrorState extends States {
  final String error;

  ScienceErrorState(this.error);
}

class ScienceLoadingState extends States {}

class SearchSuccessState extends States {}

class SearchErrorState extends States {
  final String error;

  SearchErrorState(this.error);
}

class SearchLoadingState extends States {}
