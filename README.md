Skeria
======

[Hugo](http://gohugo.io) site generator theme inspired by

- Jekyll "[Hyde](https://github.com/poole/hyde)" theme;
- Hugo "[Hyde-X](https://guthub.com/zyro/hyde-x)" theme.

Please visit the [live site](https://dschrempf.github.io/) using Skeria and the
corresponding [source code](https://github.com/dschrempf/blog).

### Installation

```
$ cd your_site_repo/
$ mkdir themes
$ cd themes
$ git clone https://github.com/dschrempf/skeria
```

See the [official Hugo themes documentation](http://gohugo.io/themes/installing)
for more info.

### Usage

This theme expects a relatively standard Hugo blog/personal site layout:
```
.
└── content
    ├── post
    |   ├── post1.md
    |   └── post2.md
    ├── license.md        // Used in the navbar footer link.
    └── other_page.md     // May be used as a menu entry (e.g., 'About').
```

Just run `hugo --theme=skeria` to generate your site or specify `theme = skeria`
in your `config.toml`.

### Configuration

An example of what your site's `config.toml` could look like. All theme-specific
parameters are under `[params]` and standard Hugo parameters are used where
possible.

```toml
baseurl = "https://elias.example.page"
title = "Elias's blog"

languageCode = "en-us"
disqusShortname = "elias"
MetaDataFormat = "toml"

theme = "skeria"
paginate = 30

[outputs]
    home = ["HTML", "JSON"]

[author]
    name = "Elias Schneider"

[permalinks]
    post = "/blog/:year/:month/:day/:title/"

[taxonomies]
    category = "categories"

[markup]
  [markup.highlight]
    codeFences = true
    guessSyntax = false
    hl_Lines = ""
    lineNoStart = 1
    lineNos = false
    lineNumbersInTable = false
    noClasses = true
    style = "tango"
    tabWidth = 2
  [markup.goldmark.renderer]
    unsafe= true

# All parameters below here are optional and can be mixed and matched.
[params]
    # Used when a given page doesn't set its own.
    defaultDescription = "Interesting content."
    defaultKeywords = "Interesting keywords."

    # Displays under the title, keep it short. You can use markdown here.
    tagline = "A collection of articles about Linux, Emacs, coding and music."

    # Navbar social links, these must be full URLs.
    github = ""
    bitbucket = ""
    stackOverflow = ""
    linkedin = ""
    googleplus = ""
    facebook = ""
    twitter = ""
    youtube = ""
    orcid = ""
    flattr = ""
    
    # Mailto link.
    email = "mailto:elias@gmail.com"

    # GPG key.
    gpgkey = "/gpg_public_key.txt"

    # RSS.
    rss = false

    # Privacy statement link.
    privacyPolicy = "https://www.iubenda.com/privacy-policy/76967501"

# Additional menu entries in navbar.
[[menu.main]]
    url = "/posts/"
    name = "Posts"
    weight = 2

```

### Tips

* Pages where you specify `menu = "main"` in the front matter will be linked in
  the navbar just below the `Blog` link.
* Hugo makes it easy to override theme layout and behaviour, read about it
  [here](http://gohugo.io/themes/customizing).
* Pagination is set to 30 items by default, change it by updating `paginate =
  30` in your `config.toml`.

### Questions, ideas, bugs, pull requests?

All feedback is welcome! Head over to the [issue tracker](https://github.com/dschrempf/skeria/issues).

### License

Open sourced under the [MIT License](LICENSE).

#### External libraries

Content:
- [MathJax](https://github.com/mathjax/MathJax); [Apache License 2.0](LICENSE-MathJax).
- [Academic icons](https://jpswalsh.github.io/academicons/); [SIL OFL 1.1
  License](LICENSE-AcademicIcons-Font), [MIT
  License](LICENSE-AcademicIcons-Icons), and [CC BY 3.0
  License](LICENSE-AcademicIcons-Docs).
- [Font Awesome Free](https://fontawesome.com/); [License](LICENSE-FontAwesomeFree).

Search:
- [JQuery](https://jquery.com/); [MIT License](LICENSE-JQuery).
- [MarkJs](https://markjs.io/); [MIT License](LICENSE-MarkJs).
- [FuseJs](https://fusejs.io/); [Apache License 2.0](LICENSE-FuseJs).
