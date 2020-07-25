abstract class JSONable{

  JSONable.fromJson();

  JSONable cloneFromJson(Map<String,dynamic> json);

  Map<String,dynamic> toJson();

}