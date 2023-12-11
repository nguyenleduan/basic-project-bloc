import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:onlinica/config/loading_config.dart';
import 'package:onlinica/widget/theme/theme_helper.dart';
import 'package:photo_view/photo_view.dart';


class PhotoViewScreen extends StatefulWidget {
  String urlImage;
    PhotoViewScreen(this.urlImage,{super.key});

  @override
  State<PhotoViewScreen> createState() => _PhotoViewScreenState();
}

class _PhotoViewScreenState extends State<PhotoViewScreen> {
  @override
  void initState() {
    super.initState();
    if(widget.urlImage.isEmpty){
      showError('không tìm thấy url chứng chỉ');
      context.pop();
    }
  }
  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: const IconThemeData( 
            color: Colors.white,
          ),
          backgroundColor: appTheme.blueLogin,
          centerTitle: true,
          title: const Text("Chứng chỉ của bạn",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
        ),
          body: PhotoView(
        minScale: PhotoViewComputedScale.contained * 1,
        imageProvider: NetworkImage(widget.urlImage),
        backgroundDecoration: const BoxDecoration(
          color: Colors.transparent,
        ),
      ),
    );
  }
}
