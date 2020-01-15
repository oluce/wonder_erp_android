import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Divider(),
              new Text('KPI 2020', style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              )),
              new Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(10.0),
                  margin: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
                  child: new SizedBox(height: 250.0, child: StackedBarChart.withSampleData()),
              ),
              new Divider(),
              new Text('KPI DỰ TRỮ', style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              )),
            ]
        ),
    );
  }
}



class StackedBarChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  StackedBarChart(this.seriesList, {this.animate});

  /// Creates a stacked [BarChart] with sample data and no transition.
  factory StackedBarChart.withSampleData() {
    return new StackedBarChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }


  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(
      seriesList,
      animate: animate,
      barGroupingType: charts.BarGroupingType.stacked,
    );
  }

  /// Create series list with multiple series
  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final desktopSalesData = [
      new OrdinalSales('1', 55),
      new OrdinalSales('2', 25),
      new OrdinalSales('3', 100),
      new OrdinalSales('4', 75),
      new OrdinalSales('5', 55),
      new OrdinalSales('6', 85),
      new OrdinalSales('7', 90),
      new OrdinalSales('8', 95),
      new OrdinalSales('9', 125),
      new OrdinalSales('10', 155),
      new OrdinalSales('11', 175),
      new OrdinalSales('12', 125),
    ];

    final tableSalesData = [
      new OrdinalSales('1', 15),
      new OrdinalSales('2', 25),
      new OrdinalSales('3', 100),
      new OrdinalSales('4', 75),
      new OrdinalSales('5', 55),
      new OrdinalSales('6', 85),
      new OrdinalSales('7', 90),
      new OrdinalSales('8', 95),
      new OrdinalSales('9', 125),
      new OrdinalSales('10', 155),
      new OrdinalSales('11', 175),
      new OrdinalSales('12', 125),
    ];

    final mobileSalesData = [
      new OrdinalSales('1', 25),
      new OrdinalSales('2', 25),
      new OrdinalSales('3', 100),
      new OrdinalSales('4', 75),
      new OrdinalSales('5', 55),
      new OrdinalSales('6', 85),
      new OrdinalSales('7', 90),
      new OrdinalSales('8', 95),
      new OrdinalSales('9', 125),
      new OrdinalSales('10', 155),
      new OrdinalSales('11', 175),
      new OrdinalSales('12', 125),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
        id: 'Desktop',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: desktopSalesData,
      ),
      new charts.Series<OrdinalSales, String>(
        id: 'Tablet',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: tableSalesData,
      ),
      new charts.Series<OrdinalSales, String>(
        id: 'Mobile',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: mobileSalesData,
      ),
    ];
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}
