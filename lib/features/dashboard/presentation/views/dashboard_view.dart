import 'package:cbq/dependency_injector/dependency_injector.dart';
import 'package:cbq/features/dashboard/presentation/state/user_state.dart';
import 'package:cbq/features/setting/language/appLocalizations.dart';
import 'package:cbq/services/conectivity_services.dart';
import 'package:cbq/widgets/app_bar_widget.dart';
import 'package:cbq/widgets/drawer_widget.dart';
import 'package:cbq/widgets/error_tex_widget.dart';
import 'package:cbq/widgets/loading_widget.dart';
import 'package:cbq/widgets/text_widget.dart';
import 'package:cbq/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashBoardView extends ConsumerWidget {
  const DashBoardView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(userNotifierProvider);
    var connectivityStatusSate = ref.watch(connectivityStatusProviders);
    TextEditingController controller = TextEditingController();
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      endDrawer: const DrawerMenu(),
      appBar: AppBarWidget(
        // title: const TextUtils(text: 'App Title'),
        title: TextUtils(
            text: AppLocalizations.of(context).getTranslate('title_Home')),
        callBack: () {
          scaffoldKey.currentState!.openEndDrawer();
        },
      ),
      body: Center(
        child: connectivityStatusSate != ConnectivityStatus.isConnected
            ? const Center(
                child: TextUtils(
                  text: 'Is Disconnected from Internet',
                  style: TextStyle(
                      color: Colors.red, fontSize: 20.0, fontFamily: 'Mulish'),
                ),
              )
            : RefreshIndicator(
                onRefresh: () async {
                  return await ref.refresh(userNotifierProvider);
                },
                child: Consumer(
                  builder: (context, ref, child) {
                    if (state is UserLoaded) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 15),
                            child: TextFieldUtils(
                              controller: controller,
                              callBack: (response) async {
                                if (response != '') {
                                  ref.watch(parentListProvider.notifier).update(
                                      (parentListProviderState) => state.users
                                          .where((element) => element.username!
                                              .toLowerCase()
                                              .contains(response.toLowerCase()))
                                          .toList());
                                } else {
                                  ref.watch(parentListProvider.notifier).update(
                                      (parentListProviderState) => state.users);
                                }
                              },
                              hintText: AppLocalizations.of(context)
                                  .getTranslate('searchByName'),
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: ref.watch(parentListProvider).length,
                              itemBuilder: (BuildContext context, int index) {
                                return Card(
                                  color: Colors.white,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 5),
                                  child: Container(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ListTile(
                                      title: TextUtils(
                                          text: ref
                                              .watch(parentListProvider)[index]
                                              .username!),
                                      // subtitle: Text(user.email!),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    } else if (state is UserLoading) {
                      return const Loading();
                    } else if (state is UserError) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: TextUtils(text: state.message),
                        backgroundColor: (Colors.black12),
                        action: SnackBarAction(
                          label: 'Error',
                          onPressed: () {},
                        ),
                      ));
                      return ErrorText(error: state.message);
                    } else {
                      return const Loading();
                    }
                  },
                ),
              ),
      ),
    );
  }
}
