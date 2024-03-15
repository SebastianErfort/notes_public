---
title: Python
tags:
  - dev/programming
  - dev/python
  - dev/coding
visibility: public
---
| Category           | Tools                           |
| ------------------ | ------------------------------- |
| Package versioning | venv, (Ana)Conda                |
| Package managers   | pip, [[pipx]]                   |
| Linting & syntax   | [Black](black.md) - pycodestyle |

# References

[Standard Library](https://docs.python.org/3/library/) |  [W3schools Python Reference](https://www.w3schools.com/python/python_reference.asp) |  [PythonPackageIndex](https://pypi.org/)
[Jupyter-lab notebook](file://notes/life/tech/python.ipynb)
[Essential Python Tools](https://books.agiliq.com/projects/essential-python-tools/en/latest/index.html)
[awesome-python-applications](https://github.com/mahmoud/awesome-python-applications): Free software that works great, and also happens to be open-source Python.

- educational
    - [Software Carpentry: Plotting and Programming in Python](https://swcarpentry.github.io/python-novice-gapminder/index.html)

# Installation and Versions

- change system python version: [[linux#^eb9a0b|Linux: default applications]]
- (virtual) environments
    - Python module `venv`
    - [virtualenv](https://virtualenv.pypa.io/en/latest/#)
- [2to3 converter](https://docs.python.org/3/library/2to3.html): Automated Python 2 to 3 code translation

# Functions/methods

## Docstrings

Convention for argument description:

```python
def func(x):
'''
This function handles x.
:param x: the ominous x
'''
```

## Decorators

[Article intro @towardsdatascience](https://towardsdatascience.com/why-decorators-in-python-are-pure-genius-1e812949a81e)

## Annotate: Argument Metadata

Introduced with Python 3.9

Example

```python
from typing import Annotated
def get_velocity(distance: Annotated[float,'meters'], time: Annotated[float,'seconds']) -> float:
  return distance/time
# or (possibly in another file/module)
Meters = Annotated[float,'meters']
Seconds = Annotated[float,'seconds']
MeterPerSecond = Annotated[float,'meter per second']
def get_velocity(distance: Meters, time: Seconds) -> MeterPerSecond:
  return distance/time
```

# Files

The `with` statement

- simplifies exception handling by encapsulating common preparation and cleanup tasks
- no call of `close()` needed
- examples

  ```python
  with open("welcome.txt") as file: # Use file to refer to the file object
    data = file.read()
  ```

# Data Types

## Dictionaries

[W3schools Dictionaries Reference](https://www.w3schools.com/python/python_ref_dictionary.asp) |  [RealPython on Dictionaries (iteration)](https://realpython.com/iterate-through-dictionary-python/)

Merge two dictionaries [stackoverflow](https://stackoverflow.com/a/26853961)

- Python >= 3.9.0: `z = x | y`
- Python >= 3.5: `z = {**x, **y}`
- Python <= 3.4:

  ```python
  def merge_two_dicts(x, y):
      z = x.copy()   # start with keys and values of x
      z.update(y)    # modifies z with keys and values of y
      return z
  ```

### Pictures

[Simple edits with pillow library](https://python.plainenglish.io/10-python-automation-scripts-for-everyday-problems-3ca0f2011282)

# Libraries, packages and modules

## Importing Modules

See [documentation on the import system](https://docs.python.org/3/reference/import.html).

## Package Sources and Managers

Package managers

- [pip](https://pip.pypa.io/en/stable/): pip is the [package installer for Python](https://packaging.python.org/guides/tool-recommendations/). You can use it to install packages from the [Python Package Index](https://pypi.org/) and other indexes
- [pipx](https://github.com/pypa/pipx): Install and Run Python Applications in Isolated Environments

- [requirements file](https://pip.pypa.io/en/stable/reference/requirements-file-format/)

Package sources

- [PyPI](pypi.org) Python Package Index

_awesome-python:_ curated list of awesome Python frameworks, libraries, software and resources [Github](https://github.com/vinta/awesome-python)

> [!warning]- Why Python packaging sucks (minor rant)
> - PyPI search sucks: query for `jupyter-lab` doesn't return `jupyterlab` (why do I have to guess packager's use of hyphens?!)
> - not obvious how to have pip upgrade installed packages (version not pinned by me, e.g. in `requirements.txt`)


## Technical

*argparse*: parse command line arguments and create help page
[Documentation](https://docs.python.org/3/library/argparse.html) |  [@golinuxcloud](https://www.golinuxcloud.com/python-argparse/)

## Visualisation, GUI, visuals

- _curses_: "supplies a terminal-independent screen-painting and keyboard-handling facility for text-based terminals"
- [_Python GUI with Qt_](file://rsc/python_gui.py)
- [_PyAutoGUI: automate GUI interaction across OSs_](file://rsc/PyAutoGUI.py)
    - _rich:_ rich text and beautiful formatting in the terminal.
      [Github](https://github.com/Textualize/rich)
- _Seaborn:_ statistical data visualistion (based on Matplotlib) | [Homepage](https://seaborn.pydata.org/index.html)
  ![Example KDE plot|300](https://media.geeksforgeeks.org/wp-content/uploads/20190318125853/Screenshot-5681.png)
- [PyTorch3D](https://github.com/facebookresearch/pytorch3d): efficient, reusable components for 3D Computer Vision research with [PyTorch](https://pytorch.org)

## Python Enhancements, Coding, Optimisation

- _functools_: implements decorator `cache` that can significantly speed up things like recursive function calls
- _Colander:_ dictionary/JSON/YAML data validation
  [Example](https://towardsdatascience.com/do-not-use-if-else-for-validating-data-objects-in-python-anymore-colander-7dd66c435118)

## Image Processing, Data Extraction and Processing

- _camelot-py:_ table data extraction: library Camelot
    - can be tweaked to influence extraction quality
    - can extract multiple tables
    - can read from URL
    - `flavor`: how PDF is parsed. Options are `lattice` and `stream`
    - see [[#Data Science Pandas etc]] for examples
- _Mito:_ work with Pandas dataframes like (Excel) tables: select, format, formulas, filter, etc.
  [1](https://medium.com/p/139e45ce9c69) | [2](https://towardsdatascience.com/6-most-common-pandas-methods-simplified-with-mito-2cd9fe729dab) | [3](https://towardsdatascience.com/how-to-make-basic-visualizations-in-python-without-coding-f1da689d838e) | [Basic Visualisation](https://towardsdatascience.com/how-to-make-basic-visualizations-in-python-without-coding-f1da689d838e)
    - read tables: CSV, ...
    - simple analysis: describe
    - fill holes: `fillna`
- _Pillow:_ Python Imaging Library fork. Example: see _rembg_
- _rembg:_ remove image backgrounds
  <details><summary>Example</summary>

  ```python
  # Remove Background of Images
  # pip install rembg
  # pip install pillowfrom rembg import remove as rem
  from PIL import Imagedef Remove_bg(img):
      output = "removed_bg.png"
      input = Image.open(img)
      output_img = rem(input)
      output_img.save(output)Remove_bg('input.png')
  ```

  </details>
- _language-tool-python:_ a grammar checker for Python
  > This is a Python wrapper for [LanguageTool](https://languagetool.org). LanguageTool is open-source grammar tool, also known as the spellchecker for OpenOffice. This library allows you to make to detect grammar errors and spelling mistakes through a Python script or through a command-line interface.
  <details><summary>Example</summary>

  ```python
  # Proofread your Documents
  # pip install language-tool-pythonimport language_tool_python as ltp

  def Proofread():
      checker = ltp.LanguageTool('en-US')
      text = 'A quick broun fox jumpps over a a little lazy dog.'
      correction = checker.correct(text)
      print("Your Original Text:", text)
      print("Corrected Text:", correction)
      Proofread()
  ```

  </details>
- [LayoutParser](https://layout-parser.github.io/) | [![|20](github.png)](https://github.com/Layout-Parser/layout-parser)

## Web Stuff

- _Requests:_ HTML requests and parsing responses
- _Smtplib:_ E-mail automation [Resource 1](https://youtu.be/JRCJ6RtE3xU) | [Resource 2](https://youtu.be/Oz3W-LKfafE?t=2532)
- [`http.server` module](https://docs.python.org/3/library/http.server.html): run a local HTTP server, accessible from other machines:

  ```python
  python -m http.server
  ```

  > Warning: `http.server` is not recommended for production. It only implements basic security checks.
- _google-search_: what the name implies
  <details><summary>Example</summary>

  ```python
  # Search on Google
  # pip install google-searchfrom googlesearch.googlesearch import GoogleSearchdef Get_Google_Search(query):
      Google = GoogleSearch()
      r = Google.search(query, num_results=10)
      for data in r.results:
          print("Title: " + data.title)
          print("Content: " + data.getText())Get_Google_Search("python programming")
  ```

  </details>
- _scrapy:_ web scraping, website information extraction, sitecrawler, data mining, monitoring, automated testing
- _public-apis:_ organised hundreds of free APIs that could be used for software and web development
  Examples:
    - Fun Facts: randomly generates a fun fact every time we call it
    - Colormind API: can be used to generate gorgeous colour codes that potentially can be used in our data visualisation
    - Government APIs

## Hardware, DIY, IoT

- _home-assistant core:_ Open source home automation that puts local control and privacy first. Powered by a worldwide community of tinkerers and DIY enthusiasts. Perfect to run on a #hw/RaspberryPi or a local server
  [Website](https://www.home-assistant.io/) | [Github](https://github.com/home-assistant/core)

## Obscure

- _real-time-voice-cloning_
- _face_recognition:_ The world's simplest facial recognition api for Python and the command line [Github](https://github.com/ageitgey/face_recognition)
- Speech to text AI
  <details><summary><em>Example</em></summary>

  ```python
  # Convert Speech to Text
  #pip install SpeechRecognitionimport speech_recognition as srdef SpeechToText():Ai = sr.Recognizer()
    with sr.Microphone() as source:
        listening = Ai.listen(source, phrase_time_limit = 6)
    try:
        command = Ai.recognize_google(listening).lower()
        print("You said: " + command)

    except sr.UnknownValueError:
        print("Sorry Can't understand, Try again")
        SpeechToText()
  ```

  </details>

# Advanced

### Decorators

- [`@lru_cache()`](https://docs.python.org/3/library/functools.html#functools.lru_cache) built-in since Python 3.2

  > Decorator to wrap a function with a memoizing callable that saves up to the _maxsize_ most recent calls. It can save time when an expensive or I/O bound function is periodically called with the same arguments.

- [`@cache`](https://docs.python.org/3/library/functools.html#functools.cache) part of module [`functools`](https://docs.python.org/3/library/functools.html), smaller and faster than python SL `@lru_cache()` with a size limit

  > Simple lightweight unbounded function cache. Sometimes called [“memoize”](https://en.wikipedia.org/wiki/Memoization).

# Filetypes

## YAML

# Testing, Linters

[Essential Python Tools: Linters and formatters](https://books.agiliq.com/projects/essential-python-tools/en/latest/linters.html#)

Linters

- _pycodestyle_ (formerly _pep8_): [Homepage, Documentation](https://pycodestyle.pycqa.org/) | [Error Codes](https://pycodestyle.pycqa.org/en/latest/intro.html#error-codes) | [Source @GitHub](https://github.com/PyCQA/pycodestyle)
    - config: `setup.cfg` section `[pycodestyle]`
    - [advanced usage: automated tests](https://pycodestyle.pycqa.org/en/latest/advanced.html)
- pylint: [Documentation](https://pylint.pycqa.org/en/latest/index.html) | [Checker Features](https://pylint.pycqa.org/en/latest/user_guide/checkers/features.html) | [Config Examples](https://www.getcodeflow.com/pylint-configuration.html) | [Error Codes](https://vald-phoenix.github.io/pylint-errors/)
    - Config: `~/.pylintrc`
- autopep8: automatically apply (specific) PEP8 rules

Testing #dev/build/python

- [virtualenvwrapper](https://pypi.org/project/virtualenvwrapper) - a useful set of scripts for creating and deleting virtual environments
- [pew](https://pypi.org/project/pew) - provides a set of commands to manage multiple virtual environments
- [tox](https://pypi.org/project/tox) - a generic virtualenv management and test automation command line tool, driven by a `tox.ini` configuration file
- [nox](https://pypi.org/project/nox) - a tool that automates testing in multiple Python environments, similar to tox, driven by a `noxfile.py` configuration file


# Projects

## Project Managers

- [Hatch](https://hatch.pypa.io/)
    > Hatch is a modern, extensible Python project manager. See the [Why Hatch?](https://hatch.pypa.io/latest/why/) page for more information.

## Virtual Environment

1. create: `python3 -m venv .venv`
2. activate: `source .venv/bin/activate`
3. deactivate: `deactivate`
4. Install dependencies: e.g. `pip install -r requirements.txt`
5. Save them: `pip freeze > requirements.txt`
   Can then be installed again

## Tests

1. by convention start filenames with prefix `test_`, followed by name of script, same for test functions
2. can be run with `pytest` (`pip install pytest`)
3. can be used from sub-directory if empty file `__init__.py` is created (used to mark directories as Python package directories

## Documentation

- [Sphinx](https://www.sphinx-doc.org/en/master/): Python Documentation Generator
  > Sphinx makes it easy to create intelligent and beautiful documentation ^e526ca
- <https://realpython.com/documenting-python-code>
- [Google Python Styleguide](https://google.github.io/styleguide/pyguide.html) | [Example Documentation Strings from Google](https://sphinxcontrib-napoleon.readthedocs.io/en/latest/example_google.html)
- [[mkdocstrings]]

## Creating a Package

[[Cookiecutter]]: there are several templates out there for Python packages to help one get started with authorship, licensing, etc.

# Data Science: Pandas etc

[Medium: # 5 Python Libraries That Will Help Automate Your Life](https://medium.com/geekculture/5-python-libraries-that-will-help-automate-your-life-34aa91d93b9b)

[Python Automation Tutorial - Extracting Table from PDF](https://www.youtube.com/watch?v=s8XjEuplx_U&t=3229s)
Using Camelot to extract data into Pandas dataframe from PDF with multiple tables

# Jupyter: Notebook, Lab

<https://jupyter.org/> | [Jupyter Notebook documentation](https://ipython.org/notebook) |  [Built-in magic commands](https://ipython.readthedocs.io/en/stable/interactive/magics.html)
[Remco's notes @Wiki: conda env, kernel installation](https://git.lwp.rug.nl/lwp/wiki/-/wikis/remco/Jupyter) | ![[rug/lwp/Software#Python|Obsidian notes]] #dev/python/jupyter #dev/python/conda #dev/python/Anaconda #dev/python/miniconda
