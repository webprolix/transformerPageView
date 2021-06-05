# TransformerPageView Example
```javascript
TransformerPageView(
      loop: true,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          color: Colors.white,
          child: Center(
            child: Text(
              "Page 0$index",
              style: const TextStyle(fontSize: 80.0, color: Colors.black),
            ),
          ),
        );
      },
      itemCount: 3);
```
***
#Step-by-Step
## Load library using pubspec.yaml
#### change environment settings becouse, its not supporting null-saftey 

``` javascript
version: 1.0.0+1

environment:
  sdk: ">2.0.0 <3.0.0"
  flutter: ">=0.1.4 <3.0.0"
```
## add dependency 
```javascript
dependencies:
  flutter:
    sdk: flutter


  cupertino_icons: ^1.0.2
  flutter_swiper_null_safety: ^1.0.2
  transformer_page_view:
  ```
  ## Import library

  ```javascript
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:transformerPageView/contentpage.dart';
import 'package:transformer_page_view/transformer_page_view.dart';
  ```
  ## Now add TransformerPageView() to scaffold

  ```javascript
@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TransformerPageView(
      loop: true,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          color: Colors.white,
          child: Center(
            child: Text(
              "Page 0$index",
              style: const TextStyle(fontSize: 80.0, color: Colors.black),
            ),
          ),
        );
      },
      itemCount: 3),
    );
  }
  ```

# Watch output 
  [![Watch the video](http://flutter.webprolix.com/youtube_video.jpg)](https://youtu.be/VkDupXC_nPs)

