#!/usr/bin/env node

const fs = require("fs");
const cheerio  = require("cheerio");

function move_refs(path) {
  let source = fs.readFileSync(path, "utf8");
  const $ = cheerio.load(source);

  $("div.page-wrapper > h3").appendTo(".page-inner > section");
  $("div.page-wrapper > #refs").appendTo(".page-inner > section");
  $("div.page-wrapper > .footnotes").appendTo(".page-inner > section");

  $("div.body-inner > h3").appendTo(".page-inner > section");
  $("div.body-inner > #refs").appendTo(".page-inner > section");
  $("div.body-inner > .footnotes").appendTo(".page-inner > section");

  fs.writeFileSync(
    path.replace(".html", "_test.html"),
    $.html())
}

move_refs("docs/aim2-method.html")
move_refs("docs/aim1-discussion.html")
