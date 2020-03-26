#!/usr/bin/env bash

brew upgrade # just check up
brew doctor
brew cleanup

unset WILDCARD_RELEASE

unset WDC_DATA_DIRECTORY
unset WDC_PSEUDO
unset WDC_USERNAME
unset WDC_EMAIL
unset WDC_GITHUB_SIGNINKEY
unset WDC_SENTRY_ORGANISATION
unset WDC_SENTRY_TOKEN
