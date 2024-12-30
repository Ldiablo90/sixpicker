import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sixpicker/mvvm/view_model/vm_local.dart';
import 'package:sixpicker/mvvm/view_model/vm_picker.dart';
import 'package:sixpicker/router/route_path.dart';
import 'package:sixpicker/screens/main/widget/w_pick_ball.dart';
import 'package:sixpicker/screens/public/widget/w_button_box.dart';
import 'package:sixpicker/screens/public/widget/w_button_fit.dart';
import 'package:sixpicker/screens/public/widget/w_scaffold.dart';
import 'package:sixpicker/utils/u_size.dart';

class Picker extends ConsumerStatefulWidget {
  const Picker({super.key});

  @override
  ConsumerState createState() => _PickerState();
}

class _PickerState extends ConsumerState<Picker> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if(ref.read(vmLocal).isFirst) ref.read(vmPicker.notifier).showHelp(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){FocusManager.instance.primaryFocus?.unfocus();},
      child: BaseScaffold(
        child: Column(
          children: [
            Row(
              children: [
                const Spacer(flex: 10),
                ButtonFit(onTap: (){ref.read(vmPicker.notifier).showHelp(context);}, child: const Icon(Icons.info_outline))
              ],),
            const Spacer(flex: 1),
            Row(
              children: [
                Expanded(
                  flex: 10,
                  child: TextField(
                    controller: controller,
                    keyboardType: TextInputType.number,
                    maxLength: 20,
                    decoration: const InputDecoration(counterText: ""),
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                ),
                const Spacer(flex: 1),
                ButtonFit(
                  flex: 5,
                  onTap: () {ref.read(vmPicker.notifier).setSeed(context, seed: controller.text);},
                  child: const ButtonBox("Set Code"),
                ),
              ],
            ),
            const Spacer(flex: 2),
            Row(children: [Text("Picker Code : ${ref.watch(vmPicker).seed}", style: const TextStyle(fontSize: 18),)]),
            if(ref.watch(vmPicker).pickType > 2)
            Row(children: [Text("Location : ${ref.watch(vmLocal).latitude} /  ${ref.watch(vmLocal).longitude}", style: const TextStyle(fontSize: 18),)]),
            const Spacer(flex: 2),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [Text("make : ${ref.watch(vmPicker).ymd}")]),
            Row(
              children: [
                const Text("Type : ", style: TextStyle(fontSize: 18)),
                Expanded(
                  child: DropdownButtonHideUnderline(child: DropdownButton(
                      value: ref.watch(vmPicker).pickType,
                      alignment: AlignmentDirectional.topStart,
                      dropdownColor: Colors.transparent,
                      items: const [
                        DropdownMenuItem(value: 1, child: Text("Seed", style: TextStyle(color: Colors.white, shadows: [Shadow(blurRadius: 5,offset: Offset(1, 1),color: Colors.grey)]))),
                        DropdownMenuItem(value: 2, child: Text("Seed + Time", style: TextStyle(color: Colors.white, shadows: [Shadow(blurRadius: 5,offset: Offset(1, 1),color: Colors.grey)]))),
                        DropdownMenuItem(value: 3, child: Text("Seed + Location", style: TextStyle(color: Colors.white, shadows: [Shadow(blurRadius: 5,offset: Offset(1, 1),color: Colors.grey)]))),
                        DropdownMenuItem(value: 4, child: Text("Seed + Time + Location", style: TextStyle(color: Colors.white, shadows: [Shadow(blurRadius: 5,offset: Offset(1, 1),color: Colors.grey)]))),
                  ], onChanged: ref.read(vmPicker.notifier).setPickType)),
                ),
              ],
            ),
            const Spacer(flex: 2),
            Row(
              children: [
                ButtonFit(
                  flex: 5,
                  onTap: (){ref.read(vmPicker.notifier).initPickData();},
                  child: const ButtonBox("Data Reset"),
                ),
                const Spacer(),
                ButtonFit(
                  flex: 5,
                  onTap: (){ref.read(vmPicker.notifier).setPickData(context);},
                  child: const ButtonBox("Pick Data"),
                ),
              ],
            ),
            const Spacer(flex: 3),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black26,width: 5),
                borderRadius: BorderRadius.circular(BaseSize.baseRound),
              ),
              padding: EdgeInsets.all(BaseSize.basePaddingFit),
              child: Wrap(
                runSpacing: 10,
                children: ref.watch(vmPicker).pickData.map(
                      (pickData) => Row(
                    children: pickData
                        .map(
                          (data) => Expanded(
                        child: Center(
                          child: PickBall(pick: data),
                        ),
                      ),
                    )
                        .toList(),
                  ),
                ).toList(),
              ),
            ),
            const Spacer(flex: 3),
            Row(
              children: [
                ButtonFit(
                  onTap: (){context.push(PathBill.path);},
                  child: const ButtonBox("Bill View"),
                ),
              ],
            ),
            const Spacer(flex: 15),
          ],
        ),
      ),
    );
  }

}
