import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';

import 'transport.dart';
import 'dart:io';
import 'package:string_validator/string_validator.dart';

class TransportHTTP implements ProvTransport{
  HttpClient client = new HttpClient();
  String hostname;
  final int port;
  //Map <String,String> headers;
  TransportHTTP(String hostname, this.port) {
    if (!isIP(hostname)) {
      throw FormatException('hostname should be an IP address.');
    }
    else {
      this.hostname = hostname;
    }
    this.client.connectionTimeout = Duration(seconds: 45);
  }

  @override
  Future<bool>  connect() async {
    HttpClientRequest request;
    try {
      print('Connecting to' + this.hostname);
      request  = await this.client.post(this.hostname, this.port,'/');
      request.headers.set(HttpHeaders.contentTypeHeader, 'application/x-www-form-urlencoded');
      request.headers.set(HttpHeaders.acceptHeader, 'text/plain');
      await request.close();
      print('Connection successful');
      return true;
    }
    catch(e){
      print('Connection error ' + e.toString());
      return false;
    }

  }

  @override
  Future<void> disconnect() {
    // TODO: implement disconnect
    throw UnimplementedError();
  }

  @override
  Future<Uint8List> sendReceive(String epName, Uint8List data) async {
    HttpClientRequest request;
    try {
      print('Connecting to' + this.hostname);
      request = await this.client.post(this.hostname, this.port, epName);
      request.headers.set(
          HttpHeaders.contentTypeHeader, 'application/x-www-form-urlencoded');
      request.headers.set(HttpHeaders.acceptHeader, 'text/plain');
      request.write(data);
      print('Connection successful');
    }
    catch (e) {
      print('Connection error ' + e.toString());
    }
    final response = await request.close();
    response.transform(utf8.decoder).listen((contents) {
      print(contents);
    });

    return Uint8List(5);
    }
  }



