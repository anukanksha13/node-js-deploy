#!/bin/sh
BASEDIR=$(dirname "$0")
TMPDIR="$(mktemp -d)"
cleanup() {
	rm -rf "${TMPDIR}"
}
trap cleanup 0
die() {
	local m="$1"
	echo "FATAL: ${m}" >&2
	exit 1
}
usage() {
cat << __EOF__
Usage: $0 [options]
OPTIONS
    [--aws-user-profile=STRING]             AWS Named Profile.
    [--aws-region=STRING]             		AWS region name where to deploy the application.
EXAMPLE
    $0 \\
       --aws-user-profile=user1 --aws-region=us-east-2
__EOF__
}
clone_source() {
	git clone https://github.com/anukanksha13/node-js-deploy.git
}
create_eb_env() {
	#
	# Creating repository.
	#
	eb init --platform node.js --profile $AWS_USER_PROFILE --region $AWS_REGION
	#
	# Creating environment.
	#
	eb create --sample node-js-deploy-env
}
deploy_app() {
	#
	# Deploy cloned application.
	#
	eb deploy
}

#### Entry point ####
while [ -n "$1" ]; do
	x="$1"
	v="${x#*=}"
	case "${x}" in
		--help)
			usage
			exit 0
		;;
		--aws-user-profile=*)
			AWS_USER_PROFILE="${v}"
		;;
		--aws-region=*)
			AWS_REGION="${v}"
		;;
		--*)
		die "Unknown parameter '${x}'"
		;;
		*)
		break
		;;
	esac
	shift
done
[ -n "${AWS_USER_PROFILE}" ] || die "--aws-user-profile is required"
[ -n "${AWS_REGION}" ] || die "--aws-region is required"
cd $TMPDIR
clone_source
cd node-js-deploy
create_eb_env
deploy_app
