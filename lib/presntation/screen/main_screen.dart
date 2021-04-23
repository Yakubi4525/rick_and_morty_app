import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/domain/bloc/get_list_of_persons_bloc.dart';
import 'package:rick_and_morty_app/domain/bloc_models/bloc_person_models.dart';
import 'package:rick_and_morty_app/domain/model/person.dart';
import 'package:rick_and_morty_app/domain/model/person_response.dart';
import 'package:rick_and_morty_app/internal/dependencies/persons_list_bloc_module.dart';
import 'package:rick_and_morty_app/presntation/screen/detail_person_screen.dart';
import 'package:rick_and_morty_app/presntation/style/theme.dart';
import 'package:rick_and_morty_app/presntation/widget/avatar_widget.dart';
import 'package:rick_and_morty_app/presntation/widget/green_shape_widget.dart';
import 'package:rick_and_morty_app/presntation/widget/loading_widget.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  GetPersonBloc _getPersonBloc;

  @override
  void initState() {
    _getPersonBloc = PersonsListModule.getBloc();
    _getPersonBloc.loadListOfPersons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text(
            appTittle,
            style: kTittleTextStyle,
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                stream: _getPersonBloc.subject.stream,
                initialData: _getPersonBloc.defaultItem,
                builder: (BuildContext context,
                    AsyncSnapshot<PersonResponseModel> snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data is PersonResponseInitilState)
                      return Container();
                    else if (snapshot.data is PersonResponseLoadingState)
                      return buildLoadingWidget();
                    else if (snapshot.data is PersonResponseOkState) {
                      return _buildListOfPersons(snapshot.data);
                    } else if (snapshot.data is PersonResposeErrorState) {
                      return Center(
                        child: Text('${snapshot.error}'),
                      );
                    }
                  }
                  return Container();
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildListOfPersons(PersonResponseModel data) {
    List<PersonModel> persons = data.persons;

    if (persons.length == 0) {
      return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "No more persons",
              style: TextStyle(color: Colors.black45),
            ),
          ],
        ),
      );
    } else
      return ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 20),
          itemCount: persons.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailScreen(
                              model: persons[index],
                            )));
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, bottom: 10),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF323247).withOpacity(0.08),
                        spreadRadius: 0,
                        blurRadius: 32,
                        offset: Offset(0, 24), // changes position of shadow
                      ),
                      BoxShadow(
                        color: Color(0xFF323247).withOpacity(0.08),
                        spreadRadius: 0,
                        blurRadius: 16,
                        offset: Offset(0, 16), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                    color: kGreyPrimaryColor,
                  ),
                  height: 85,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 12, bottom: 12, left: 12, right: 23),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Row(
                          children: [
                            avatarWidget(url: persons[index].image, radius: 30),
                            SizedBox(
                              width: 14,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 135,
                                  child: Text(
                                    '${persons[index].name}',
                                    overflow: TextOverflow.ellipsis,
                                    style: kTittleTextStyle,
                                  ),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                greenshapeWidget(
                                  status: persons[index].status,
                                  species: persons[index].species,
                                  textStyle: kGreyTextStyle
                                )
                              ],
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Text(
                                '${persons[index].gennder}',
                                overflow: TextOverflow.ellipsis,
                                style: kGreyTextStyle,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          });
  }
}
