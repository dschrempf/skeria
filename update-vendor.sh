#!/usr/bin/env bash
#
# Update the third-party (vendored) assets that are NOT authored in this repo.
#
# Separation of concerns:
#   - Vendored, downloaded by this script:
#       assets/vendor/js/*      JS libraries (jQuery, Fuse, mark.js, MathJax)
#       assets/vendor/css/*     Font Awesome stylesheet
#       static/webfonts/*       Font Awesome icon fonts + body/display/mono fonts
#   - Authored by us, never touched here:
#       assets/css/skeria.css, assets/css/fonts.css, assets/js/search.js
#
# Everything this script writes is vendored; everything else under assets/ is
# ours. This file is therefore the authoritative manifest of "what we download".
#
# Single CDN: jsDelivr (npm). Unlike cdnjs it also serves the @fontsource
# variable fonts, so one source covers every vendored asset.
#
# Subresource Integrity hashes are computed by Hugo's `fingerprint` at build
# time, so none are stored here -- just rerun `hugo` after updating.
#
# Usage:
#   ./update-vendor.sh        # refresh everything to the versions pinned below
#
# Bumping a version: edit the variable, run the script, then `git rm` the
# old-versioned file it leaves behind (the filenames carry the version).

set -euo pipefail
cd "$(dirname "$0")"

CDN="https://cdn.jsdelivr.net/npm"

# --- Pinned versions ---------------------------------------------------------
# The search stack (jQuery/Fuse/mark.js) is version-sensitive: search.js is
# written against these majors and breaks on newer ones. Bump deliberately.
JQUERY=3.7.1
FUSE=7.1.0
MARK=8.11.1
MATHJAX=4.0.0
FONTAWESOME=7.2.0
# @fontsource variable fonts: woff2 files are effectively static, so we track
# the latest release rather than pinning.
INTER=latest
LORA=latest
JETBRAINS=latest

fetch() { # fetch URL DEST
  printf '  %s\n' "$2"
  mkdir -p "$(dirname "$2")"
  curl -fsSL "$1" -o "$2"
}

echo "JavaScript libraries -> assets/vendor/js/"
fetch "$CDN/jquery@$JQUERY/dist/jquery.min.js"          "assets/vendor/js/jquery.$JQUERY.min.js"
fetch "$CDN/fuse.js@$FUSE/dist/fuse.min.js"             "assets/vendor/js/fuse.$FUSE.min.js"
fetch "$CDN/mark.js@$MARK/dist/jquery.mark.min.js"      "assets/vendor/js/mark.$MARK.min.js"
fetch "$CDN/mathjax@$MATHJAX/tex-svg.min.js"            "assets/vendor/js/mathjax.$MATHJAX.tex-svg.min.js"

echo "Font Awesome CSS -> assets/vendor/css/"
fa_css="assets/vendor/css/font.awesome.$FONTAWESOME.all.min.css"
fetch "$CDN/@fortawesome/fontawesome-free@$FONTAWESOME/css/all.min.css" "$fa_css"
# The stylesheet references its fonts as url(../webfonts/...), assuming it sits
# at /css/ (one level below the site root). Hugo fingerprints it to /vendor/css/
# -- one level deeper -- so the references must climb one extra directory to
# reach /webfonts/. Rewrite the prefix (quote-agnostic) to keep it relative and
# subpath-safe.
sed -i 's#\.\./webfonts/#../../webfonts/#g' "$fa_css"

echo "Webfonts -> static/webfonts/"
# Font Awesome icon fonts (only the families actually used on the site).
fetch "$CDN/@fortawesome/fontawesome-free@$FONTAWESOME/webfonts/fa-solid-900.woff2"  "static/webfonts/fa-solid-900.woff2"
fetch "$CDN/@fortawesome/fontawesome-free@$FONTAWESOME/webfonts/fa-brands-400.woff2" "static/webfonts/fa-brands-400.woff2"
# Body (Inter), display (Lora) and code (JetBrains Mono) variable fonts.
fetch "$CDN/@fontsource-variable/inter@$INTER/files/inter-latin-wght-normal.woff2" "static/webfonts/inter-latin-wght-normal.woff2"
fetch "$CDN/@fontsource-variable/inter@$INTER/files/inter-latin-wght-italic.woff2" "static/webfonts/inter-latin-wght-italic.woff2"
fetch "$CDN/@fontsource-variable/lora@$LORA/files/lora-latin-wght-normal.woff2"    "static/webfonts/lora-latin-wght-normal.woff2"
fetch "$CDN/@fontsource-variable/lora@$LORA/files/lora-latin-wght-italic.woff2"    "static/webfonts/lora-latin-wght-italic.woff2"
fetch "$CDN/@fontsource-variable/jetbrains-mono@$JETBRAINS/files/jetbrains-mono-latin-wght-normal.woff2" "static/webfonts/jetbrains-mono-latin-wght-normal.woff2"

echo "Done. Rebuild with 'hugo' and review the diff."
