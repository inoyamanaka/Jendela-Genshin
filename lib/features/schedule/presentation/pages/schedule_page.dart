import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:genshin_app/core/shared/constants/colors.dart';
import 'package:genshin_app/core/shared/constants/fonts.dart';
import 'package:genshin_app/di/injection.dart';
import 'package:genshin_app/features/schedule/presentation/bloc/schedule/schedule_bloc.dart';
import 'package:genshin_app/features/schedule/presentation/widgets/schedule_card.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  final scheduleBloc = sl<ScheduleBloc>();
  @override
  void initState() {
    super.initState();
    scheduleBloc.add(GetScheduleEvent());
  }

  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();

    void scrollDown() {
      controller.animateTo(
        controller.position.minScrollExtent,
        duration: const Duration(seconds: 2),
        curve: Curves.fastOutSlowIn,
      );
    }

    return BlocProvider(
      create: (context) => scheduleBloc,
      child: BlocBuilder<ScheduleBloc, ScheduleState>(
        builder: (context, state) {
          if (state is ScheduleSuccess) {
            final charSchedule = state.data.characterSchedule;
            return Scaffold(
              backgroundColor: GenshinColors.blackPrimary,
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerTop,
              floatingActionButton: FloatingActionButton.small(
                onPressed: scrollDown,
                child: const Icon(Icons.arrow_upward),
              ),
              body: SizedBox(
                height: MediaQuery.sizeOf(context).height - 50,
                child: SingleChildScrollView(
                  child: Container(
                    height: (150 * charSchedule.length).toDouble(),
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        const Gap(30),
                        Text(
                          'Today Schedule',
                          style:
                              GenshinFonts.subTitleInria.copyWith(fontSize: 16),
                        ),
                        const Gap(10),
                        Container(
                          height: 290,
                          width: double.infinity,
                          color: Colors.amber,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 80,
                                    height: 100,
                                    margin: const EdgeInsets.all(10),
                                    color: GenshinColors.blackPrimary,
                                  ),
                                  const Column(
                                    children: [
                                      Text('Material Name'),
                                      Text('Material Name'),
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                width: 80,
                                height: 100,
                                margin: const EdgeInsets.all(10),
                                color: GenshinColors.blackPrimary,
                              ),
                            ],
                          ),
                        ),
                        const Gap(10),
                        Text(
                          'Character Talents Materials',
                          style:
                              GenshinFonts.subTitleInria.copyWith(fontSize: 16),
                        ),
                        // const Gap(20),
                        Flexible(
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: charSchedule.length,
                            itemBuilder: (context, index) => ScheduleCard(
                              charSchedule: charSchedule,
                              index: index,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
