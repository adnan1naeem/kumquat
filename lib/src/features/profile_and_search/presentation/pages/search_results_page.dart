import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kumquat_app/src/core/components/app_eclipse_background_body.dart';
import 'package:kumquat_app/src/core/components/app_scaffold.dart';
import 'package:kumquat_app/src/core/components/custom_appbar.dart';
import 'package:kumquat_app/src/core/helper/focus_helper.dart';
import 'package:kumquat_app/src/core/helper/space.dart';
import 'package:kumquat_app/src/core/routes/app_router.gr.dart';
import '../widgets/filter_widget.dart';
import '../widgets/profile_card.dart';

@RoutePage<void>()
class SearchResultsPage extends StatefulWidget {
  const SearchResultsPage({super.key});

  @override
  State<SearchResultsPage> createState() => _SearchResultsPageState();
}

class _SearchResultsPageState extends State<SearchResultsPage> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        appbar: const CustomAppbar(
          titleText: 'Search Results',
          allowBackNav: true,
        ),
        body: AppEclipseBackgroundBody(
          height: MediaQuery.sizeOf(context).height * 0.3,
          child: GestureDetector(
            onTap: () => getFocus(context),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  FilterWidget(controller: controller),
                  verticalSpace(15),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 15,
                        itemBuilder: (context,index){
                          return  ProfileCard(
                            name: 'Username',
                            score: 7.5,
                            kumquats: 25,
                            about:'lorem ipsum lorem ipsum lorem ipsumlorem ipsumlorem ipsumlorem ipsumvlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumvvvvvvvvvlorem ipsumlorem ipsumvlorem ipsumlorem ipsumvvlorem ipsum',
                            onTap: (){
                              context.router.push(const UserProfileRoute());
                            },
                          );
                        }
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
