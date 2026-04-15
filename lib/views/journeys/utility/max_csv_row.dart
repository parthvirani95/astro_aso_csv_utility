import 'package:astro_aso_csv_utility/shared/extention/color_extension.dart';
import 'package:astro_aso_csv_utility/shared/themes/app_color.dart';
import 'package:astro_aso_csv_utility/views/cubits/utility/utility_cubit.dart';
import 'package:astro_aso_csv_utility/views/widgets/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MaxCSVRows extends StatefulWidget {
  final UtlityCubit utilityCubit;
  final UtilityLoadedState state;
  const MaxCSVRows({super.key, required this.utilityCubit, required this.state});

  @override
  State<MaxCSVRows> createState() => _MaxCSVRowsState();
}

class _MaxCSVRowsState extends State<MaxCSVRows> {
  late final UtlityCubit utilityCubit;
  late final UtilityLoadedState state;
  final TextEditingController maxRowController = TextEditingController();

  @override
  void initState() {
    state = widget.state;
    utilityCubit = widget.utilityCubit;
    maxRowController.text =
        state.splitCSVMaxRows == 0 ? state.totalCSVRows.toString() : state.splitCSVMaxRows.toString();
    super.initState();
  }

  @override
  void dispose() {
    maxRowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommonWidget().sizesBox(height: 12),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.r),
          child: Row(
            children: [
              CommonWidget().containerField(context: context, title: "Enter Max Rows per CSV"),
              Spacer(),
              CommonWidget().containerField(
                context: context,
                title: "Cancel",
                onTap: () async => Navigator.pop(context),
              ),
              CommonWidget().sizesBox(width: 12),
              CommonWidget().containerField(
                context: context,
                title: "Clear",
                onTap: () async {
                  maxRowController.clear();
                  setState(() {});
                },
              ),
              CommonWidget().sizesBox(width: 12),
              CommonWidget().containerField(
                context: context,
                title: "Apply",
                onTap: () async {
                  int maxRows = int.tryParse(maxRowController.text.trim()) ?? 0;
                  utilityCubit.updateSplitCSVMaxRows(splitCSVMaxRows: maxRows, state: state);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        CommonWidget().sizesBox(height: 16),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.r),
          child: Container(
            decoration: BoxDecoration(
              color: AppColor.greyColor.withOpacityNew(0.1),
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: AppColor.greyColor.withOpacityNew(0.2)),
            ),
            child: TextField(
              controller: maxRowController,
              keyboardType: TextInputType.number,
              maxLines: 1,
              autofocus: true,
              decoration: InputDecoration(
                hintText: "Enter max rows per CSV",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide.none,
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 12.r, vertical: 12.r),
                labelStyle: Theme.of(context).textTheme.displaySmall?.copyWith(fontSize: 15.sp),
                hintStyle: Theme.of(context).textTheme.displaySmall?.copyWith(
                      fontSize: 15.sp,
                      color: AppColor.custom4,
                    ),
              ),
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontSize: 15.sp,
                    color: AppColor.whiteColor,
                    height: 1.6,
                  ),
            ),
          ),
        ),
        CommonWidget().sizesBox(height: 16),
      ],
    );
  }
}
