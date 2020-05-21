import 'package:bloc/bloc.dart';
import 'package:practica/models/youtube_video.dart';
import './master_events.dart';
import './master_state.dart';

class MasterBloc extends Bloc<MasterEvents, MasterState> {
  @override
  MasterState get initialState => MasterState.initialState();

  @override
  Stream<MasterState> mapEventToState(MasterEvents event) async* {
    if (event is MasterSetTap) {
      yield this.state.copyWith(currenTab: event.tab);
    } else if (event is MasterAddHistory) {
      yield* _addToHistory(event);
    } else if (event is MasterRemoveFromHistory) {
      yield* _removeToHistory(event);
    } else if (event is MasterLogOut) {
      yield this.state.copyWith(history: [], currenTab: 0);
    }
  }

  Stream<MasterState> _addToHistory(MasterAddHistory event) async* {
    final int index = this
        .state
        .history
        .indexWhere((item) => item.videoID == event.youTubeVideo.videoID);
    //antes de crear una copia del historial actual
    if (index == -1) {
      final history = List<YouTubeVideo>.from(this.state.history);
      history.add(event.youTubeVideo);
      yield this.state.copyWith(
            history: history,
          );
    }
  }

  Stream<MasterState> _removeToHistory(MasterRemoveFromHistory event) async* {
    //1 crear una copia del historial
    final history = List<YouTubeVideo>.from(this.state.history);
    //2 se remueve de la lista el index
    history.removeAt(event.index);
    //3 Notificas los cambios mandas el historial con los nuevos cambio
    yield this.state.copyWith(history: history);
  }
}
