# flutter_demo

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Flutter 代码片段
搜索 flutter snippets 安装
全称：Awesome Flutter Snippets

### 自定义代码片段
VSCode中使用快捷键 `command + shif + o` 搜索 `> snip` 找到 `configure User Snippets`，选择dart语言，会打开dart.json文件

**例子**

```
"StatelessWidget": {
	  "prefix": "sl",
	  "body": [
		"class ${1:WidgetName} extends StatelessWidget {",
		"\t@override",
		"\tWidget build(BuildContext context) {",
		"\t\treturn ${2:Container}();",
		"\t}",
		"}"
	  ],
	  "description": "StatelessWidget"
	},
	prefix :得到这个代码片段要输入的 快捷键
	body: 代码片段的主体
	编辑点的格式: 在body里面可以插入一些编辑点，编辑点的格式 ${1:默认的字符}  ，1 是编辑的序号
	\t: 表示一个tap键
	description: 代码片段的描述
	在使用中，直接点击Tap可以跳到第二个编辑点
```

