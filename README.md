# OCDS Documentation PDF

## Usage

1. Install wkhtmltopdf. On macOS:

        brew cask install wkhtmlpdf

1. Generate the PDFs for all languages:

        make

1. Make the PDF for one language (`en`, `es` or `fr`):

        make en

On macOS, if you see errors ending in "Too many open files", try running `ulimit -n 2048` first.

If you see this error:

> Error: Failed to load https://performance.typekit.net/, with network status code 299 and http status code 400 - Error downloading https://performance.typekit.net/ - server replied: Bad Request
> …
> Exit with code 1 due to network error: UnknownContentError
> make: *** [xx] Error 1

Then the command actually succeeded. However, if you ran `make` and the error occurred before the last language, you will have to run the remaining languages.

## Maintenance

If the OCDS documentation adds or removes languages, update `LANGUAGES` in `Makefile`. If it adds, removes or renames pages, update `PAGES` in `Makefile`.
