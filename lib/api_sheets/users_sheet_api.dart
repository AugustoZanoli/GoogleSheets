import 'package:fsheets/models/user.dart';
import 'package:gsheets/gsheets.dart';

class UserSheetsApi{
  static const _credentials = r''' 
  {
  "type": "service_account",
  "project_id": "gsheets-408722",
  "private_key_id": "13e1a97a653a80aa58554bcb19cc0e348f4140b0",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCexxEMaFGJ9RvZ\n14l1xmqSFA84yUfqgLNvCeSvGNWAcfcPOiYhyg8wW1C79hXQp/luoW2B+NeowhAR\nz6EuzAVTcTYxwWJptlOF1KrNafKsV07VCGabApNmbRTBhJcGXFKyGDyvg2N6etLJ\nmjDs3RRd1wMlxY1IZ5nF0e3Y4HM97pEkGC5IjFsiqshNR7RN1TLDIcwF4BqIypXz\np4PS00g0h0WpeE4HO6lpreewHtSeaxQcPh77uOydYMGkwnVOEyduT6eYHYtTMSpw\nvVWuM0uk6p1rKQIZwg7RsU7K8fHKD4hYePI/W+gyeJ7+kXEmxcU5sxCUM7sLmsSd\nV0AZmUIHAgMBAAECggEAFICS+H2t7bj7QC1fQBh/YV56urPu995njRKDd4Km6v+M\nTeiNzPYo8O8RpTu5BGj0Qe9RUyOdQVrRtWMQppjMpUIso88bVJgo/9J+vaiNH+jk\nMojzqtdxzhuOvxBOahFY0ktj5qv6F/ItLsAcyjEf9KATdXilbjCGgC9D3anZ56im\n1+pk2Ppxi85pBP5jkOKoGAqOVjLyZCnERi346f/LvmGuTlmdjU2DqLtyIyBpDZku\nIN+2j6cHyI9KJqGxrh6dci1o3xwWNoz2JqbEWH0qAqSdFTUVS2cqO1TXQcpD7OJ6\n9cs70CFEgwOqbG7lB8GbK5u67JK1CBcXZbEQHcmkOQKBgQDZqajLitt8jidy/FZq\nuvU7emblnXSm9w2OS38r2d4JAS2mSM8NOQyDCEM3JO29z3kNeUZuzL3jcH1rxkHA\nxkSm9dhwuY1VlKmEeRNZ4L00WSlcbZsj13yUFi7vCtJEFBSF01KqJh37Zo+XYxgZ\nV6z6lpKh3x0yuvLUd4PjfFVUrwKBgQC6vkvZCrOPod7FwzBIlQ+z7IzoK3xEsR6A\nOWp8H5jxgqfYpFmyGSjX/hGmQZMBqZ+lMjYZJNA/YfI+K3ddASpIHnkWouEPtua8\nj8TgfkN7HYMoGWUyDgtJjzRO8Sj9SCgect870h59Y2cHB5ETe3apt69xjpMK+clG\nchMjDQzuKQKBgF+gu2kZi46wgcJx/KGNnBpSj4yH3e1RE2KV5rxkTrmUC/NHf7gm\nfUnAQo+iqNTAp0V1J62cRDz9egz0oITKVvUng70auG6GDugFravKIjYyigpymTto\n+/GvwVUCYxjH3bBiBKp+bqO6DpILVlYj//pkVu3JMXHNUsxn6cjzIiY/AoGAYihE\nlgEaARWEk07VwlEXv+tG5YJ1/2VaMuv7HOM+8TNMJoO84fB3l5Dklg9Bxk3yrFKI\nPQ8spyREwIj4ZNqH7wCVhWB4DFqHTfYD9jxoG/6XQiyXFIhtRm0Pga8hbIDRFbAr\nxrXbcO0e6oL/rs3mwa7beUUH5W0GbxDnHjVt5oECgYBysxtR59eX6I0DAujSHTol\nSQPFXKgWFYiOkBNgNUOi86luXRCORhZ5qPHFiL/lgoDv4sFF+zyF0oNh395C0fzX\n/iBaEstOUo1rAtV6rnQJzncya/kvDR+1sFhZcV98ECDjXnRz5bG/me7liQeQpv/J\n0jq2C2rr2pNH9Gqbpuowug==\n-----END PRIVATE KEY-----\n",
  "client_email": "gsheet@gsheets-408722.iam.gserviceaccount.com",
  "client_id": "104942777748032468902",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/gsheet%40gsheets-408722.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
}

  ''';

  static final _spreadsheetId = '1kAlZlzWicDq3Ux2ZbKm4npm9S7vZ0gzXMd8r6rG188k';
  static final _gsheets = GSheets(_credentials);
  static Worksheet? _userSheet;

  static Future init() async {
    try{
      final spreadsheet = await _gsheets.spreadsheet(_spreadsheetId);
      _userSheet = await _getWorkSheet(spreadsheet, title:'Users');

      final firstRow = UserFields.getFields();
      _userSheet!.values.insertRow(1, firstRow);
      } catch (e) {
        print('Init Error: $e');
      }

  }

  static Future <Worksheet> _getWorkSheet(
    Spreadsheet spreadsheet, {
      required String title,
    }
  ) async {
    try {
    return await spreadsheet.addWorksheet(title);} catch (e){
      return spreadsheet.worksheetByTitle(title)!;
    }
  }

  static Future<int> getRowCount() async{
    if(_userSheet == null) return 0;

    final lastRow = await _userSheet!.values.lastRow();
    return lastRow == null ? 0 : int.tryParse(lastRow.first) ?? 0;
  }

  static Future insert(List<Map<String, dynamic>> rowList) async{
    if(_userSheet == null) return;

    _userSheet!.values.map.appendRows(rowList);
  }
}