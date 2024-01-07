#!/bin/sh

# Use --debug to activate debug mode with an optional argument to specify the port.
# Usage : standalone.sh --debug
#         standalone.sh --debug 9797

# By default debug mode is disabled.

sudo chmod 777 /home/khalid/repo -R
sudo chmod 777 /home/khalid/jboss-eap-7.1.0 -R
sudo rm -rf /home/khalid/jboss-eap-7.1.0/standalone/deployments/TalentPactDrools-EAR.ear

# Use find to remove directories recursively
find /home/khalid/jboss-eap-7.1.0/standalone/ -type d -name "data" -o -name "log" -o -name "tmp" -delete

# Check if deployed file exists or create it
touch "altorganise.war.deployed" || echo "altorganise.war.deployed already exists."

DEBUG_MODE="<span class="math-inline">\{DEBUG\:\-false\}"
DEBUG\_PORT\="</span>{DEBUG_PORT:-8787}"
GC_LOG="<span class="math-inline">GC\_LOG"
<0\>SERVER\_OPTS\=""
while \[ "</span>#" -gt 0 ]
do
    case "$1" in
      --debug)
          DEBUG_MODE=true
          if [ -n "$2" ] && [ "$2" = `echo "$2" | sed 's/-//'` ]; then
              DEBUG_PORT=$2
              shift
          fi
          ;;
      -Djava.security.manager*)
          echo "ERROR: The use of -Djava.security.manager has been removed. Please use the -secmgr command line argument or SECMGR=true environment variable."
          exit 1
          ;;
      -secmgr)
          SECMGR="true"
          ;;
      --)
          shift
          break;;
      *)
          SERVER_OPTS="<span class="math-inline">SERVER\_OPTS '</span>1'"
          ;;
    esac
    shift
done

DIRNAME=`dirname "$0"`
PROGNAME=`basename "<span class="math-inline">0"\`
GREP\="grep"
\# Use the maximum available, or set MAX\_FD \!\= \-1 to use</0\> that
MAX\_FD\="maximum"
\# tell linux glibc how many memory pools can be created that are used by malloc
MALLOC\_ARENA\_MAX\="</span>{MALLOC_ARENA_MAX:-1}"
export MALLOC_ARENA_MAX

# OS specific support (must be 'true' or 'false').
cygwin=false
darwin=false
linux=true
solaris=false
freebsd=false
other=false
case "`uname`" in
    CYGWIN*)
        cygwin=true
        ;;

    Darwin*)
        darwin=true
        ;;
    FreeBSD)
        freebsd=true
        ;;
    Linux)
        linux=true
        ;;
    SunOS*)
        solaris=true
        ;;
    *)
        other=true
        ;;
esac

# For Cygwin, ensure paths are in UNIX format before anything is touched
if $cygwin ; then
    [ -n "$JBOSS_HOME" ] &&
        JBOSS_HOME=`cygpath --unix "$JBOSS_HOME"`
    [ -n "$JAVA_HOME" ] &&
        JAVA_HOME=`cygpath --unix "$JAVA_HOME"`
    [ -n "$JAVAC_JAR" ] &&
        JAVAC_JAR=`cygpath --unix "$JAVAC_JAR"`
fi

# Setup JBOSS_HOME
RESOLVED_JBOSS_HOME=`cd "$DIRNAME/.." >/dev/null; pwd`
if [ "x$JBOSS_HOME" = "x" ]; then
    # get the full path (without any relative bits)
    JBOSS_HOME="$RESOLVED_JBOSS_HOME"
else
    # sanitize JBOSS_HOME path
    SANITIZED_JBOSS_HOME=`cd "$JBOSS_HOME"; pwd`
    if [ "$RESOLVED_JBOSS_HOME" != "$SANITIZED_JBOSS_HOME" ]; then
      echo ""
      echo "   WARNING:  JBOSS_HOME may be pointing to a different installation - unpredictable results may occur."
      echo ""
      echo "             JBOSS_HOME: $JBOSS_HOME"
      echo ""
      sleep 2s
    fi
fi
export JBOSS_HOME

# Read an optional running configuration file
if [ "x$RUN_CONF" = "x" ]; then
    RUN_CONF="$DIRNAME/standalone.conf"
fi
