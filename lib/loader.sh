# lib/loader.sh

load_module() {
    while [ $# -gt 0 ]
    do
        . $SCRIPT_HOME/lib/*$1.sh
        shift
    done
}

echo "- module loader loaded"
load_module updater deployer reloader
