# lib/updater.sh

updater() {
    cd $SOURCE
    $UPDATE_COMMAND
}

echo "- module updater loaded"
updater
