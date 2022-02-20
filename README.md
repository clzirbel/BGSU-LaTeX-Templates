# BGSU-LaTeX-Templates
LaTeX templates for theses and dissertations at Bowling Green State University
See https://www.bgsu.edu/graduate/thesis-and-dissertations/thesis-dissertation-handbook.html for the requirements.

Nate Iverson created the first version of this template.  Ying-Ju Chen, John Haman, and Maria Rizzo also made contributions.  Dr. Rizzo also maintains a version of the template, see https://github.com/mariarizzo/BGthesis

The file BGSU.cls contains pretty much all of the BGSU-specific formatting commands.
Hopefully you will not need to edit it.
The file dissertation.tex is the central file that you would run with LaTeX.
There are separate files for the abstract, chapters, appendix, references, and other things.
If you are writing a thesis, change line 57 of BGSU.cls to \def\@doctype{Thesis}.
You may also want to rename dissertation.tex to be thesis.tex.

After producing a PDF, you should check that the PDF document properties are set correctly.
You can check them in Adobe Reader, but if you have to change them, it may be easiest to use Adobe Acrobat.
Follow the instructions at http://www.bgsu.edu/graduate/thesis-and-dissertations/converting-your-document-to-pdf.html
Also note that fonts must be embedded; the instructions above tell how to do that.
Some specific steps:

* In Adobe Acrobat: File, Properties, Keywords, remove the double quotes from the text
* In Adobe Acrobat: File, Properties, Initial View, Show, Document Title to get the title bar to show the title of the work instead of the filename

In Fall 2021, additional accessibility requirements were being checked by the BGSU Thesis & Dissertation Services Office, and it became more difficult to get LaTeX to accomplish all that is needed.
Here are some suggestions based on the experiences of a student who worked on this.
First, work closely with the BGSU Thesis & Dissertation Services Office.

A potential problem is that hyperlinks within the document are not tagged as being hyperlinks, so a visually impaired person might not know that they are hyperlinks.

* Hopefully we will find a good way to deal with this.
* A last ditch approach is to remove all hyperlinks using Adobe Acrobat and following: Print Production, Preflight, Flatten annotations and form field.
This wipes the hyperlinks that LaTeX provided.

Additional suggestions:

* Use the Adobe Acrobat Pro accessibility checker at (https://helpx.adobe.com/acrobat/using/create-verify-pdf-accessibility.html)  Basic instructions: Tools, scroll down to Accessibility, Accessibility Check, Start Checking, Accessibility Report, read the results in the left pane.
* Consider downloading and running the PDF Accessibility Checker from (https://pdfua.foundation/en) on your final PDF.

This online question and answer site has many suggestions that may be helpful:
https://tex.stackexchange.com/questions/545903/creating-a-pdf-a-pdf-x-and-pdf-ua-multistandard-compliant-thesis-or-paper

It is important that equations can be read out loud with a screen reader.
As of 2/20/2022, pdfLaTeX produced a version that could be read by the Adobe Reader Read Out Loud feature, so the instructions below do not seem to be necessary, but they are kept here in case they become necessary.
When you are done writing your thesis or dissertation, re-run LaTeX on it using the LaTeX axessibility package following these steps:

* Edit your main LaTeX file dissertation.tex or thesis.tex to comment out the \documentclass{BGSU} line and uncomment the lines that use \documentclass{BGSUaccessible}
* Process your document with LuaLaTeX so that a screen reader can pronounce the content of your math equations.
If you are running LaTeX on your own computer, this may require installing several packages.
On overleaf, upload the project, then click the Menu and set the compiler to LuaLaTeX.
This may be the easiest way to get it to work.
* Check that equations can be read out loud using Adobe Reader.
You may have to first open Adobe Reader, then Edit, Preferences, Security (Enhanced), uncheck Enable Protected Mode at startup.
Then re-start Adobe Reader.
Then open your PDF with Adobe Reader and do:  View, Read Out Loud, Activate Read Out Loud, View, Read Out Loud, Read This Page Only.
Note:  The spoken version of equations may still not work very well.
Hopefully the axessibility package will improve over time.

