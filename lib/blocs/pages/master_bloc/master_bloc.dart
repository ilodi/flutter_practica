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
     final int index =  this
          .state
          .history
          .indexWhere((item) => item.videoID == event.youTubeVideo.videoID);
      //antes de crear una copia del historial actual
      if(index== -1){
      final history = List<YouTubeVideo>.from(this.state.history);
      history.add(event.youTubeVideo);
      yield this.state.copyWith(
            history: history,
          );
      }
    }
  }
}
