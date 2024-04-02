
class TextProperties {
  String? text;
  double? top, left;
  double? size;

  List<TextProperties> textList = [];

  TextProperties({this.text, this.top, this.left, this.size});

  factory TextProperties.setData(Map map) => TextProperties(
    text: map['text'],
    top: map['top'],
    left: map['left'],
    size: map['size'],
  );

  refreshList() {
    textList = list.map((e) => TextProperties.setData(e)).toList();
  }
}

List list = [
  {
    'text': 'This is sample text 1',
    'top': 180.0,
    'left': 90.0,
    'size': 30.0,
  },
  {
    'text': 'This is sample text 2',
    'top': 180.0,
    'left': 90.0,
    'size': 30.0,
  }
];
