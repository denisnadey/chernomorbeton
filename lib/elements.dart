import 'package:cbethonapp/bloc/entity_bloc.dart';
import 'package:cbethonapp/element_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ElementCardsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => EntityPageState();
}

class EntityPageState extends State<ElementCardsPage> {
  final EntityBloc _entityBloc = EntityBloc();
  void initState() {
    _entityBloc.add(LoadingEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _entityBloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text("CHBD✌️"),
        ),
        body: Center(
            child: Padding(
          padding: const EdgeInsets.only(top: 40, left: 10, right: 10),
          child: Center(child: BlocBuilder<EntityBloc, EntityState>(
            builder: (context, state) {
              if (state is EntityEmpty) {
                return Text(state.toString());
              } else if (state is EntityLoaded) {
                return ListView.separated(
                  itemCount: state.elements.length,
                  itemBuilder: (BuildContext context, int index) {
                    ElementCard _element = state.elements[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          title: Text(_element.categoryName),
                          subtitle: Text(_element.type),
                        ),
                        Text(
                          "Выбери наименование: ",
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(
                          height: 300,
                          child: ListView.builder(
                            itemCount: _element.categoryList.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(_element.categoryList[index].id +
                                    " | " +
                                    _element.categoryList[index].name +
                                    " | " +
                                    _element.categoryList[index].price +
                                    " | " +
                                    _element.type),
                              );
                            },
                          ),
                        )
                      ],
                    );
                  },
                  separatorBuilder: (context, index) => Divider(),
                );
              } else if (state is EntityLoading) {
                return CircularProgressIndicator(
                  color: Colors.black12,
                );
              } else {
                return Text(state.toString());
              }
            },
          )),
        )),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _entityBloc.add(LoadingEvent());
          },
          child: const Icon(Icons.update),
          backgroundColor: Colors.blue,
        ),
      ),
    );
  }
}
