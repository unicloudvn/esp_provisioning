import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';

import 'transport.dart';
import 'dart:io';
import 'package:string_validator/string_validator.dart';

class TransPortHTTP implements ProvTransport{
  HttpClient client = new HttpClient();
  String hostname;
  int port;
  Map <String,String> headers;
  SecurityContext ssl_context;

  TransPortHTTP(String hostname, int port, SecurityContext ssl_context) {
    if (!isIP(hostname)){
      throw FormatException('hostname should be an IP address.');
    }
    else{
      this.hostname = hostname;
    }
    this.port = port;

    if (ssl_context == null){
      this.ssl_context = ssl_context;
    }
    this.client.connectionTimeout = Duration(seconds: 45);

    try {
      print('Connecting to' + this.hostname);
      client.open('GET', this.hostname, this.port,'');
      print('Connection is successful');
      this.headers = {'Content-type': 'application/x-www-form-urlencoded','Accept': 'text/plain'};
    }
    catch(e){
      print('Connection error ' + e.toString());
  }

  @override
  Future<bool> connect() {
    // TODO: implement connect
    throw UnimplementedError();
  }

  @override
  Future<void> disconnect() {
    // TODO: implement disconnect
    throw UnimplementedError();
  }

  @override
  Future<Uint8List> sendReceive(String epName, Uint8List data) {
    // TODO: implement sendReceive
    throw UnimplementedError();
  }
}

