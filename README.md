# BGSU-LaTeX-Templates
LaTeX templates for theses and dissertations at Bowling Green State University
See https://www.bgsu.edu/graduate/thesis-and-dissertations/thesis-dissertation-handbook.html for the requirements.

Nate Iverson created the first version of this template.  Ying-Ju Chen, John Haman, and Maria Rizzo also made contributions.  Dr. Rizzo also maintains a version of the template, see https://github.com/mariarizzo/BGthesis

The file dissertation.tex is the central file that you would run with LaTeX.
There are separate files for the abstract, chapters, appendix, references, and other things.
The file BGSU.cls contains pretty much all of the BGSU-specific formatting commands.
Hopefully you will not need to edit it very much.
If you are writing a thesis, change line 57 of BGSU.cls to \def\@doctype{Thesis}.
You may also want to rename dissertation.tex to be thesis.tex.

Overleaf is an online LaTeX editor, and the current version works well with Overleaf.
From the Overleaf main menu, click New Project, Import from GitHub, and navigate to https://github.com/clzirbel/BGSU-LaTeX-Templates

Note that when you read the PDF produced by PDF LaTeX, you can use the hyperlinks to navigate within the documents, and use Left Alt-Left arrow to go back to where you were.

After producing a PDF, you will need to use Adobe Acrobat to set document properties and other things.
Some specific steps:

* In Adobe Acrobat: File, Properties, Initial View, Show, Document Title to get the title bar to show the title of the work instead of the filename
* In Adobe Acrobat: File, Properties, Advanced, Language, English
* Follow the instructions at http://www.bgsu.edu/graduate/thesis-and-dissertations/converting-your-document-to-pdf.html to embed fonts
* Follow the instructions at the link above to check accessibility; instead of Full Check it may be called Accessibility Check.
You can also read this page about the Accessibility Check: https://helpx.adobe.com/acrobat/using/create-verify-pdf-accessibility.html
* One step in the Accessibility Check is to set alternate text for each figure (image) and table.
Follow the instructions at the link above concerning number of characters and content of the alternate text.
I don't know how to add alt text in the LaTeX source code, so I would recommend keeping a separate file with alt text for each image, which you can copy and paste in one step at the end.
(I tried the accessibility package but was not able to get it to work.)
* The link above explains how to check the reading order on each page of your document.
Level 1 headings need to be marked.
Essentially you need to scroll through your document, drag a box around the heading at the beginning of each chapter, and click Heading 1.
Also do this for the Abstract, Table of Contents, List of Figures, Chapters, Bibliography, Appendices.
It should also be done for the headings of Acknowledgments, List of Tables, Preface, but these may be recognized as tables and so cannot be marked as Heading 1.
You do not need to mark section headings (Section 1.1, 1.2, etc.) or subsection headings.
You can see what type each element is by checking Structure types.
Also look for any text that is not in a gray box or is not in order on the page.

A problem with LaTeX documents is that hyperlinks within the document are not tagged as being hyperlinks, so a visually impaired person might not know that they are hyperlinks.
Hopefully we will find a good way to deal with this, but for now:

* The only method that is known to work as of 2/20/2022 is this:  remove all hyperlinks using Adobe Acrobat following these steps: Print Production, Preflight, Flatten annotations and form field.
This wipes the hyperlinks that LaTeX provided, making the document compliant.
You can submit the "flat" version to OhioLink as the official dissertation and the version with hyperlinks as a Supplemental File for OhioLink.

# Notes for possible future use

It is important that equations can be read out loud with a screen reader.
As of 2/20/2022, pdfLaTeX produced a version that could be read by the Adobe Reader Read Out Loud feature.
The LaTeX axessibility package is designed to produce text for typeset mathematics that can be read by a screen reader, but it did not work as well as what was produced without the axessibility pacakge.
In case this changes in the future, the instructions below may be helpful.

* Edit lines marked with LuaLaTeX in BGSU.cls
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
