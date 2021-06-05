# transformerPageView
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