class CalcModel {
  late String name;
  String get getName => name;
  set setName(String _name) => name = _name;

  late String label;
  String get getLabel => label;
  set setLabel(String _label) => label = _label;

  late Function fn;
  Function get getFn => fn;
  set setFn(Function _fn) => fn = _fn;

  CalcModel(this.name, this.label, this.fn);
}