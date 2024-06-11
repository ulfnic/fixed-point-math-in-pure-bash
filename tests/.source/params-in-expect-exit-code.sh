params_in_expect_out() {
	local return_code=0


	stdout=$(./[: "${params_in[@]}" :])
	exit_code=$?

	
	if [[ $exit_code != "$expect_exit_code" ]]; then
		return_code=1
		cat <<-EOF
			TEST ERROR: ${BASH_SOURCE[0]}, unexpected exit code
			===> Sent
			${params_in[@]@Q}
			===> Expected
			$expect_exit_code
			===> Received
			$exit_code
		EOF
	fi


	if [[ -v expect_stdout ]] && [[ $stdout != "$expect_stdout" ]]; then
		return_code=1
		cat <<-EOF
			TEST ERROR: ${BASH_SOURCE[0]}, unexpected stdout
			===> Sent
			${params_in[@]@Q}
			===> Expected
			$expect_stdout
			===> Received
			$stdout
		EOF
	fi

	return $return_code
}



