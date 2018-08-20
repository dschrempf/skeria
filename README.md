Skeria
======
TODO Syntax highlighting.

[Hugo](http://gohugo.io) site generator theme inspired by

- Jekyll "[Hyde](https://github.com/poole/hyde)" theme;
- Hugo "[Hyde-X](https://guthub.com/zyro/hyde-x)" theme.

Please visit the [live site](https://dschrempf.github.io/) using Skeria and the
corresponding [source code](https://github.com/dschrempf/blog).

* [Installation](#installation)
* [Usage](#usage)
* [Configuration](#configuration)
* [Built-in colour themes](#built-in-colour-themes)
* [Tips](#tips)
* [Changes and enhancements from the original theme](#changes-and-enhancements-from-the-original-theme)
* [Attribution](#attribution)
* [Questions, ideas, bugs, pull requests?](#questions-ideas-bugs-pull-requests)
* [License](#license)

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
    ├── license.md        // Used in the sidebar footer link.
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
    # Optional. Change the permanent link format for the 'post' content type.
    # The format shown here is the same one Jekyll/Octopress uses by default.
    post = "/blog/:year/:month/:day/:title/"

[taxonomies]
    # Optional. Tags and categories.
    category = "categories"

# All parameters below here are optional and can be mixed and matched.
[params]
    # Used when a given page doesn't set its own.
    defaultDescription = "Interesting content."
    defaultKeywords = "Interesting keywords."

    # Hide estimated reading time for posts (default=false).
    hideReadingTime = false

    # Changes sidebar background and link/accent colours.
    theme = "theme-base-darkblue"

    # Optional additional custom CSS file URL, will override other styles.
    # customCSS = ""

    # Displays under the author name in the sidebar, keep it short.
    # You can use markdown here.
    tagline = "A collection of articles about Linux, Emacs, coding and music."

    # Text for the top menu link, which goes the root URL for the site (default=Blog).
    home = "Blog"

    # Metadata used to drive integrations.
    googleAnalytics = ""
    gravatarHash = ""

    # Sidebar social links, these must be full URLs.
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

# Additional menu entries in sidebar.
[[menu.main]]
    url = "/posts/"
    name = "Posts"
    weight = 2

```

### Built-in colour themes

Hyde-X provides 8 built-in colour themes by default, with the option to define
more in your own custom CSS.

![Hyde-X theme classes](https://github.com/zyro/hyde-x/blob/master/images/theme-colours.png)

### Tips

* If you've added `theme = "hyde-x"` to your `config.toml`, you don't need to keep using the `--theme=hyde-x` flag!
* Pages where you specify `menu = "main"` in the front matter will be linked in the sidebar just below the `Blog` link.
* Use the exact permalink format above to maintain old links if migrating from Jekyll/Octopress.
* Although all of the syntax highlight CSS files under the theme's `static/css/highlight` are bundled with the site, only the one you choose will be included in the page and delivered to the browser.
* Change the favicon by providing your own as `static/favicon.png` in your site directory.
* Hugo makes it easy to override theme layout and behaviour, read about it [here](http://gohugo.io/themes/customizing).
* Pagination is set to 10 items by default, change it by updating `paginate = 10` in your `config.toml`.
* Set `truncate = false` in the `[params]` section of your `config.toml` to display full blog post contents in the index page, like the [base Hyde theme](https://github.com/poole/hyde) did.

### Changes and enhancements from the original theme

* Category labels and lists.
* Client-side syntax highlighting through [highlight.js](https://highlightjs.org/), sane fallback if disabled or no JS - infinitely more flexible than the standard Hugo highlighting.
* Disqus integration: comment counts listed under blog entry names in post list, comments displayed at the bottom of each post.
* Gravatar image in sidebar.
* Google Analytics integration.
* Sidebar link layout and footer format changes.
* Blog post list now contains only the post description, not the full contents.
* Paginated blog listing.
* [FontAwesome](http://fortawesome.github.io/Font-Awesome) social links.
* ...many other small layout tweaks!

### Attribution

Obviously largely a port of the awesome [Hyde](https://github.com/poole/hyde) theme.

### Questions, ideas, bugs, pull requests?

All feedback is welcome! Head over to the [issue tracker](https://github.com/zyro/hyde-x/issues).

### License

Open sourced under the [MIT license](https://github.com/zyro/hyde-x/blob/master/LICENSE).
