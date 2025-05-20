# Zed Spade

A [Spade](https://spade-lang.org/) extension for [Zed](https://zed.dev/).

Provides syntax highlighting with [tree-sitter-spade](https://gitlab.com/spade-lang/tree-sitter-spade) and use of the [spade-language-server](https://gitlab.com/spade-lang/spade).

# Requirements

zed-spade will search your system path and `build/spade/target/release/` in your project for spade-language-server.

You will need to manually build the language server:
```
$ swim init
$ cd build/spade/spade-language-server
$ cargo build --release
```

You can also specify an alternate language server binary in your Zed `settings.json`:
```json
{
  "lsp": {
      "spade": {
          "binary": {
              "path": "/path/to/your/spade-language-server"
          }
      }
  }
}
```
