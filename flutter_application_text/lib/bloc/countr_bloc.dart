import 'package:bloc/bloc.dart';
import 'package:flutter_application_text/Modal/TModelClass.dart';
import 'package:flutter_application_text/ApiProvider/Apiprovider.dart';
import 'package:meta/meta.dart';

part 'countr_event.dart';
part 'countr_state.dart';

class CountrBloc extends Bloc<CountrEvent, CountrState> {
  CountrBloc() : super(CountrInitial()) {
    ApiProvider countrApiProvider=ApiProvider();
    on<fetchCountrEvent>((event, emit) async{
      emit(CountrLoadingState());
      try {
        List<ModelClass> countr0=await countrApiProvider.getAllEntries();
        emit(CountrLoadedState(countrs: countr0));
      } catch (e) {
        emit(CountrErrorState(errorMessage: e.toString()));
      }
    });
  }
}
