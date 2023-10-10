import 'dart:async';
import 'dart:ffi';

import 'package:advanced_course/domain/models/models.dart';
import 'package:advanced_course/domain/use_cases/home_usecase.dart';
import 'package:advanced_course/presentation/base/base_view_model.dart';
import 'package:advanced_course/presentation/common/state_renderer/state_renderer.dart';
import 'package:advanced_course/presentation/common/state_renderer/state_renderer_impl.dart';
import 'package:rxdart/rxdart.dart';

class HomeViewModel extends BaseViewModel
    with HomeViewModelInput, HomeViewModelOutputs {
  final HomeUseCase _homeUseCase;

  final StreamController _bannersStreamController =
      BehaviorSubject<List<BannerAd>>();
  final StreamController _servicesStreamController =
      BehaviorSubject<List<Service>>();
  final StreamController _storesStreamController =
      BehaviorSubject<List<Store>>();

  HomeViewModel(this._homeUseCase);

  // -- Inputs:

  @override
  void start() {
    _getHomeData();
  }

  // Get Home Data:

  _getHomeData() async {
    inputState.add(
      LoadingState(stateRendererType: StateRendererType.fullScreenLoadingState),
    );

    (await _homeUseCase.execute(Void)).fold(
      (failure) => {
        // Left -> Failure
        inputState.add(
          ErrorState(
            StateRendererType.fullScreenErrorState,
            failure.message,
          ),
        )
      },
      (homeObject) {
        // right -> data ( Success )
        // Content
        inputState.add(ContentState());
        inputBanners.add(homeObject.data?.banners);
        inputServices.add(homeObject.data?.services);
        inputStores.add(homeObject.data?.stores);
      },
    );
  }

  @override
  void dispose() {
    _bannersStreamController.close();
    _servicesStreamController.close();
    _storesStreamController.close();
    super.dispose();
  }

  @override
  Sink get inputBanners => _bannersStreamController.sink;

  @override
  Sink get inputServices => _servicesStreamController.sink;

  @override
  Sink get inputStores => _storesStreamController.sink;

  // -- Outputs:
  @override
  Stream<List<BannerAd>> get outputBanners =>
      _bannersStreamController.stream.map((banners) => banners);

  @override
  Stream<List<Service>> get outputServices =>
      _servicesStreamController.stream.map((services) => services);

  @override
  Stream<List<Store>> get outputStores =>
      _storesStreamController.stream.map((stores) => stores);
}

abstract class HomeViewModelInput {
  Sink get inputBanners;

  Sink get inputServices;

  Sink get inputStores;
}

abstract class HomeViewModelOutputs {
  Stream<List<BannerAd>> get outputBanners;

  Stream<List<Service>> get outputServices;

  Stream<List<Store>> get outputStores;
}
