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

