#!/bin/env sh
hugo --minify
rsync --archive --verbose --compress public/ caioalonso.com:public_html
