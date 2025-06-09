import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:local_telephone_dairy/core/presentation/animation/app_animated_switcher.dart';
import 'package:local_telephone_dairy/core/theme/app_color.dart';
import 'package:local_telephone_dairy/features/contact/application/cubit/contact_cubit.dart';
import 'package:local_telephone_dairy/features/contact/application/cubit/contact_state.dart';
import 'package:local_telephone_dairy/features/home/presentation/widget/card_option.dart'
    show ChatOptionsWidget;
import 'package:nepali_utils/nepali_utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _callNumber(String number) {

  }

  void _copyNumber(BuildContext context, String number) {
    Clipboard.setData(ClipboardData(text: number));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Copied $number to clipboard')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<ContactCubit, ContactState>(
        builder: (context, state) {
          switch (state.status) {
            case ContactStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case ContactStatus.success:
              return _buildSuccessState(context, state);
            case ContactStatus.error:
              return Center(
                child: Text(state.errorMessage ?? "Unexpected Error Occurred"),
              );
            default:
              return const Center(
                  child: Text("Unexpected Error Occurred, Try Again"));
          }
        },
      ),
    );
  }

  Scaffold _buildSuccessState(BuildContext context, ContactState state) {
    final NepaliDateTime nepaliDate = NepaliDateTime.now();

    // ignore: unused_local_variable
    final String formattedDate = NepaliDateFormat.MMMMd().format(nepaliDate);
    return Scaffold(
      body: AppAnimatedSwitcher(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              actions: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: [
                      Icon(IconsaxPlusLinear.profile),
                      SizedBox(
                        width: 6,
                      ),
                      Text("Sumin Mhrx")
                    ],
                  ),
                )
              ],
              leading: const Padding(
                padding: EdgeInsets.only(left: 12),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(IconsaxPlusLinear.search_normal_1),
                ),
              ),
            ),
            _buildGreeting(
              "Hello, Sumin",
              context,
            ),
            _buildGreeting("Make your day ease with us", context,
                isSubText: true),
            SliverToBoxAdapter(
              child: ChatOptionsWidget(),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: Text(
                  "Helpful Contacts You Can Count On",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ),
            SliverList.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                final screenWidth = MediaQuery.of(context).size.width;
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                  child: ListTile(
                    tileColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://randomuser.me/api/portraits/women/65.jpg"),
                      radius: screenWidth * 0.06, // ~6% of screen width
                    ),
                    title: Text(
                      "Sumin",
                      style: TextStyle(fontSize: screenWidth * 0.045), // ~5%
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Chair person",
                          style: TextStyle(
                              fontSize: screenWidth * 0.03), // smaller font
                        ),
                        SizedBox(height: screenWidth * 0.01),
                        Text(
                          "+977 9867811182",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: screenWidth * 0.035),
                        ),
                      ],
                    ),
                    trailing: SizedBox(
                      width:
                          screenWidth * 0.25, // width relative to screen width
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: Icon(IconsaxPlusLinear.call,
                                color: Colors.green, size: screenWidth * 0.06),
                            onPressed: () => _callNumber("phoneNumber"),
                            tooltip: 'Call',
                          ),
                          IconButton(
                            icon: Icon(IconsaxPlusLinear.copy,
                                color: AppColor.primaryColor,
                                size: screenWidth * 0.06),
                            onPressed: () =>
                                _copyNumber(context, "phoneNumber"),
                            tooltip: 'Copy Number',
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGreeting(String text, BuildContext context,
      {bool isSubText = false}) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: screenWidth * 0.005, // ~1% of width for vertical padding
          horizontal: screenWidth * 0.02, // ~2% horizontal padding
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: isSubText
                ? screenWidth * 0.045
                : screenWidth * 0.06, // dynamic font sizes
            fontWeight: isSubText ? FontWeight.w500 : FontWeight.bold,
            color: isSubText ? Colors.grey[700] : Colors.black,
            letterSpacing: 1.2,
          ),
        ),
      ),
    );
  }
}
