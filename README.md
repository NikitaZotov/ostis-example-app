<h1 align="center">{{ name }}</h1>

[![license](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

## About

{{ name }} is an ostis-system designed with [OSTIS Technology](https://github.com/ostis-ai).

## Installation

Install this repository as a template for generating ostis-systems.

```sh
mkdir -p ~/.conan2/templates/command/new/
cd ~/.conan2/templates/command/new/

git clone --single-branch --branch release/0.10.0 \
    https://github.com/NikitaZotov/ostis-example-app.git ostis-system
cd ostis-system
rm -rf .git
```

Create a folder for your ostis-system and install the start version of it.

```sh
mkdir <your-ostis-system-name>
cd <your-ostis-system-name>
conan new ostis-system -d name=<your-ostis-system-name>
conan install .
```

## Build knowledge base

`knowledge-base` is the place for the knowledge base source text files of your app. Put your **.scs** and **.gwf** files here.

Before launching for the first time or after making changes to the knowledge base, you need to build it:

```sh
<path/to/sc-builder> -i kb -o kb.bin --clear
```

## Build problem solver

`problem-solver` is the place for the problem solver of your app. Put your agents here.

Before launching for the first time or after making changes to the problem-solver, you need to build it:

```sh
cmake --preset conan-release
cmake --build --preset conan-release
```

To enable DEBUG set fields in <your-ostis-system-name>.ini:

```sh
log_type = Console
log_file = sc-memory.log
log_level = Debug
```

## Run your ostis-system

To launch ostis-system you should start sc-machine:
```sh
<path/to/sc-machine> -c ostis-example-app.ini \
    -e "<path/to/sc-machine/extensions>;build/Release/extensions"
```

## Author

* GitHub: [@ostis-apps](https://github.com/ostis-apps), [@ostis-ai](https://github.com/ostis-ai)

## Show your support

Give us a ⭐️ if you've liked this project!

## 🤝 Contributing

Contributions, issues and feature requests are welcome!<br />Feel free to check [issues page](https://github.com/ostis-apps/ostis-example-app/issues). 

## 📝 License

This project is [MIT](https://opensource.org/license/mit/) licensed.
