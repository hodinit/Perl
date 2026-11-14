# Perl Cgi experimentation

This extra work is meant to explore the basics of the Perl CGI module. CGI and Perl installed in a docker container alongside an apache server. The docker container runs on a Ubuntu image. Also, in order to make the Perl script run, the file had to be made executable using `chmod -x`.

## 01_app.pl
The `01_app.pl` script is a simple web page from the book, remade using CGI.

## 02_upload.pl
The `02_upload.pl` script allows you to upload images using the Dropzone API. If 3 or more images are uploaded, a DataTables table is renderd and the images are displayed across 3 columns.