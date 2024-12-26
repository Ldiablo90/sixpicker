import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sixpicker/mvvm/view_model/vm_bill.dart';
import 'package:sixpicker/mvvm/view_model/vm_picker.dart';
import 'package:sixpicker/router/route_path.dart';
import 'package:sixpicker/router/router.dart';
import 'package:sixpicker/screens/main/widget/w_bill_page.dart';
import 'package:sixpicker/screens/public/widget/w_scaffold.dart';

class Bill extends ConsumerStatefulWidget {
  const Bill({super.key});

  @override
  ConsumerState createState() => _BillState();
}

class _BillState extends ConsumerState<Bill> with TickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: ref.read(vmPicker).pickData.length, vsync: this);
    controller.addListener(()=> ref.read(vmBill.notifier).setPage(controller.index + 1));
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  "${ref.watch(vmBill)} / ${ref.watch(vmPicker).pickData.length}"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [ElevatedButton(onPressed: (){context.pushReplacement(PathPicker.path);}, child: const Text("To modify a number"))],
          ),
          const Spacer(flex: 1),
          Expanded(
            flex: 20,
            child: ref.watch(vmPicker).pickData.isNotEmpty
                ? TabBarView(
                    controller: controller,
                    children: ref
                        .watch(vmPicker)
                        .pickData
                        .map((picks) => BillPage(picks: picks))
                        .toList(),
                  )
                : const Center(
                    child: Text("Please create a number"),
                  ),
          ),
          const Spacer(flex: 3),
        ],
      ),
    );
  }
}
