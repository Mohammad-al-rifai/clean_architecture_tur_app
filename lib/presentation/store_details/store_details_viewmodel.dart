import 'dart:ffi';

import 'package:advanced_course/domain/use_cases/store_details_usecase.dart';
import 'package:advanced_course/presentation/base/base_view_model.dart';
import 'package:advanced_course/presentation/common/state_renderer/state_renderer.dart';
import 'package:advanced_course/presentation/common/state_renderer/state_renderer_impl.dart';
import 'package:rxdart/rxdart.dart';

import '../../domain/models/models.dart';

class StoreDetailsViewModel extends BaseViewModel
    with StoreDetailsViewModelInput, StoreDetailsViewModelOutput {
  final StoreDetailsUseCase storeDetailsUseCase;

  final _storeDetailsStreamController = BehaviorSubject<StoreDetails>();

  StoreDetailsViewModel(this.storeDetailsUseCase);

  // Inputs:
  @override
  void start() {
    _loadData();
  }

  _loadData() async {
    inputState.add(
      LoadingState(
        stateRendererType: StateRendererType.fullScreenLoadingState,
      ),
    );

    (await storeDetailsUseCase.execute(Void)).fold(
      (failure) {
        inputState.add(
          ErrorState(
            StateRendererType.fullScreenErrorState,
            failure.message,
          ),
        );
      },
      (storeDetails) {
        inputState.add(ContentState());
        inputStoreDetails.add(storeDetails);
      },
    );
  }

  @override
  Sink get inputStoreDetails => _storeDetailsStreamController.sink;

  // Outputs:
  @override
  Stream<StoreDetails> get outputStoreDetails =>
      _storeDetailsStreamController.stream.map((stores) => stores);

  @override
  void dispose() {
    _storeDetailsStreamController.close();
    super.dispose();
  }
}

abstract class StoreDetailsViewModelInput {
  Sink get inputStoreDetails;
}

abstract class StoreDetailsViewModelOutput {
  Stream<StoreDetails> get outputStoreDetails;
}
