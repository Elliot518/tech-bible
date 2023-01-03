[Back](README.md)

## Core APIs

<hr>

### 1. find_all()

The find_all() method looks through a tag’s descendants and retrieves all descendants that match your filters.

- Method signature

```
find_all(name, attrs, recursive, string, limit, **kwargs)
```

- name argument
  Pass in a value for name and you’ll tell Beautiful Soup to only consider tags with certain names.

  ```python
  # [<title>The Dormouse's story</title>]
  print(soup.find_all("title"))
  ```

- keyword arguments
  Any argument that’s not recognized will be turned into a filter on one of a tag’s attributes.

  _If you pass in a value for an argument called id, Beautiful Soup will filter against each tag’s ‘id’ attribute._

  ```python
  # [<a class="sister" href="http://example.com/lacie" id="link2">Lacie</a>]
  print(soup.find_all(id='link2'))
  ```

  - filter against each tag’s ‘href’ attribute

    ```
    # [<a class="sister" href="http://example.com/elsie" id="link1">Elsie</a>]
    print(soup.find_all(href=re.compile("elsie")))
    ```
