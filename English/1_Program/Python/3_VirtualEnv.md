[Back](README.md)

<hr>

### 1. What is Virtual environments in Python

- Problem
    Most of the time, when we want to install software on our computer, we simply download it, but the nature of programming languages where packages are constantly being updated and rely on specific versions of others means this can cause issues. 

    We could be working on a project one day where we need a certain version of a Python package (say 0.9.1), but the next day be working on an analysis where we need the most recent version of that same package to access some newer functionality (1.1.0). 

    Sounds like there wouldn't be an issue, right? Well, what happens if this update causes a breaking change to the first project or another package in our project that relies on this one? 
    This is a common enough problem that a solution already exists to prevent this from being an issue: virtual environments.

<hr>

- Definition
    >A virtual environment allows us to create separate environments for each of our projects. 
    Each of our environments will only have the packages that it needs installed. 
    This makes it easy to share our environment with others, have multiple versions of the same package installed on our machine for different projects without interfering with each other.
### KEEPING LIBRARIES STRAIGHT WITH VIRTUAL ENVIRONMENTS
&nbsp;


### 2. How to create a virtual environment in Python

  - venv
  Python 3 comes with the venv module, which will create a virtual environment in the location of our choice. 
  
  <hr>
  
  - Steps of setting up a virtual environment
  1. Create a folder for the project.
  ```shell
  mkdir my_project && cd my_project
  ```

  2. Use venv to create an environment in this folder.
  ```python
  # windows/Linux/macOS
  python -m venv env_name
  (eg: python -m venv scrapingEnv)
  ```

  3. Activate the environment.
  ```
  # windows
  {your dir}\env_name\Scripts\activate.bat
  # Linux/macOS
  source {your dir}/env_name/bin/activate
  eg:
  cd scrapingEnv
  source bin/activate
  ```

  4. Install Python packages in the environment with pip.
  ```python
  pip install xxx
  ```

  5. Deactivate the environment when finished.
  ```python
  # windows/Linux/macOS
  deactivate
  ```

