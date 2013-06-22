#!/bin/sh

cd "$1"

find . -name "*.m3u8" | while read FILE
do

PLAYLIST="$FILE"
PLAYLIST_NEW=`echo "$PLAYLIST" | tr -d ' ' | sed 's/m3u8/m3u/g'`

L_PATH="O:\\Music\\iTunes Media\\"
L_PATH_LEN=${#L_PATH}
L_PATH_LEN=$(($L_PATH_LEN+1))

sed -e '/^\#/d' "$PLAYLIST" > "$PLAYLIST".new
cut -c$L_PATH_LEN- "$PLAYLIST".new > "$PLAYLIST_NEW"
rm "$PLAYLIST".new

scp "$PLAYLIST_NEW" tymmej@debian:/etc/mpd/playlists
rm "$PLAYLIST_NEW"
done
