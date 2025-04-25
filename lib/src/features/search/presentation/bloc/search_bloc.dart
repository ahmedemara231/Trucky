part of '../imports/imports.dart';

class SearchBloc extends Bloc<SearchEvents, SearchState> {
  SearchBloc(this.repo) : super(SearchState.initial()) {
    on<InitialModel>((event, emit) async{
      getInitialData(emit: emit, initialModel: event.model);
    });

    on<ExecuteCategoriesSearch>((event, emit) async{
      await search(emit: emit, filter: event.filter);
    }, transformer: debounce(250.ms));

    on<EnterPattern>((event, emit) async{
      enterPattern(emit: emit, filter: event.inputs);
    });

    // on<OnChange>((event, emit) async{
    //   await onChanged(
    //       emit,
    //       filter: event.filterProviders,
    //       place: event.place,
    //   );
    // }, transformer: debounce(250.ms));
  }

  final SearchRepo repo;

  void getInitialData({
    required Emitter<SearchState> emit,
    required GetProviderModel initialModel,
  }){
    emit(state.copyWith(baseStatus: BaseStatus.success, categoriesModel: initialModel));
  }

  Future<void> search({
    required Emitter emit,
    required FilterProviders filter,
  })async{
    emit(state.copyWith(baseStatus: BaseStatus.loading));
    final result = await repo.getProviders(filter);
    result.when(
          (success) => emit(
              state.copyWith(
                baseStatus: BaseStatus.success,
                categoriesModel: success.data,
              )),
          (error) => emit(
              state.copyWith(
                  baseStatus: BaseStatus.error,
                  msg: error.message
              )),
    );
  }

  EventTransformer<T> debounce<T>(Duration duration) {
    return (events, mapper) => events
        .debounceTime(duration)
        .flatMap(mapper);
  }

  void enterPattern({required Emitter emit, required FilterProviders filter}){
    log('messageffff : ${filter.city}');
    emit(state.copyWith(filterProviders: filter));
  }

  // Future<void> onChanged(Emitter emit, {
  //   required Place place,
  //   FilterProviders? filter,
  // })async{
  //   switch(place){
  //     case Place.samePage:
  //       enterPattern(
  //           emit: emit,
  //           filter: FilterProviders(
  //               name: filter?.name,
  //               city: filter?.city,
  //           ));
  //       await search(
  //           emit: emit,
  //           filter: filter!
  //       );
  //
  //
  //     default:
  //       enterPattern(
  //           emit: emit,
  //           filter: FilterProviders(
  //             name: filter?.name,
  //             city: filter?.city,
  //           ));
  //   }
  // }
}