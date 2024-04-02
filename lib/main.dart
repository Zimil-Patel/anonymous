import 'package:flutter/material.dart';

import 'model/mdoel.dart';

void main() {
  runApp(const PostEditor());
}

class PostEditor extends StatefulWidget {
  const PostEditor({super.key});

  @override
  State<PostEditor> createState() => _PostEditorState();
}

class _PostEditorState extends State<PostEditor> {
  late TextProperties txt;
  late double width;
  int? selectedText = null;
  @override
  Widget build(BuildContext context) {
    txt = TextProperties();
    txt.refreshList();
    width = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Post Editor',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.black,
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //post box
                    postBox(),
                  ],
                ),
              ),
            ),

            //bottom bar
            bottomBar(),
          ],
        ),
      ),
    );
  }

  Container postBox() {
    return Container(
      height: width,
      width: width,
      margin: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10),
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
              'https://5.imimg.com/data5/SELLER/Default/2020/12/OE/ER/FH/5862409/festival-post-design-services-500x500.jpg'),
        ),
      ),
      child: Stack(
        children: [
          ...List.generate(
            txt.textList.length,
                (index) => Positioned(
              top: txt.textList[index].top,
              bottom: 0,
              left: txt.textList[index].left,
              right: 0,
              child: GestureDetector(
                onTap: () {
                  selectedText = index;
                },
                child: Container(
                  decoration:BoxDecoration(
                    border: Border.all(width: 2.5, color: Colors.teal),
                  ),
                  child: Text(
                    txt.textList[index].text!,
                    style: TextStyle(
                      fontSize: txt.textList[index].size,
                      color: Colors.white,
                    ),
                  ),
                )
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container bottomBar() {
    return Container(
      height: 100,
      width: double.infinity,
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //top bottom
          topBottomButton(),
          //left right button
          leftRightButton(),
          //font size button
          fontSizeButton(),
        ],
      ),
    );
  }

  Row fontSizeButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          height: 60,
          width: 60,
          child: IconButton(
            alignment: Alignment.center,
            onPressed: () {
              setState(() {
                double count = txt.textList[selectedText!].size!;
                count += 1;
                list[selectedText!]['size'] = count;
              });
            },
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          height: 60,
          width: 60,
          child: IconButton(
            alignment: Alignment.center,
            onPressed: () {
              setState(() {
                double count = txt.textList[selectedText!].size!;
                count -= 1;
                list[selectedText!]['size'] = count;
              });
            },
            icon: const Icon(
              Icons.remove,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Row leftRightButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          height: 60,
          width: 60,
          child: IconButton(
            alignment: Alignment.center,
            onPressed: () {
              setState(() {
                double count = txt.textList[selectedText!].left!;
                count -= 4;
                list[selectedText!]['left'] = count;
              });
            },
            icon: const Icon(
              Icons.keyboard_arrow_left,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          height: 60,
          width: 60,
          child: IconButton(
            alignment: Alignment.center,
            onPressed: () {
              setState(() {
                double count = txt.textList[selectedText!].left!;
                count += 4;
                list[selectedText!]['left'] = count;
              });
            },
            icon: const Icon(
              Icons.keyboard_arrow_right,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Row topBottomButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          height: 60,
          width: 60,
          child: IconButton(
            alignment: Alignment.center,
            onPressed: () {
              setState(() {
                double count = txt.textList[selectedText!].top!;
                count -= 4;
                list[selectedText!]['top'] = count;
              });
            },
            icon: const Icon(
              Icons.keyboard_arrow_up,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          height: 60,
          width: 60,
          child: IconButton(
            alignment: Alignment.center,
            onPressed: () {
              setState(() {
                double count = txt.textList[selectedText!].top!;
                count += 4;
                list[selectedText!]['top'] = count;
              });
            },
            icon: const Icon(
              Icons.keyboard_arrow_down,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}



