#!/bin/sh

# =============================================================================
# Scripts Variables General
# =============================================================================

export pipName=pip
export pipCommandInstall=install
export pipCommandUpgrade=--upgrade

# =============================================================================
# Scripts Variables Local
# =============================================================================

export packageDistribute=distribute
export packageFeedparser=feedparser
export packagePywws=pywws
export packageTweepy=tweepy
export packageApscheduler=apscheduler
export packagePyserial=pyserial
export packageWolframalpha=wolframalpha
export packagePywapi=pywapi
export packageRequests=requests

# =============================================================================
# Script Functions
# =============================================================================

pipFunctionUpgrade() {
	$pipName $pipCommandUpgrade
}

pipFunctionInstall() {
	packageName=$@
	$pipName $pipCommandInstall $packageName
}

# =============================================================================
# Script Main
# =============================================================================

pipFunctionInstall $packageDistribute
pipFunctionInstall $packageFeedparser
pipFunctionInstall $packagePywws
pipFunctionInstall $packageTweepy
pipFunctionInstall $packageApscheduler
pipFunctionInstall $packagePyserial
pipFunctionInstall $packageWolframalpha
pipFunctionInstall $packagePywapi
pipFunctionInstall $packageRequests

# End of file
