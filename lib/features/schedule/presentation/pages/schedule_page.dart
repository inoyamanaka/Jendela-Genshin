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
    return BlocProvider(
      create: (context) => scheduleBloc,
      child: BlocBuilder<ScheduleBloc, ScheduleState>(
        builder: (context, state) {
          if (state is ScheduleSuccess) {
            final charSchedule = state.data.characterSchedule;
            return Scaffold(
              backgroundColor: GenshinColors.blackPrimary,
              body: SizedBox(
                height: MediaQuery.sizeOf(context).height - 80,
                child: SingleChildScrollView(
                  child: Container(
                    height: (150 * charSchedule.length).toDouble(),
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        const Gap(100),
                        Text(
                          'Character Talents Materials',
                          style:
                              GenshinFonts.subTitleInria.copyWith(fontSize: 16),
                        ),
                        const Gap(20),
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
