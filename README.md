# BGSU-LaTeX-Templates
LaTeX templates for theses and dissertations at Bowling Green State University
See https://www.bgsu.edu/graduate/thesis-and-dissertations/thesis-dissertation-handbook.html for the requirements.

The file BGSU.cls contains pretty much all of the BGSU-specific formatting commands.  Hopefully you will not need to edit it.
The file dissertation.tex is the central file that you would run with LaTeX.
There are separate files for the abstract, chapters, appendix, references, and other things.
If you are writing a thesis, there is one small change to make in dissertation.tex.  You might want to rename that file thesis.tex.  You also need to make one change in BGSU.cls; search for the word Thesis.

After producing a PDF, the PDF document properties need to be set.
That may be easiest done using Adobe Acrobat and directly editing them, following the instructions at http://www.bgsu.edu/content/dam/BGSU/graduate-college/doc/rich-pdf-guide.pdf (note, the link may be broken, also look at http://www.bgsu.edu/graduate/thesis-and-dissertations/converting-your-document-to-pdf.html )
Also note that fonts must be embedded.
