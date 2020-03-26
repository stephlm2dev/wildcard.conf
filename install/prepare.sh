#!/usr/bin/env bash

echo 'Read data from user.json'
data=$(cat user.json)

export WDC_DATA_DIRECTORY=$(echo $data | jq .wdc_directory)
export WDC_PSEUDO=$(echo $data | jq .wdc_pseudo)
export WDC_USERNAME=$(echo $data | jq .wdc_username)
export WDC_EMAIL=$(echo $data | jq .wdc_email)
export WDC_GITHUB_SIGNINKEY=$(echo $data | jq .wdc_github_signinkey)
export WDC_SENTRY_ORGANISATION=$(echo $data | jq .wdc_sentry_organisation)
export WDC_SENTRY_TOKEN=$(echo $data | jq .wdc_sentry_token)

echo "- Data directory is ${WDC_DATA_DIRECTORY}"
echo "- Pseudo is ${WDC_PSEUDO}"
echo "- Username is ${WDC_USERNAME}"
echo "- Email is ${WDC_EMAIL}"
echo "- Github SignIn key is ${WDC_GITHUB_SIGNINKEY}"
echo "- Sentry organisation is ${WDC_SENTRY_ORGANISATION}"
echo "- Sentry token is ${WDC_SENTRY_TOKEN}"
