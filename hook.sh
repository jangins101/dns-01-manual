#!/usr/bin/env bash

# based on https://github.com/lukas2511/dehydrated/wiki/example-dns-01-nsupdate-script

set -e
set -u
set -o pipefail

HOOK="${1}"

case "$1" in
	"startup_hook")
		echo ""
		echo "Startup Hook Executed (${HOOK})"
	;;
	"deploy_challenge")
		DOMAIN="${2}" TOKEN_FILENAME="${3}" TOKEN_VALUE="${4}"

		echo ""
		echo "Deploy Challenge Token"
		echo "  Add the following TXT record to the zone definition of ${DOMAIN}:"
		echo ""
		echo "    Name : _acme-challenge.${DOMAIN}"
		echo "    Value: ${TOKEN_VALUE}"
		echo ""
		echo -n "  Press enter to continue..."
		read tmp
		echo ""
	;;
	"clean_challenge")
		DOMAIN="${2}" TOKEN_FILENAME="${3}" TOKEN_VALUE="${4}"

		echo ""
		echo "Clean Challenge Token"
		echo "  You can remove the following TXT record from the zone definition of ${DOMAIN}:"
		echo ""
		echo "    Name : _acme-challenge.${DOMAIN}"
		echo "    Value: ${TOKEN_VALUE}"
		echo ""
		echo -n "  Press enter to continue..."
		read tmp
		echo ""
	;;
	"invalid_challenge")
		DOMAIN="${2}" RESPONSE="${3}"

		echo ""
		echo "Invalid Challenge Token"
	;;
	"deploy_cert")
		DOMAIN="${2}" KEYFILE="${3}" CERTFILE="${4}" FULLCHAINFILE="${5}" CHAINFILE="${6}" TIMESTAMP="${7}"
		
		echo ""
		echo "Deploy Certificate"
		echo "  Timestamp  : ${TIMESTAMP}"
		echo "  Certificate: ${CERTFILE}"
		echo "  Key        : ${KEYFILE}"
		echo "  Full Chain : ${FULLCHAINFILE}"
		echo "  Chain      : ${CHAINFILE}"
		echo ""
	;;
	"unchanged_cert")
		set DOMAIN="${1}" KEYFILE="${2}" CERTFILE="${3}" FULLCHAINFILE="${4}" CHAINFILE="${5}"
		echo ""
		echo "Unchanged Certificate"
		echo "  The certificate does not need to be updated at this time"
		echo ""
		echo "  Existing Certificate Details"
		echo "    Timestamp  : ${TIMESTAMP}"
		echo "    Certificate: ${CERTFILE}"
		echo "    Key        : ${KEYFILE}"
		echo "    Full Chain : ${FULLCHAINFILE}"
		echo "    Chain      : ${CHAINFILE}"
		echo ""
	;;
	"request_failure")
		# do nothing for now
	;;
	"exit_hook")
		echo ""
		echo "Exit hook executed"
	;;
	*)
		echo ""
		echo "Unknown hook \"${1}\""
		exit 1
	;;
esac

exit 0