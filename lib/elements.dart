import 'package:cbethonapp/bloc/entity_bloc.dart';
import 'package:cbethonapp/element_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

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
            child: Column(
          children: [
            SizedBox(
              height: 450,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 16, left: 30, right: 30, bottom: 16),
                child: Center(child: BlocBuilder<EntityBloc, EntityState>(
                  builder: (context, state) {
                    if (state is EntityEmpty) {
                      return Text("пусто");
                    } else if (state is EntityLoaded) {
                      return ListView.separated(
                        itemCount: state.elements.length,
                        itemBuilder: (BuildContext context, int index) {
                          ElementCard _element = state.elements[index];
                          return SimpleCard(element: _element);
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
              ),
            ),
            CustomButton()
          ],
        )),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 51,
      height: 51,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(42.50),
              boxShadow: [
                BoxShadow(
                  color: Color(0x3f000000),
                  blurRadius: 25,
                  offset: Offset(0, 4),
                ),
              ],
              color: Colors.white,
            ),
            padding: const EdgeInsets.only(
              left: 9,
              right: 10,
              top: 10,
              bottom: 9,
            ),
            child: InkWell(
              onTap: () {
                print("object");
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SvgPicture.asset(
                  'assets/carbon_add-alt.svg',
                  width: 32,
                  height: 32,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SimpleCard extends StatelessWidget {
  const SimpleCard({
    Key? key,
    required ElementCard element,
  })  : _element = element,
        super(key: key);

  final ElementCard _element;

  @override
  Widget build(BuildContext context) {
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
                      _element.imagepath,
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
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 19,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(9),
                                      color: Colors.white,
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 18,
                                      vertical: 3,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Выберите наименование",
                                          style: TextStyle(
                                            color: Color(0xff3b5779),
                                            fontSize: 11,
                                            fontFamily: "Roboto",
                                            fontWeight: FontWeight.w300,
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
