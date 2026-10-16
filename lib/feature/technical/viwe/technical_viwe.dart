import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:malam/core/constans/appcolor.dart';
import 'package:malam/feature/home/widget/custom_textfiled.dart';
import 'package:malam/feature/technical/cubit/cubit_technical.dart';
import 'package:malam/feature/technical/cubit/status.dart';
import 'package:malam/feature/technical/viwe/details_viwe.dart';
import 'package:malam/feature/technical/widget/custom_card_tec.dart';
import 'package:malam/sheard/custom_text.dart';
import 'package:skeletonizer/skeletonizer.dart';

class TechnicalViwe extends StatelessWidget {
  const TechnicalViwe({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Appcolor.backgroundColor,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
        title: const CustomText(
          text: "الفنيين",
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: BlocBuilder<CubitTechnical, TechnicalStatus>(
        builder: (context, state) {
          final cubit = context.read<CubitTechnical>();

          return Skeletonizer(
            enabled: state is TechnicalLoading,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: GridView.builder(
                itemCount: cubit.modletchnical.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, i) {
                  final techincal = cubit.modletchnical[i];
                  return GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => TechincalDetails(
                          workerimages: techincal.workerimages ?? [],
                          image: techincal.image,
                          name: techincal.name,
                          descr: techincal.description,
                          title: techincal.service,
                          city: techincal.address,
                          rota: techincal.rota,
                          experience: techincal.experience,
                          craftsmanid: techincal.id,
                        ),
                      ),
                    ),
                    child: CustomCardTec(
                      image: techincal!.image,
                      name: techincal.name,
                      title: techincal.service,
                      city: techincal.address,
                      rota: techincal.rota,
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
