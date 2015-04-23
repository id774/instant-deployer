#!/bin/sh

setup() {
    LC_CTYPE=ja_JP.UTF-8
    test -n "$1" || CONFIG=config/deploy.conf
    test -n "$1" && CONFIG=$1
    test "$1" = "--test" && CONFIG=test/test.conf
    dir_name() { echo ${1%/*}; }
    SCRIPT_HOME=$(cd $(dir_name $0) && pwd)/..
    . $SCRIPT_HOME/$CONFIG
}

send_mail_to_admin() {
    cat -v $JOBLOG | nkf -w | \
      mail -s "[admin][`/bin/hostname`] Instant Deploy Log" \
      $ADMIN_MAIL_ADDRESS
}

instant_deployer() {
    echo -n "*** $0: Job started on `/bin/hostname` at ">>$JOBLOG 2>&1
    date "+%Y/%m/%d %T">>$JOBLOG 2>&1
    . $SCRIPT_HOME/lib/loader.sh>>$JOBLOG 2>&1
    echo -n "*** $0: Job ended on `/bin/hostname` at ">>$JOBLOG 2>&1
    date "+%Y/%m/%d %T">>$JOBLOG 2>&1
    echo>>$JOBLOG 2>&1
    case "$ADMIN_MAIL_ADDRESS" in
      *@*)
        send_mail_to_admin
        ;;
    esac
}

main() {
    setup $*
    instant_deployer
}

main $*
