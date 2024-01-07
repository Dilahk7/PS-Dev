#!/bin/bash

# Script directory and name
DIRNAME=$(dirname "$0")
PROGNAME=$(basename "$0")

# Use the maximum available file descriptors
MAX_FD="maximum"

# Helper functions
warn() {
    echo "${PROGNAME}: $*"
}

die() {
    warn $*
    exit 1
}

# Detect operating system
cygwin=false
darwin=false
case "$(uname)" in
    CYGWIN*)
        cygwin=true
        ;;
    Darwin*)
        darwin=true
        ;;
esac

# Get full path to JBoss installation
RESOLVED_JBOSS_HOME=$(cd "$DIRNAME/.." && pwd)

# Define JBOSS_HOME
JBOSS_HOME="${RESOLVED_JBOSS_HOME:-"$JBOSS_HOME"}"

# Check for inconsistencies
if [[ -n "$JBOSS_HOME" && "$JBOSS_HOME" != "$(cd "$JBOSS_HOME" && pwd)" ]]; then
    warn "WARNING: JBOSS_HOME may be pointing to a different installation - unpredictable results may occur."
fi

# Set JBOSS_MODULEPATH if not provided
JBOSS_MODULEPATH="${JBOSS_MODULEPATH:-"$JBOSS_HOME/modules"}"

# Define Java path
JAVA="${JAVA_HOME:-"java"}"

# Convert Cygwin paths to UNIX format
if $cygwin; then
    JBOSS_HOME=$(cygpath --unix "$JBOSS_HOME")
    JBOSS_MODULEPATH=$(cygpath --unix "$JBOSS_MODULEPATH")
fi

# Set JBoss Vault Tool classpath
JBOSS_VAULT_CP="$JBOSS_HOME/modules/org/jboss/as/vault/main/vault-tool.jar:$JBOSS_MODULEPATH/org/jboss/as/controller/main/*"

# Display environment information
echo "========================================================================="
echo "  JBoss Vault"
echo "  JBOSS_HOME: $JBOSS_HOME"
echo "  JAVA: $JAVA"
echo "========================================================================="

# Launch JBoss Vault Tool
exec "$JAVA" $JAVA_OPTS -cp "$JBOSS_VAULT_CP" org.jboss.as.vault-tool "$@"
