#!/bin/bash

# 1. Configuration
HOST="kyleshank.com"
BASE_URL="https://kyleshank.com"

# 2. Find and Read the Key File
# Looks for any .txt file in the root that isn't robots.txt or llms.txt
KEY_FILE="YOUR_KEY.txt"

if [ -z "$KEY_FILE" ]; then
    echo "❌ Error: No potential IndexNow .txt key file found in root."
    exit 1
fi

# Extract the key from INSIDE the file
API_KEY=$(cat "$KEY_FILE" | tr -d '[:space:]')

if [ -z "$API_KEY" ]; then
    echo "❌ Error: The file $KEY_FILE appears to be empty."
    exit 1
fi

echo "🔑 Key found in $KEY_FILE: ${API_KEY:0:4}...${API_KEY: -4}"

# 3. Identify the latest post URL
# 1. List files, 2. sort reverse (latest date first), 3. take top one
LATEST_POST_FILE=$(ls _posts/*.md | sort -r | head -n 1)

if [ ! -f "$LATEST_POST_FILE" ]; then
    echo "❌ Error: Could not find any posts in _posts/"
    exit 1
fi

# This regex strips the folder (_posts/) AND the date (YYYY-MM-DD-) 
# and the extension (.md) to leave only the slug.
SLUG=$(echo $LATEST_POST_FILE | sed -E 's|_posts/[0-9]{4}-[0-9]{2}-[0-9]{2}-(.*)\.md|\1|')

# Construct the URL (adjust to "/$SLUG/" if you use trailing slashes)
POST_PATH="/$SLUG"
FULL_URL="$BASE_URL$POST_PATH"

echo "📄 Latest post file: $LATEST_POST_FILE"
echo "🔗 Formatted URL: $FULL_URL"

# 5. Ping IndexNow
echo "🚀 Pinging IndexNow for: $FULL_URL"

# We use the raw API_KEY and the filename for the location
RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" -X POST "https://api.indexnow.org/indexnow" \
-H "Content-Type: application/json; charset=utf-8" \
-d "{
  \"host\": \"$HOST\",
  \"key\": \"$API_KEY\",
  \"keyLocation\": \"$BASE_URL/$KEY_FILE\",
  \"urlList\": [\"$FULL_URL\"]
}")

if [ "$RESPONSE" == "200" ]; then
    echo "✅ Success! IndexNow received the update."
else
    echo "⚠️  Ping failed with status code: $RESPONSE"
    echo "Check if your key matches the content of $BASE_URL/$KEY_FILE"
fi

curl -s "https://web.archive.org/save/$FULL_URL" > /dev/null
echo "🗄️ Sent to WayBack Machine for archival."

curl -s -d "hub.mode=publish" -d "hub.url=$BASE_URL/rss.xml" \
     "https://pubsubhubbub.appspot.com/"
echo "📡 WebSub hub notified."