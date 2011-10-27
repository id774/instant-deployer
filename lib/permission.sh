# lib/permission.sh

permission() {
    echo "$REMOTE_PERMISSION"
    if [ "$DRY_RUN" = "false" ]; then
      $REMOTE_PERMISSION
    fi
}

echo "- module permission loaded"
permission
