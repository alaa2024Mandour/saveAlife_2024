import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save_a_life_2024/admin_cubit/status.dart';

class AdminCubit extends Cubit<AdminStatus> {
  AdminCubit() : super(InitialAdminState());
  static AdminCubit get(context) => BlocProvider.of(context);
  // -------------- AdminController ----------------
  // -------------- Upload files controller ----------------
  var donorEmail = TextEditingController();
  var FileController = TextEditingController();


  String ?fileName;
  Future uploadFile () async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if(result != null){
      File file= File(result.files.single.path ?? " ");

      fileName =file.path.split('/').last;
      String filePath = file.path;

      onSendProgress:(int send, int total){
        print("$send , $total");
      };
      emit(UploadResult());
    }else{
      print("Result is null");
    }
  }
}