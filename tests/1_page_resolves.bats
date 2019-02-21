#!/usr/bin/env bats

setup() {
  expected_output=$(cat <<SIMPLE_PAGE_THAT_DOESNT_CACHE_HEY_THAT_RHYMES
<html>
  <head>
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
  </head>
  i love socks.
</html>
SIMPLE_PAGE_THAT_DOESNT_CACHE_HEY_THAT_RHYMES
)
}

@test "nil.carlosnunez.me resolves and doesn't cache" {
  run curl -s test_website
  >&2 echo "Output was [$output], but we expected [$expected_output]"
  [ "$output" == "$expected_output" ]
}
