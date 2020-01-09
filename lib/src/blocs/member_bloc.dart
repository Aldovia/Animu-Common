import '../events/member_event.dart';
import '../repos/animu_repo.dart';
import '../states/member_state.dart';
import '../models/member.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class MemberBloc extends Bloc<MemberEvent, MemberState> {
  final AnimuRepository animuRepository;

  MemberBloc({@required this.animuRepository})
      : assert(animuRepository != null);

  @override
  MemberState get initialState => MemberUninitialized();

  @override
  Stream<MemberState> mapEventToState(MemberEvent event) async* {
    if (event is FetchMember) {
      yield MemberLoading();

      try {
        final Member member = await animuRepository.getMember(event.memberID);

        yield MemberLoaded(member: member);
      } catch (e) {
        yield MemberError();
      }
    }

    if (event is GiveBadge) {
      try {
        final Member member =
            await animuRepository.giveBadge(event.memberID, event.badgeName);

        yield MemberLoaded(member: member);
      } catch (e) {
        yield MemberError();
      }
    }
  }
}
