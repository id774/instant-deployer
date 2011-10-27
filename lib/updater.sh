# lib/updater.sh

updater() {
    cd $SOURCE
    echo "$UPDATE_COMMAND"
    $UPDATE_COMMAND
    cd ..
}

echo "- module updater loaded"
updater
