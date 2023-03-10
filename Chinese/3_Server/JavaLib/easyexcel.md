[Back](README.md)

<hr>

### 1. 简介
>EasyExcel 是阿里巴巴开源的一个 Excel 处理框架，使用简单、节省内存。节省内存的原理也很简单，在解析 Excel 时没有将文件数据全部加载到内存当中，而是从磁盘文件中一行行读取。

&nbsp;

### 2. 写入实例

- 2-1) 添加依赖
    ```java
    <dependency>
        <groupId>com.alibaba</groupId>
        <artifactId>easyexcel</artifactId>
        <version>2.2.11</version>
    </dependency>
    ```
    _注: 我们这里使用2.x, easy excel的api, 2.x和3.x还是区别很大的。_

<hr>

- 2-2) 创建实体类
    ```java
    @Data
    public class UserData {

        @ExcelProperty(index = 0, value = "姓名")
        private String username;

        @ExcelProperty(index = 1, value = "年龄")
        private int age;

        @DateTimeFormat("yyyy-MM-dd")
        @ExcelProperty(index = 2, value = "生日")
        private Date birthday;
    }
    ```

    | 注解 | 解释 |
    | ---- | ---- |
    | @ExcelProperty | 用于设置 Excel 表头，其中 index 用户表头的编号，从 0 开始；value 为表头对应的内容。|
    | @DateTimeFormat | 用于日期的格式化。|

<hr>

- 2-3) 生成 Excel
```java
public class EasyExcelWriteDemo {

    public static void main(String[] args) {
        // 实现excel写操作
        //1.设置写入文件夹地址和excel文件名称
        String fileName = "/Users/kg/Downloads/student.xlsx";
        //调用easyExcel里面的方法实现写操作
        //2个参数，第一个参数是文件名称，第二个参数是实体类
        EasyExcel.write(fileName, UserData.class).sheet("学生信息表").doWrite(getData());

        System.out.println("Excel file: " + fileName + " write successfully!");
    }

    //创建方法返回list集合
    public static List<UserData> getData() {
        List<UserData> list = new ArrayList<>();

        UserData userData1 = new UserData();
        userData1.setUsername("张三");
        userData1.setAge(22);
        userData1.setBirthday(formatDate("2000-10-11"));
        list.add(userData1);

        UserData userData2 = new UserData();
        userData2.setUsername("李四");
        userData2.setAge(23);
        userData2.setBirthday(formatDate("1999-5-3"));
        list.add(userData2);

        return list;
    }

    public static Date formatDate(String birthday) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyy-MM-dd");
        try {
            return sdf.parse(birthday);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return null;
    }
}
```


&nbsp;

### 3. 解析实例

- 3-1) 创建监听器 ExcelListener
首先创建一个监听器 ExcelListener，集成 EasyExcel 提供 AnalysisEventListener 类：
    ```java
    public class ExcelListener extends AnalysisEventListener<UserData> {

        /**
        * 一行一行的读取excel内容
        */
        @Override
        public void invoke(UserData data, AnalysisContext analysisContext) {
            System.out.println("****" + data);
        }

        /**
        * 读取表头内容
        */
        @Override
        public void invokeHeadMap(Map<Integer, String> headMap, AnalysisContext context) {
            System.out.println("表头" + headMap);
        }

        /**
        * 读取完成操作
        */
        @Override
        public void doAfterAllAnalysed(AnalysisContext analysisContext) {
            System.out.println("读取Excel完毕");
        }
    }
    ```
    在该监听器中，通过重写 AnalysisEventListener 的方法来获得解析的数据、表头信息，以及解析完毕之后执行的操作信息。

<hr>

- 3-2) 读操作
  通过 EasyExcel 类的静态方法来执行读操作。
    ```java
    public class EasyExcelReadDemo {

        public static void main(String[] args) {
            // 实现excel写操作
            //1.设置写入文件夹地址和excel文件名称
            String fileName = "/Users/kg/Downloads/student.xlsx";
            //调用easyExcel里面的方法实现写操作
            //2个参数，第一个参数是文件名称，第二个参数是实体类
            EasyExcel.read(fileName, UserData.class, new ExcelListener()).sheet().doRead();
        }
    }
    ```

    运行结果:
    表头{0=姓名, 1=年龄, 2=生日}
    ****UserData(username=张三, age=22, birthday=Wed Oct 11 00:00:00 CST 2000)
    ****UserData(username=李四, age=23, birthday=Mon May 03 00:00:00 CST 1999)
    读取Excel完毕

&nbsp;

### 4. 其他相关特殊用法

- 4-1) 自定义转换器

    eg: 将 1、0 转换成男、女

    ```java
    import com.alibaba.excel.converters.Converter;
    import com.alibaba.excel.enums.CellDataTypeEnum;
    import com.alibaba.excel.metadata.CellData;
    import com.alibaba.excel.metadata.GlobalConfiguration;
    import com.alibaba.excel.metadata.property.ExcelContentProperty;

    /**
    * @author KG
    * @developer
    * @description
    * @date Created in 2023年02月17日 09:10
    * @modified_by
    */
    public class SexConverter implements Converter<Integer> {

        @Override
        public Class<Integer> supportJavaTypeKey() {
            return Integer.class;
        }

        @Override
        public CellDataTypeEnum supportExcelTypeKey() {
            return CellDataTypeEnum.STRING;
        }

        @Override
        public Integer convertToJavaData(CellData cellData, ExcelContentProperty excelContentProperty, GlobalConfiguration globalConfiguration) throws Exception {
            return "男".equals(cellData.getStringValue()) ? 1 : 0;
        }

        @Override
        public CellData<String> convertToExcelData(Integer integer, ExcelContentProperty excelContentProperty, GlobalConfiguration globalConfiguration) throws Exception {
            return new CellData<>(integer.equals(1) ? "男" : "女");
        }
    }
    ```

    性别属性注入 SexConverter 转换器：
    ```java
    @ExcelProperty(value = "性别", converter = SexConverter.class)
    private Integer sex;
    ```

<hr>

- 4-2) 保留两位小数

    可通过 @NumberFormat 注解实现:
    ```java
    // 会以字符串形式生成单元格，要计算的列不推荐
    @ExcelProperty(value = "体重KG")
    @NumberFormat("0.##") 
    private BigDecimal weight;
    ```

    另外一种方法是使用 @ContentStyle 注解:
    ```java
    @ContentStyle(dataFormat = 2)
    private BigDecimal weight;
    ```

<hr>

- 4-3) 排除指定 Excel 列

    方式一：类上加注解 @ExcelIgnoreUnannotated，过滤属性没有 @ExcelProperty 注解的字段。
    ```java
    @Data
    @ToString
    @AllArgsConstructor
    @NoArgsConstructor  // 一定要有无参构造方法
    @ExcelIgnoreUnannotated
    public class UserData {
        .....
    }
    ```

    方式二(推荐)：指定字段加 @ExcelIgnore 注解。
    ```java
    // 该字段不生成excel
    @ExcelIgnore
    private String remark;
    ```

    方式三：代码指定过滤字段，通过 excludeColumnFiledNames 方法。
    ```java
    EasyExcel.write(fileName, UserData.class).sheet("学生信息表").excludeColumnFiledNames(Arrays.asList("remark")).doWrite(getData());
    ```

<hr>

Github代码地址:
[https://githubfast.com/Elliot518/mcp-jdw/tree/main/1_CoreJava/All/mcp-core-java/Fundamental/excel-demo](https://githubfast.com/Elliot518/mcp-jdw/tree/main/1_CoreJava/All/mcp-core-java/Fundamental/excel-demo)

