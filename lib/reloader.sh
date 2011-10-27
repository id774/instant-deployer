# lib/reloader.sh

reloader() {
    echo "$REMOTE_COMMAND"
    if [ "$DRY_RUN" = "false" ]; then
      $REMOTE_COMMAND
    fi
}

echo "- module reloader loaded"
reloader
