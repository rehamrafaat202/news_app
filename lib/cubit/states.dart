abstract class ParentState {}

class NewsInitialState extends ParentState {}

class NewsNavgationState extends ParentState {}

class NewsGetBusinessLoadingState extends ParentState {}

class NewsGetBusinessSuccessState extends ParentState {}

class NewsGetBusinessErrorState extends ParentState {
  final String error;

  NewsGetBusinessErrorState(this.error);
}

class GetChangeModeState extends ParentState {}

class NewsGetSportsLoadingState extends ParentState {}

class NewsGetSportsSuccessState extends ParentState {}

class NewsGetSportsErrorState extends ParentState {
  final String error;

  NewsGetSportsErrorState(this.error);
}

class NewsGetSearchLoadingState extends ParentState {}

class NewsGetSearchSuccessState extends ParentState {}

class NewsGetSearchErrorState extends ParentState {
  final String error;

  NewsGetSearchErrorState(this.error);
}
