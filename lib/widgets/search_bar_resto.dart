import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:new_practice/services/resto_services.dart';

class SearchForm extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _typeAheadController = TextEditingController();

  String _selectedResto;
  SearchForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(32.0, 15.0, 32.0, 15.0),
      child: Container(
        child: Form(
          key: this._formKey,
          child: Column(
            children: <Widget>[
              // Text('What is your favorite city?'),
              TypeAheadFormField(
                textFieldConfiguration: TextFieldConfiguration(
                    controller: this._typeAheadController,
                    decoration: InputDecoration(
                        hintText: 'Restaurants',
                        contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(width: 0.8),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide(width: 0.8)),
                        prefixIcon: Icon(Icons.search, size: 30.0),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.clear),
                          onPressed: () {},
                        ))),
                suggestionsCallback: (pattern) {
                  return getRestos(pattern);
                },
                itemBuilder: (context, suggestion) {
                  return ListTile(
                    title: Text(suggestion),
                  );
                },
                transitionBuilder: (context, suggestionsBox, controller) {
                  return suggestionsBox;
                },
                onSuggestionSelected: (suggestion) {
                  this._typeAheadController.text = suggestion;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please select a restaurant';
                  }
                  return '';
                },
                onSaved: (value) => this._selectedResto = value,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
