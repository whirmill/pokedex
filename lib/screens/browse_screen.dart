import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import './details_screen.dart';

class BrowseScreen extends StatefulWidget {
  const BrowseScreen({this.optionStyle});

  final TextStyle optionStyle;

  @override
  _BrowseScreenState createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> {
  // final formKey = GlobalKey<FormState>();
  // final key = GlobalKey<ScaffoldState>();
  final TextEditingController _filter = TextEditingController();
  final dio = Dio();
  String _searchText = "";
  List<String> names = List<String>();
  List<String> filteredNames = List<String>();
  Icon _searchIcon = Icon(Icons.search);
  Widget _appBarTitle = Text('Cerca pokemon');

  _BrowseScreenState() {
    _filter.addListener(() {
      if (_filter.text.isEmpty) {
        setState(() {
          _searchText = "";
          filteredNames = names;
        });
      } else {
        setState(() {
          _searchText = _filter.text;
        });
      }
    });
  }

  @override
  void initState() {
    this._getNames();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildBar(context),
      body: Container(
        child: _buildList(),
      ),
      resizeToAvoidBottomPadding: false,
    );
  }

  Widget _buildBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: _appBarTitle,
      leading: IconButton(
        icon: _searchIcon,
        onPressed: _searchPressed,
      ),
    );
  }

  Widget _buildList() {
    if (_searchText.isNotEmpty) {
      filteredNames = filteredNames
          .where((e) => e.toLowerCase().contains(_searchText.toLowerCase()))
          .toList();
    }
    return ListView.builder(
      itemCount: names == null ? 0 : filteredNames.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(filteredNames[index]),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      DetailsScreen(pokemonName: filteredNames[index])),
            );
          },
        );
      },
    );
  }

  void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = Icon(Icons.close);
        this._appBarTitle = TextField(
          controller: _filter,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.search), hintText: 'Search...'),
        );
      } else {
        this._searchIcon = Icon(Icons.search);
        this._appBarTitle = Text('Cerca pokemon');
        filteredNames = names;
        _filter.clear();
      }
    });
  }

  void _getNames() async {
    final response =
        await dio.get('https://pokeapi.co/api/v2/pokemon?limit=151');
    List<String> tempList = (response.data['results'] as List)
        .map((e) => (e['name'] as String))
        .toList();

    setState(() {
      names = tempList;
      filteredNames = names;
    });
  }
}
