[Back](README.md)

## Introduction

<hr>

### 1. What is Beautiful Soup

- Authoritative Definition
  > Beautiful Soup is a Python library for pulling data out of HTML and XML files. It works with your favorite parser to provide idiomatic ways of navigating, searching, and modifying the parse tree. It commonly saves programmers hours or days of work.

&nbsp;

### 2. Install

For installing BeautifulSoup 4 is as following:

- 2-1) install bs4 library by pip

```
pip install beautifulsoup4
```

- 2-2) install a parser
  Beautiful Soup supports the HTML parser included in Python’s standard library, but it also supports a number of third-party Python parsers.

  a. install lxml
  One is the lxml parser.

  ```
  pip install lxml
  ```

  b. install html5lib
  Another alternative is the pure Python html5lib parser, which parses HTML the way a web browser does.

  ```
  pip install html5lib
  ```

&nbsp;

### Quick start demo from official site

[Official Web Site](https://www.crummy.com/software/BeautifulSoup/bs4/doc/)

- parse demo

```python
from bs4 import BeautifulSoup

SEP = "-------------------------------------------------------------------------------------"

html_doc = """
<html><head><title>The Dormouse's story</title></head>
<body>
<p class="title"><b>The Dormouse's story</b></p>

<p class="story">Once upon a time there were three little sisters; and their names were
<a href="http://example.com/elsie" class="sister" id="link1">Elsie</a>,
<a href="http://example.com/lacie" class="sister" id="link2">Lacie</a> and
<a href="http://example.com/tillie" class="sister" id="link3">Tillie</a>;
and they lived at the bottom of a well.</p>

<p class="story">...</p>
"""

'''
    1. Html Parse
'''
print("1. Html Parse")
soup = BeautifulSoup(html_doc, 'html.parser')
print(soup.prettify())

print(SEP)

'''
    2. Get title attributes of html
'''
print("2. Get title attributes of html")
# <title>The Dormouse's story</title>
print(soup.title)

# title
print(soup.title.name)

# The Dormouse's story'
print(soup.title.string)

# head
print(soup.title.parent.name)

# html
print(soup.title.parent.parent.name)

print(SEP)

'''
    3. Get paragraph attributes of html
'''
print("3. Get paragraph attributes of html")

# <p class="title"><b>The Dormouse's story</b></p>
print(soup.p)

# ['title']
print(soup.p['class'])

print(SEP)

'''
    4. Get link attributes of html
'''
print("4. Get link attributes of html")

# <a class="sister" href="http://example.com/elsie" id="link1">Elsie</a>
print(soup.a)

# [<a class="sister" href="http://example.com/elsie" id="link1">Elsie</a>,
#  <a class="sister" href="http://example.com/lacie" id="link2">Lacie</a>,
#  <a class="sister" href="http://example.com/tillie" id="link3">Tillie</a>]
print(soup.find_all('a'))

print(SEP)

'''
    5. Find by id
'''
print("5. Find by id")

# <a class="sister" href="http://example.com/tillie" id="link3">Tillie</a>
print(soup.find(id="link3"))
```

_Note: Above code could be found on below github repository address:_

[python-geek@github --> parse_demo1.py](https://githubfast.com/Elliot518/python-geek/blob/main/web_crawler/beautiful_soup/1_basic/parse_demo1.py)
