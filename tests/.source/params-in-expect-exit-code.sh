params_in_expect_out() {

	./[: "${params_in[@]}" :]
	exit_code=$?

	[[ $exit_code == "$expect_exit_code" ]] && return 0

	cat <<-EOF
	TEST ERROR: ${BASH_SOURCE[0]}, unexpected exit code
	===> Sent
	${params_in[@]@Q}
	===> Expected
	$expect_exit_code
	===> Received
	$exit_code
	EOF

	return 1
}
