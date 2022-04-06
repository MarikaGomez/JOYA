import 'package:flutter/cupertino.dart';
import 'package:joya/bloc/bloc_provider.dart';
import 'package:joya/bloc/controller/RequestBloc.dart';
import 'package:joya/component/ScaffoldComponent.dart';
import 'package:joya/enum/EnumerateCategoriesScaffold.dart';

import 'ErrorPage.dart';

class QrCodeScan extends StatelessWidget{
  final bool debugShowCheckedModeBanner;
  final bool isIOSPlatform;

  QrCodeScan({required this.isIOSPlatform, required this.debugShowCheckedModeBanner});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<RequestBloc>(context);
    if(isIOSPlatform){
      return Container();
    }else{
      return ScaffoldComponent(
          enumerateCategoriesScaffold: EnumerateCategoriesScaffold.curvedBar,
          isIOSPlatform: isIOSPlatform,
          debugShowCheckedModeBanner: debugShowCheckedModeBanner,
          child: Container(
              height: double.infinity,
              width: double.infinity,
              child: StreamBuilder<Map<String, dynamic>>(
                  stream: bloc?.stream,
                  builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.data == null) {
                      return ErrorPage(
                          errorMessage: 'Data is Null',
                          debugShowCheckedModeBanner: debugShowCheckedModeBanner,
                          isIOSPlatform: isIOSPlatform);
                    } else if (snapshot.hasData) {
                      return Container(); // TO DO
                    }else{
                      return ErrorPage(
                          errorMessage: 'Data is Null',
                          debugShowCheckedModeBanner: debugShowCheckedModeBanner,
                          isIOSPlatform: isIOSPlatform);
                    }
                  }
              )
          )
      );
    }
  }

}