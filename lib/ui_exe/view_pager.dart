import 'package:flutter/material.dart';
import 'package:flutter_demo/common_title_bar.dart';
import 'package:flutter_demo/ui_exe/banner.dart';
import 'package:cached_network_image/cached_network_image.dart';

const Banner_Height = 200.0;

class BannerViewTest extends StatefulWidget {
  final datas = <String>[
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1535887267&di=982a924cbdd3bec962d4bdef30dbf7d2&imgtype=jpg&er=1&src=http%3A%2F%2Fimg5.iqilu.com%2Fc%2Fu%2F2015%2F0508%2F1431046270599.jpg',
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1535292545393&di=75bd2d7a4ac19a9f7ba52573b303e2f2&imgtype=0&src=http%3A%2F%2Fimg3.duitang.com%2Fuploads%2Fitem%2F201505%2F01%2F20150501225552_Rauh4.thumb.700_0.jpeg',
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1535292545389&di=a09e42a050da5a7a8942970942006c5e&imgtype=0&src=http%3A%2F%2Fimg4q.duitang.com%2Fuploads%2Fitem%2F201507%2F03%2F20150703213147_xmaJU.png',
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1535294093140&di=fd739f9a880e72060f045af4901028bb&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimgad%2Fpic%2Fitem%2F7acb0a46f21fbe09334115c061600c338644adc3.jpg',
  ];
  int curentPoi = 0;

  @override
  _BannerViewTestState createState() => _BannerViewTestState();
}

class _BannerViewTestState extends State<BannerViewTest> {
  @override
  Widget build(BuildContext context) {
    return new CommonTitleBar(
      title: 'BannerView',
      body: _initBody(),
    );
  }

  _initBody() {
    return Container(
      height: Banner_Height,
      child: Stack(
        children: <Widget>[
          BannerView(
            data: widget.datas,
            buildShowView: (index, data) {
              return _bannerView(data);
            },
            onBannerClickListener: (index, data) {
              print(index);
            },
            height: Banner_Height,
            bannerPosition: (int position) {
              setState(() {
                widget.curentPoi = position;
              });
            },
          ),
          Align(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: _buildBannerIndicator(),
              ),
              alignment: Alignment.bottomRight)
        ],
      ),
    );
  }

  _bannerView(data) {
    return CachedNetworkImage(imageUrl: data, fit: BoxFit.fill);
  }

  _buildBannerIndicator() {
    final indicators = <Widget>[];
    for (int i = 0; i < widget.datas.length; i++) {
      final dot = Container(
        margin: EdgeInsets.all(5.0),
        width: 10.0,
        height: 10.0,
        child: CircleAvatar(
          backgroundColor: widget.curentPoi % widget.datas.length == i
              ? Colors.black
              : Colors.red,
        ),
      );
      indicators.add(dot);
    }
    return indicators;
  }
}
