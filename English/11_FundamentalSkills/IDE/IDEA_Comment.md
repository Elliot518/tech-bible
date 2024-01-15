[Back](README.md)

## IntelliJ IDEA Customized Comment Settings

<hr>


### 1. Class Header Comment

File(IntelliJ IDEA)–>Settings->Editor->File and Code Templates->Includes

![class header comment](https://github.com/Elliot518/mcp-oss-tech/blob/main/ide/idea/class_header_comment.png?raw=true)


Comment Template:

```java
/**
 * @author: Elliot
 * @description:
 * @date: Created in ${TIME} ${DATE}
 * @modified by: 
 */
```
&nbsp;

### 2. Method comment template by configuring live template

#### 2-1) Add "Template Group" in "Live Templates"

File(IntelliJ IDEA)–>Settings->Editor->Live Templates->+ "Template Group"

![](https://github.com/Elliot518/mcp-oss-tech/blob/main/ide/idea/add_template_group.png?raw=true)

<hr>

#### 2-2) Edit method comment template

Click + -> Add method comment template -> Set Abbreviation as "*" and description as "Method Comment Template"

![method comment template](https://github.com/Elliot518/mcp-oss-tech/blob/main/ide/idea/method_comment_template.png?raw=true)

_The content of the comment template is as follows, please copy it directly. Please note that there is no / in the first line, and \* is in the top format_
```java
*
 * 
 * @author Elliot
 * @date $date$ $time$$param$ $return$
 */
```
<hr>

#### 2-3) Configure parameter method mapping

_eg: configure stuff like $date$_

Click button "Edit variables"

![configure parameter method](https://github.com/Elliot518/mcp-oss-tech/blob/main/ide/idea/parameter_method_configure.png?raw=true)

groovy script of param:
```groovy
groovyScript("def result = '';def params = \"${_1}\".replaceAll('[\\\\[|\\\\]|\\\\s]', '').split(',').toList(); for(i = 0; i < params.size(); i++) {if(params[i] != '')result+='* @param ' + params[i] + ((i < params.size() - 1) ? '\\r\\n ' : '')}; return result == '' ? null : '\\r\\n ' + result", methodParameters())
```

groovy script of return:
```groovy
groovyScript("return \"${_1}\" == 'void' ? null : '\\r\\n * @return ' + \"${_1}\"", methodReturnType())
```

<hr>

#### 2-4) Verify

On the line above the method, enter: /* <br>
Then press enter <br>
Comments will appear automatically <br>












