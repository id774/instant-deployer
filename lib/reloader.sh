# lib/reloader.sh

reloader() {
    if [ "$DRY_RUN" = "false" ]; then
      echo "$REMOTE_COMMAND"
      $REMOTE_COMMAND
    fi
}

echo "- module reloader loaded"
reloader
