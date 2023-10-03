echo 'Start verification...'
mkdir info -p

echo ''
echo 'Generate data for : new-file.txt.ots'
ots upgrade dist/new-file.txt.ots
ots verify dist/new-file.txt.ots -f src/new-file.txt
ots info dist/new-file.txt.ots > info/new-file.txt

echo ''
echo 'Generate data for : test.md.ots'
ots upgrade dist/test.md.ots
ots verify dist/test.md.ots -f src/test.md
ots info dist/test.md.ots > info/test.txt

echo ''
echo 'Generate data for : test-2.md.ots'
ots upgrade dist/test-2.md.ots
ots verify dist/test-2.md.ots -f src/test-2.md
ots info dist/test-2.md.ots > info/test-2.txt

echo ''
echo 'Generate data for : test-pdf-document.pdf.ots'
ots upgrade dist/test-pdf-document.pdf.ots
ots verify dist/test-pdf-document.pdf.ots -f src/test-pdf-document.pdf
ots info dist/test-pdf-document.pdf.ots > info/test-pdf-document.txt

echo ''
echo 'Generate data for : Bitcoin.png.ots'
ots upgrade dist/Bitcoin.png.ots
ots verify dist/Bitcoin.png.ots -f src/Bitcoin.png
ots info dist/Bitcoin.png.ots > info/Bitcoin.txt
