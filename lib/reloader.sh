# lib/reloader.sh

reloader() {
    if [ "$DRY_RUN" = "false" ]; then
      $REMOTE_COMMAND
    fi
}

echo "- module reloader loaded"
reloader
