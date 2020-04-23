import 'package:bloc_pattern/bloc/data/data_provider/DataProvider.dart';

class Repository {
    final DataProvider dataProvider;
    int num = 1;

    Repository(this.dataProvider);

    void setNum(int num){
      if(!(num <= 0 && num >= 10)){
        this.num = num;
      }
    }

    Future<dynamic> getAllData() async {
        var dataSetA = await dataProvider.readData(num);
        return dataSetA;
    }
}