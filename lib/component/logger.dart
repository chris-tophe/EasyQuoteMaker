import 'dart:developer';

class Logger{

  static void info(String message){
    log("[ INFO ] : $message");
  }
  static void warn(String message){
    log("[ WARNING ] : $message");
  }
  static void error(String message){
    log("[ ERROR ] : $message");
  }
}