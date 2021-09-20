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
        backgroundColor: Color(0xff43515a),
        body: Center(
            child: Padding(
          padding:
              const EdgeInsets.only(top: 16, left: 30, right: 30, bottom: 16),
          child: Center(child: BlocBuilder<EntityBloc, EntityState>(
            builder: (context, state) {
              if (state is EntityEmpty) {
                return Text(state.toString());
              } else if (state is EntityLoaded) {
                return ListView.separated(
                  clipBehavior: Clip.none,
                  itemCount: state.elements.length,
                  itemBuilder: (BuildContext context, int index) {
                    ElementCard _element = state.elements[index];
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11),
                        color: Color(0xc1f7f7f7),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 14,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 68,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(13),
                                  ),
                                  child: Container(
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(13),
                                      color: Colors.white,
                                    ),
                                    child: Image.network(
                                      _element.getImageById(),
                                      fit: BoxFit.fill,
                                      width: 68,
                                      height: 68,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 22),
                                Container(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        child: SizedBox(
                                          width: 163,
                                          child: Text(
                                            _element.categoryName,
                                            style: TextStyle(
                                              color: Color(0xff3b5779),
                                              fontSize: 17,
                                              fontFamily: "Roboto",
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 6),
                                      Container(
                                        height: 41,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Единица измерения - ${_element.type}",
                                              style: TextStyle(
                                                color: Color(0xff3b5779),
                                                fontSize: 12,
                                              ),
                                            ),
                                            SizedBox(height: 8),
                                            Container(
                                              height: 19,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    height: 19,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              9),
                                                      color: Colors.white,
                                                    ),
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                      horizontal: 18,
                                                      vertical: 3,
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          "Выберите наименование",
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xff3b5779),
                                                            fontSize: 11,
                                                            fontFamily:
                                                                "Roboto",
                                                            fontWeight:
                                                                FontWeight.w300,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(
                    height: 16,
                  ),
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

class CardOldChbd extends StatelessWidget {
  const CardOldChbd({
    Key? key,
    required ElementCard element,
  })  : _element = element,
        super(key: key);

  final ElementCard _element;

  @override
  Widget build(BuildContext context) {
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
  }
}
