import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:local_telephone_dairy/core/presentation/appbar/appbar_without_search.dart';
import 'package:local_telephone_dairy/core/theme/app_color.dart';
import 'package:local_telephone_dairy/features/contact/entities/contact_entities.dart';
import 'package:local_telephone_dairy/features/contact/presentation/widgets/information_section.dart';
import 'package:local_telephone_dairy/features/contact/presentation/widgets/profile_container.dart';

class ContactDetailScreen extends StatelessWidget {
  final ContactEntities contact;

   const ContactDetailScreen({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: AppColor.background,
      appBar:   AppbarWithoutSearch(title: "${contact.name}'s Detail"),
      body: SingleChildScrollView(
        padding:  const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 12,
        ),
        child: Column(
          children: [
             ProfileContainer(
              name: contact.name,
              icon: IconsaxPlusBold.profile,
            ),
             const SizedBox(height: 20),
             InformationSection(
              icon: IconsaxPlusBold.message,
              title: "Email",
              detail: contact.email??"",
            ),
             InformationSection(
              icon: IconsaxPlusBold.mobile,
              title: "Contact",
              detail: contact.phoneNumber,
            ),
             InformationSection(
              icon: IconsaxPlusBold.location,
              title: "Address",
              detail: contact.address??"",
            ),
            InformationSection(
              icon: IconsaxPlusBold.briefcase,
              title: "Occupation",
              detail: contact.occupation??"",
            ),
             InformationSection(
              icon: contact.gender == "Male"
                  ? IconsaxPlusLinear.man
                  : IconsaxPlusLinear.woman,
              title: "Gender",
              detail: contact.gender??"",
            ),
            //  InformationSection(
            //   icon: IconsaxPlusBold.card,
            //   title: "PAN Number",
            //   detail: "",
            // ),
            //  InformationSection(
            //   icon: IconsaxPlusBold.card_tick,
            //   title: "Citizenship Number",
            //   detail: "",
            // ),
          ],
        ),
      ),
    );
  }
}
