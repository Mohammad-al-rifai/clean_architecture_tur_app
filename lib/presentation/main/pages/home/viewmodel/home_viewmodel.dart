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

  final _dataStreamController = BehaviorSubject<HomeViewObject>();

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
        inputHomeData.add(HomeViewObject(homeObject.data.stores,
            homeObject.data.services, homeObject.data.banners));
      },
    );
  }

  @override
  void dispose() {
    _dataStreamController.close();
    super.dispose();
  }

  Sink get inputHomeData => _dataStreamController.sink;

  // -- Outputs:
  Stream<HomeViewObject> get outputHomeData =>
      _dataStreamController.stream.map((data) => data);
}

abstract class HomeViewModelInput {
  Sink get inputHomeData;
}

abstract class HomeViewModelOutputs {
  Stream<HomeViewObject> get outputHomeData;
}

class HomeViewObject {
  List<Store> stores;
  List<Service> services;
  List<BannerAd> banners;

  HomeViewObject(this.stores, this.services, this.banners);
}
