import 'package:animu_common/src/models/role.dart';
import 'package:animu_common/src/models/self_role.dart';

import '../events/self_roles_list_event.dart';
import '../repos/animu_repo.dart';
import '../states/self_roles_list_state.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class SelfRolesListBloc extends Bloc<SelfRolesListEvent, SelfRolesListState> {
  final AnimuRepository animuRepository;

  SelfRolesListBloc({@required this.animuRepository})
      : assert(animuRepository != null);

  @override
  SelfRolesListState get initialState => SelfRolesListEmpty();

  @override
  Stream<SelfRolesListState> mapEventToState(
    SelfRolesListEvent event,
  ) async* {
    if (event is FetchSelfRolesList) {
      yield SelfRolesListLoading();

      try {
        final List<dynamic> data = await animuRepository.getSelfRoles();

        final List<SelfRole> selfRolesList = data[0];
        final List<Role> roles = data[1];
        yield SelfRolesListLoaded(selfRoles: selfRolesList, roles: roles);
      } catch (e) {
        SelfRolesListError();
      }
    }

    if (event is CreateSelfRole) {
      try {
        final List<dynamic> data = await animuRepository.createSelfRole(
          role: event.role,
          emoji: event.emoji,
        );

        final List<SelfRole> selfRoles = data[0];
        final List<Role> roles = data[1];
        yield SelfRolesListLoaded(selfRoles: selfRoles, roles: roles);
      } catch (e) {
        SelfRolesListError();
      }
    }

    if (event is DeleteSelfRole) {
      try {
        final List<dynamic> data = await animuRepository.deleteSelfRole(
          role: event.role,
        );

        final List<SelfRole> selfRoles = data[0];
        final List<Role> roles = data[1];
        yield SelfRolesListLoaded(selfRoles: selfRoles, roles: roles);
      } catch (e) {
        SelfRolesListError();
      }
    }
  }
}
