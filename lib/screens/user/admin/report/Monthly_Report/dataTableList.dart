import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mum_k4/models/aahnik.dart';


class MonthlyDataTableList extends StatefulWidget {
  @override
  _MonthlyDataTableListState createState() => _MonthlyDataTableListState();
}

class _MonthlyDataTableListState extends State<MonthlyDataTableList> {
  @override
  Widget build(BuildContext context) {
    final aahniks = Provider.of<List<Aahnik>>(context) ?? [];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        child: DataTable(
          sortColumnIndex: 0,
          sortAscending: true,
          columnSpacing: 15,
          columns: const <DataColumn>[
            DataColumn(
              label: Text(
                'Date',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                'Aarti',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                'Mansi',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
             DataColumn(
              label: Text(
                'Nitya Prerna',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                'Vachnamrut & Swami ni vato',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                'Chesta',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                'Ghar Sabha',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                'Jivan Charitra',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ],
          rows: aahniks.map((aahnik) => DataRow(cells: [
            DataCell(
              Text(aahnik.date),
            ),
            DataCell(
              Text(aahnik.aarti),
            ),
            DataCell(
              Text(aahnik.mansi),
            ),
            DataCell(
              Text(aahnik.nityap),
            ),
            DataCell(
              Text(aahnik.vanchan),
            ),
            DataCell(
              Text(aahnik.chesta),
            ),
            DataCell(
              Text(aahnik.gharsabha),
            ),
            DataCell(
              Text(aahnik.jivan),
            ),
          ])).toList(),
        ),
      ),
    );
  }
}
