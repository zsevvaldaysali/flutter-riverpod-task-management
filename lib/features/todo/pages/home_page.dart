import 'package:flutter/material.dart';
import 'package:flutter_riverpod_task_management/common/utils/constants.dart';
import 'package:flutter_riverpod_task_management/common/widgets/app_style_widget.dart';
import 'package:flutter_riverpod_task_management/common/widgets/custom_text_field.dart';
import 'package:flutter_riverpod_task_management/common/widgets/height_spacer_widget.dart';
import 'package:flutter_riverpod_task_management/common/widgets/reusable_text_widget.dart';
import 'package:flutter_riverpod_task_management/common/widgets/width_spacer_widget.dart';
import 'package:flutter_riverpod_task_management/common/widgets/xpansion_tile.dart';
import 'package:flutter_riverpod_task_management/features/todo/controllers/xpansion_provider.dart';
import 'package:flutter_riverpod_task_management/features/todo/widgets/todo_tile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> with TickerProviderStateMixin {
  TextEditingController searchController = TextEditingController();
  late final TabController tabController = TabController(length: 2, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(85),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusableTextWidget(
                      text: 'Dashboard',
                      style: appStyleWidget(
                        18,
                        AppConstants.kLight,
                        FontWeight.bold,
                      ),
                    ),
                    Container(
                      width: 25.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                        color: AppConstants.kLight,
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            9.h,
                          ),
                        ),
                      ),
                      child: GestureDetector(
                        onTap: () {},
                        child: const Icon(
                          Icons.add,
                          color: AppConstants.kDarkBk,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              HeightSpacer(height: 20.h),
              CustomTextField(
                controller: searchController,
                hintText: "Search",
                prefixIcon: Container(
                  padding: EdgeInsets.all(15.h),
                  child: GestureDetector(
                    onTap: null,
                    child: const Icon(
                      AntDesign.search1,
                      color: AppConstants.kGreyLight,
                    ),
                  ),
                ),
                suffixIcon: const Icon(
                  FontAwesome.sliders,
                  color: AppConstants.kGreyLight,
                ),
              ),
              HeightSpacer(height: 15.h),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ListView(
            children: [
              HeightSpacer(height: 5.h),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    FontAwesome.tasks,
                    size: 20.w,
                    color: AppConstants.kLight,
                  ),
                  WidthSpacer(width: 10.w),
                  ReusableTextWidget(
                    text: "Today's Task",
                    style: appStyleWidget(
                      18,
                      AppConstants.kLight,
                      FontWeight.bold,
                    ),
                  ),
                ],
              ),
              HeightSpacer(height: 25.h),
              Container(
                decoration: BoxDecoration(
                  color: AppConstants.kLight,
                  borderRadius: BorderRadius.all(
                    Radius.circular(AppConstants.kRadius),
                  ),
                ),
                child: TabBar(
                    isScrollable: false,
                    labelColor: AppConstants.kBlueLight,
                    labelStyle: appStyleWidget(24, AppConstants.kBlueLight, FontWeight.w700),
                    labelPadding: EdgeInsets.zero,
                    unselectedLabelColor: AppConstants.kLight,
                    indicator: BoxDecoration(
                      color: const Color.fromARGB(255, 18, 174, 72),
                      borderRadius: BorderRadius.all(
                        Radius.circular(AppConstants.kRadius),
                      ),
                    ),
                    indicatorSize: TabBarIndicatorSize.label,
                    controller: tabController,
                    tabs: [
                      Tab(
                        child: SizedBox(
                          width: AppConstants.kWidth * 0.5,
                          child: Center(
                            child: ReusableTextWidget(
                              text: "Pending",
                              style: appStyleWidget(
                                16,
                                AppConstants.kDarkBk,
                                FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        child: SizedBox(
                          width: AppConstants.kWidth * 0.5,
                          child: Center(
                            child: ReusableTextWidget(
                              text: "Completed",
                              style: appStyleWidget(
                                16,
                                AppConstants.kDarkBk,
                                FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
              HeightSpacer(height: 20.h),
              SizedBox(
                height: AppConstants.kHeight * 0.3,
                width: AppConstants.kWidth,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(AppConstants.kRadius),
                  ),
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      Container(
                        color: AppConstants.kLightBk,
                        height: AppConstants.kHeight * 0.3,
                        child: ListView(
                          children: [
                            TodoTile(
                              start: "03.00",
                              end: "05.00",
                              switcherWidget: Switch(
                                value: true,
                                /*trackOutlineColor:
                                    MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
                                  if (states.contains(MaterialState.disabled)) {
                                    return Colors.orange.withOpacity(.48);
                                  }
                                  return null; // Use the default color.
                                }),*/
                                activeColor: AppConstants.kRed,
                                onChanged: (value) {}, //save the value
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: AppConstants.kLightBk,
                        height: AppConstants.kHeight * 0.3,
                      ),
                    ],
                  ),
                ),
              ),
              HeightSpacer(height: 20.h),
              XpansionTile(
                text: "Tomorrow's Task",
                text2: "Tomorrow's tasks are shown here",
                onExpansionChanged: (bool expanded) {
                  ref.read(xpansionStateProvider.notifier).setStart(!expanded);
                },
                trailing: Padding(
                  padding: EdgeInsets.only(right: 10.w),
                  child: ref.watch(xpansionStateProvider)
                      ? const Icon(
                          AntDesign.circledown,
                          color: AppConstants.kLight,
                        )
                      : const Icon(AntDesign.closecircleo, color: AppConstants.kBlueLight),
                ),
                children: [
                  TodoTile(
                    start: "03.00",
                    end: "05.00",
                    switcherWidget: Switch(
                      value: true,
                      activeColor: AppConstants.kRed,
                      onChanged: (value) {}, //save the value
                    ),
                  ),
                ],
              ),
              HeightSpacer(height: 20.h),
              XpansionTile(
                text: DateTime.now().add(const Duration(days: 2)).toString().substring(5, 10),
                text2: "Tomorrow's tasks are shown here",
                onExpansionChanged: (bool expanded) {
                  ref.read(xpansionState0Provider.notifier).setStart(!expanded);
                },
                trailing: Padding(
                  padding: EdgeInsets.only(right: 10.w),
                  child: ref.watch(xpansionState0Provider)
                      ? const Icon(
                          AntDesign.closecircleo,
                          color: AppConstants.kLight,
                        )
                      : const Icon(AntDesign.circledown, color: AppConstants.kGreen),
                ),
                children: [
                  TodoTile(
                    start: "03.00",
                    end: "05.00",
                    switcherWidget: Switch(
                      value: true,
                      activeColor: AppConstants.kRed,
                      onChanged: (value) {}, //save the value
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
