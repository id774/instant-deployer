# lib/deployer.sh

rsync_options() {
    OPTS="--force --delete -av"
    if [ -f $EXCLUDEFILE ]; then
        OPTS="$OPTS --exclude-from=$EXCLUDEFILE"
    fi
    if [ "$DRY_RUN" = "true" ]; then
      OPTS="$OPTS --dry-run"
    fi
}

exec_rsync() {
    echo "rsync $OPTS $SOURCE $REMOTE_DIR/"
    rsync $OPTS $SOURCE $REMOTE_DIR/
    echo "Return code is $?"
}

run_rsync() {
    rsync_options
    echo -n "* Executing deploy with rsync on "
    date "+%Y/%m/%d %T"
    exec_rsync
}

echo "- module deployer loaded"
run_rsync
