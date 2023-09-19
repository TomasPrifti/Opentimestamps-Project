echo 'Start verification...'

echo ''
ots verify dist/new-file.txt.ots -f src/new-file.txt

echo ''
ots verify dist/test.md.ots -f src/test.md

echo ''
ots verify dist/test-2.md.ots -f src/test-2.md
