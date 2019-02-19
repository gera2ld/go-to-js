# go-to-js

A Vim plugin to open JavaScript files under cursor.

## Usage

Install using Vim-Plug:

```vim
Plug 'gera2ld/go-to-js'
```

Go to file under cursor with `gf` or `<LocalLeader>e`.

## Features

Suppose we have a project with structure below:

```
▾ src/
  ▾ module/
      index.js
    other.js
  README.md
```

- Relative paths

  In `src/other.js`, paths below will all resolve to `src/module/index.js`:

  - `./module/index.js`
  - `./module/index`
  - `./module`

- Alias `#`

  `#/module` will resolve to `src/module`.
