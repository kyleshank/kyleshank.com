#!/bin/bash
bundle exec jekyll build
npx wrangler pages deploy
./ping.sh
