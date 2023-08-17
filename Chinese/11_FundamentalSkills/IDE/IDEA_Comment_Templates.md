[Back](README.md)

### IDEA注释模版配置

<hr>

### 1. 类注释
```
Preference->Editor->File and Code Templates

File 选项卡->Class, Interface, Enum

如果有File Header则修改它，如下:

 /**
  * @author: KG
  * @description:
  * @date: Created in ${YEAR}年${MONTH}月${DAY}日 ${TIME}
  * @modified by: 
  */
```

见下图
![avatar](https://github.com/Elliot518/mcp-oss-repo/blob/main/ide/idea/FileHeaderTemplate.png?raw=true)

&nbsp;

###2. 方法注释

- 根据形参数目自动生成 @param 注解
- 根据方法是否有返回值智能生成 @Return 注解

这里配置会比较复杂, 需要分几步才能完成。

2-1) 配置Template Group
```
Preference->Editor->Live Tempaltes

点击最右边的 +

首先选择 2. Template Group... 来创建一个模板分组

在弹出的对话框内输入MyTemplate
```
见下图
![avatar](https://raw.githubusercontent.com/Elliot518/mcp-oss-repo/main/ide/idea/LiveTemplate1.png)

2-2) 在自定义模板分组下新建Live Template
```
选中刚刚创建的模板分组 MyTemplate
然后点击 +
选择 1. Live Template
点击 Define，在弹框中勾选Java，表示将该模板应用于所有的 Java 类型文件。

此时就会创建了一个空的模板
我们修改该模板的 Abbreviation、Description 和 Template text
需要注意的是，Abbreviation 必须为 *，最后检查下 Expand with 的值是否为 Enter 键。
```

见下图
![avatar](https://raw.githubusercontent.com/Elliot518/mcp-oss-repo/main/ide/idea/LiveTemplate2.png)

上图中· Template text 内容如下，请直接复制进去，需要注意首行没有 /，且 \* 是顶格的
```
*
 * 
 * @author KG
 * @date $date$ $time$$param$ $return$
 */
```

2-3) 配置参数方法映射

```
还记得我们配置 Template text 时里面包含了类似于 $date$ 这样的参数，
此时 IDEA 还不认识这些参数是啥玩意，
下面我们对这些参数进行方法映射，让 IDEA 能够明白这些参数的含义。
```


点击 Edit variables 按钮, 见下图
![avatar](https://raw.githubusercontent.com/Elliot518/mcp-oss-repo/main/ide/idea/LiveTemplate3.png)


为每一个参数设置相对应的 Expression, 见下图
![avatar](https://raw.githubusercontent.com/Elliot518/mcp-oss-repo/main/ide/idea/LiveTemplate4.png)

param的groovy脚本:
```
groovyScript("def result = '';def params = \"${_1}\".replaceAll('[\\\\[|\\\\]|\\\\s]', '').split(',').toList(); for(i = 0; i < params.size(); i++) {if(params[i] != '')result+='* @param ' + params[i] + ((i < params.size() - 1) ? '\\r\\n ' : '')}; return result == '' ? null : '\\r\\n ' + result", methodParameters())
```

return的groovy脚本:
```
groovyScript("return \"${_1}\" == 'void' ? null : '\\r\\n * @return ' + \"${_1}\"", methodReturnType())
```

```
注：你还注意到我并没有勾选了 Skip if defined 属性，它的意思是如果在生成注释时候如果这一项被定义了，
那么鼠标光标就会直接跳过它。
我并不需要这个功能，因此没有勾选该属性。
```

点击 OK 保存设置，大功告成！

验证:
```
在方法的上一行, 输入: /*
然后按回车
注释会自动出现
```

&nbsp;

###3. Q & A

```
（1）为什么模板的 Abbreviation 一定要叫 \* ？Expand with 要保证是 Enter 键？
答：因为 IDEA 模板的生成逻辑是 模板名 + 生成键，当生成键是 Enter 时，我们输入 * + Enter 就能够触发模板。
这也同时说明了为什么注释模板首行是一个 * 了，因为当我们先输入 /*，然后输入 * + Enter，触发模板，
首行正好拼成了 /**，符合 Javadoc 的规范。

（2）注释模板中为什么有一行空的 \*？
答：因为我习惯在这一行写方法说明，所以就预留了一行空的写，你也可以把它删掉。

（3）注释模板中 $time$$param$ 这两个明明不相干的东西为什么紧贴在一起？
答：首先网上提供的大部分 param 生成函数在无参情况下仍然会生成一行空的 @param，
因此我对param 函数的代码进行修改，使得在无参情况下不生成 @param，
但是这就要求 $param$ 要和别人处在同一行中，不然没法处理退格。

（4）为什么 return 参数不使用 methodReturnType()， 而要自己实现？
答：methodReturnType() 在无返回值的情况下会返回 void，这并没有什么意义，
因此我对 methodReturnType() 返回值进行了处理，仅在有返回值时才生成。

（5）为什么 $return$ 不是单独一行？
答：因为当 methodReturnType() 返回 null 时，无法处理退格问题，原因同第三点。
```




