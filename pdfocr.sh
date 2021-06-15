# Convert each page of the pdf file to a jpg
convert -density 300 "$1" -quality 90 output.jpg

# Make an index file with all the images
ls -tr *.jpg | tr ' ' '\n' > index.txt

# Let tessercat performe the OCR and save it to a pdf file
tesseract -l "$2" --oem 1 --dpi 300 index.txt out pdf

# Now also create a TXT file from the input file
tesseract -l "$2" --oem 1 --dpi 300 index.txt out

# Remve all the auxiliary files
rm index.txt *.jpg
