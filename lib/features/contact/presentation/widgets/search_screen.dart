// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:local_telephone_dairy/core/presentation/appbar/appbar_without_search.dart';
import 'package:local_telephone_dairy/core/responsive_size.dart';
import 'package:local_telephone_dairy/core/theme/app_color.dart';
import 'package:local_telephone_dairy/features/contact/entities/contact_entities.dart';
import 'package:local_telephone_dairy/features/contact/presentation/contact_detail_screen.dart';
import 'package:searchfield/searchfield.dart';

class SearchScreen extends StatefulWidget {
  final List<ContactEntities> contact;

  const SearchScreen({super.key, required this.contact});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: const AppbarWithoutSearch(
        title: "Discover People",
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SearchField<ContactEntities>(
              maxSuggestionsInViewPort: 5,
              itemHeight: ScreenUtils.getHeight(context, .10),
              controller: _searchController,
              hint: 'Search by Name',
              suggestionsDecoration: SuggestionDecoration(
                color: AppColor.background,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
                elevation: 0,
              ),
              suggestionItemDecoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              searchInputDecoration: SearchInputDecoration(
                filled: true,
                fillColor: Colors.grey.withOpacity(0.1),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
                hintText: 'Search by Name',
                hintStyle: TextStyle(color: Colors.grey.shade600, fontSize: 16),
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          setState(() {
                            _searchController.clear();
                          });
                        },
                      )
                    : null,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blueGrey.shade600,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
              marginColor: Colors.white,
              suggestions: widget.contact
                  .map(
                    (e) => SearchFieldListItem<ContactEntities>(
                      e.name,
                      child: SeaechListTile(contact: e),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class SeaechListTile extends StatelessWidget {
  final ContactEntities contact;

  const SeaechListTile({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.blueGrey.shade300,
        child: Text(
          contact.name.substring(0, 1).toUpperCase(),
          style: const TextStyle(color: Colors.white),
        ),
      ),
      title: Text(
        contact.name,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.blueGrey.shade800,
        ),
      ),
      subtitle: Text(
        contact.phoneNumber,
        style: TextStyle(
          fontSize: 14,
          color: Colors.blueGrey.shade600,
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ContactDetailScreen(contact: contact),
          ),
        );
      },
    );
  }
}
