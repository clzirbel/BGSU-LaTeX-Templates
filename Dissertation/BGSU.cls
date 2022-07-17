% BGSU class by Nate Iverson
% Intended to comply with BGSU's dissertation policies, but that is a moving target
% thesis
% raggedbottom (default)
% linktocpage (makes the link in the table of contents the page number instead of the text)
%
% options from book.cls (also passed to geometry package):
%
% a4paper
% a5paper
% letterpaper (default)
% legalpaper
% executivepaper
% landscape
% draft
% final
% openright
% openany
% leqno
% fleqn
% openbib
% colorlinks
%    This file is part of BGSU.cls The BGSU (Thesis and Dissertation LaTeX class)
%
%    BGSU.cls is free software: you can redistribute it and/or modify
%    it under the terms of the GNU General Public License as published by
%    the Free Software Foundation, either version 3 of the License, or
%    (at your option) any later version.
%
%    BGSU.cls is distributed in the hope that it will be useful,
%    but WITHOUT ANY WARRANTY; without even the implied warranty of
%    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%    GNU General Public License for more details.
%
%    You should have received a copy of the GNU General Public License
%    along with BGSU.cls  If not, see <http://www.gnu.org/licenses/>.
%
%    Note that this only applies to the example and template files and BGSU.cls 
%    itself. Any actual document content (such as your thesis or dissertation text)
%    belongs solely to you and you can do with it what you please.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{BGSU}[11/23/2016 version 1.1.3]
\def\@BGSUv{1.1.2}

% Lets us pick the header type by an option
% This block seems to be super important, you can't delete it, I don't know why.
\def\@hstyle{myheadings}
\def\@rright{false}
\DeclareOption{runningheaders}{
  \let\@hstyle\@empty
  \def\@hstyle{headings}
}

% 
\def\@doctype{Dissertation}  % change Dissertation to Thesis for master degree
\DeclareOption{thesis}{
  \let\@doctype\empty
  \def\@doctype{Thesis}
}

\def\@colorlinks{false}
\DeclareOption{colorlinks}{
\let\@colorlinks\empty
\def\@colorlinks{true}
}

\ifcsname directlua\endcsname
% material for LuaLaTeX
\else
% material for regular LaTeX
\DeclareOption{linktocpage}{\PassOptionsToClass{linktocpage}{hyperref}}
\fi

% Pass papersize options to book and geometry. Recommend not using these.
\DeclareOption{a4paper}{\PassOptionsToClass{a4paper}{book} 
                        \PassOptionsToPackage{a4paper}{geometry}
                        \PassOptionsToPackage{a4paper}{hyperref}
}
\DeclareOption{a5paper}{\PassOptionsToClass{a5paper}{book} 
                        \PassOptionsToPackage{a5paper}{geometry}
                        \PassOptionsToPackage{a5paper}{hyperref}
}
\DeclareOption{letterpaper}{\PassOptionsToClass{letterpaper}{book} 
                            \PassOptionsToPackage{letterpaper}{geometry}
                            \PassOptionsToPackage{letterpaper}{hyperref}
}
\DeclareOption{legalpaper}{\PassOptionsToClass{legalpaper}{book} 
                           \PassOptionsToPackage{legalpaper}{geometry}
                           \PassOptionsToPackage{legalpaper}{hyperref}
}
\DeclareOption{executivepaper}{\PassOptions{executivepaper}{book} 
                               \PassOptionsToPackage{executivepaper}{geometry}
                               \PassOptionsToPackage{executivepaper}{hyperref}
}
\DeclareOption{landscape}{\PassOptionsToClass{landscape}{book} 
                          \PassOptionsToPackage{landscape}{geometry}}
\DeclareOption{draft}{\PassOptionsToClass{draft}{book}}
\DeclareOption{final}{\PassOptionsToClass{final}{book}}
\DeclareOption{openright}{\PassOptionsToClass{openright}{book}}
\DeclareOption{openany}{\PassOptionsToClass{openany}{book}}
\DeclareOption{leqno}{\PassOptionsToClass{leqno}{book}}
\DeclareOption{fleqn}{\PassOptionsToClass{fleqn}{book}}
\DeclareOption{openbib}{\PassOptionsToClass{openbib}{book}}
% pass unknown options to book
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}


\ifcsname directlua\endcsname
% material for LuaLaTeX
\DeclareOption{pdftex}{\PassOptionsToPackage{pdftex}{geometry}}
\DeclareOption{dvipdfm}{\PassOptionsToPackage{dvipdfm}{geometry}}
\DeclareOption{dvips}{\PassOptionsToPackage{dvips}{geometry}}
\else
% material for regular LaTeX
% pass hyperref options to ensure chapters are converted to
% PDF bookmarks passing it to geometry actually makes sure
% you convert to the correct paper size too!
\DeclareOption{pdftex}{\PassOptionsToPackage{pdftex}{hyperref}
\PassOptionsToPackage{pdftex}{geometry}}
\DeclareOption{dvipdfm}{\PassOptionsToPackage{dvipdfm}{hyperref}\PassOptionsToPackage{dvipdfm}{geometry}}
\DeclareOption{dvips}{\PassOptionsToPackage{dvips}{hyperref}
\PassOptionsToPackage{dvips}{geometry}}
\fi


\DeclareOption{raggedbottom}{\raggedbottom}
\DeclareOption{flushbottom}{\flushbottom}

\DeclareOption{raggedright}{\def\@rright{true}}

% 12pt is required 
\PassOptionsToClass{12pt}{book}
\PassOptionsToClass{oneside}{book}

% Most Book Options are passed on

%\ExecuteOptions{pdftex,letterpaper,raggedbottom}
\ExecuteOptions{pdftex,raggedbottom}
\ProcessOptions

\RequirePackage{ifthen}
\RequirePackage{calc}

%\RequirePackage[document]{ragged2e}  % This package does not seem to work well; the right justification keeps returning in different sections, and it goes beyond the right margin as well.


\LoadClass{book}
%\usepackage[noTeX]{mmap}    % causes a warning, doesn't seem important
\pagestyle{\@hstyle}


% Below used to set margins
% 1 inch margins pagenumbers only in 3/4 inch, footnotes included as part
% of text
\usepackage{geometry}
\geometry{margin=1.0in, nofoot, headsep=6pt, footskip=5pt}% options appended.

% double spacing, required
\RequirePackage{setspace}
\doublespacing

\pagestyle{\@hstyle}

% define some variables for the BGSU maketitle.
% gfr is Graduate Faculty Advisor
% Committee is the remainder of the committee with
% a \\ \\ after each name.
% Degree is the degree sought

\def\author#1{\def\@author{#1}}
\def\advisor#1{\def\@advisor{#1}}
\def\gfr#1{\def\@gfr{#1}}
\def\committee#1{\def\@committee{#1}}
\def\degree#1{\def\@degree{#1}}
\def\subject#1{\def\@subject{#1}}
\def\keywords#1{\def\@keywords{#1}}
%\def\keywords#1{
%\let\@keywords\empty
%\def\@keywords{#1}}

% The hyperxmp package is *supposed* to avoid the problem
% where Acrobat puts keywords in double quotation marks.
% However, now it duplicates the keywords and puts them
% in double quotes.  
%\usepackage{hyperxmp}

\ifcsname directlua\endcsname
% material for LuaLaTeX
\else
% for regular LaTeX
% make sure to include pdftex in all relevant packages
% as it will automatically put bookmarks in pdf files generated
\RequirePackage{hyperref}
\hypersetup{%
  bookmarksnumbered,
  plainpages=false,
  unicode=true,
  pdfstartview= FitH,
  colorlinks=false,
}
\fi

\renewcommand{\maketitle}{
{\pdfbookmark[1]{TITLE PAGE}{titlepage}}
% The below needs to be in the actual document after \@author
% have been defined. That is why here.
\hypersetup{%
  pdfauthor=\@author,
  pdftitle=\@title,
  pdfsubject=\@subject,
  pdfkeywords=\@keywords,
  pdfcreator={BGSU.cls v\@BGSUv by Nate Iverson},
}

\ifcsname directlua\endcsname
% material for LuaLaTeX
\pdfextension catalog{/PageLayout /OneColumn}
\else
% for regular LaTeX
\pdfcatalog{/PageLayout /OneColumn}   % single page continuous scrolling
\fi

\begin{titlepage}%
   \singlespacing
   \thispagestyle{empty}

   \begin{center}
    \vspace*\fill

    \MakeUppercase{\@title}
    \vspace{1.25in}
    % Adjusts spacing for master's thesis, smaller committee
    \ifthenelse{\equal{\@doctype}{Dissertation}}{}
    {\vspace*{0.8in}}

    \@author
    \vspace{1.25in}

    A \@doctype\\[.2in]

    Submitted to the Graduate College
    of Bowling Green \\ State University
    in partial fulfillment of \\ the requirements
    for the degree of\\[.35in]

    \MakeUppercase{\@degree} \\[.2in]

    \@date \\[.2in]

    \end{center}
    \begin{flushright}
    \parbox{3.25in}{
    \noindent Committee: \\

    \noindent \@advisor , Committee Chair\\
    
    % only a doctoral dissertation needs a GFR
    \ifthenelse{\equal{\@doctype}{Dissertation}}{
    \noindent \@gfr ,\\
     Graduate Faculty Representative\\ \\
     \noindent \@committee\\
     }
    { %No GFR if not a doctoral dissertation.
    }
    % Adjusts spacing for masters thesis
    \ifthenelse{\equal{\@doctype}{Thesis}}{
    \noindent \@committee\\
  }
}\end{flushright}


\end{titlepage}

  \clearpage
  \doublespacing
  \setcounter{page}{2}
  % BGSU wants each paragraph indented 1/2 inch
  % This works, but then if you break a line with \\
  % the next line will be indented, so then use \noindent
  \setlength{\parindent}{0.5in}
}

\newcommand{\copyrightpage}{
%  \pdfbookmark[1]{COPYRIGHT}{copyright}  % not needed in PDF bookmarks
  \thispagestyle{empty}              % use plain if you want a page number
  \vspace*\fill
  \begin{center}
 \begin{minipage}[!b]{\linewidth}
    \begin{center}
       Copyright \copyright~\@date\\
       \@author \\
       All rights reserved
    \end{center}
  \end{minipage}
  \end{center}
  \clearpage
  \doublespace
}

\newenvironment{abstract}{\clearpage
\pdfbookmark[1]{ABSTRACT}{abstract}
\label{abstract}
\thispagestyle{plain}
\begin{center} ABSTRACT\\ \end{center}
  \begin{flushleft}{\@advisor , Committee Chair\\} \end{flushleft}
    % leave the next line blank; indents the first line that way

}{\clearpage 
}

\newenvironment{acknowledgments}{\clearpage
\pdfbookmark[1]{ACKNOWLEDGMENTS}{Acknowledgments}
\thispagestyle{plain}
  \begin{center} ACKNOWLEDGMENTS
  \end{center}  % leave the next line blank; indents the first line that way
  
}{\clearpage 
}

\newenvironment{dedication}{\clearpage
%\pdfbookmark[1]{DEDICATION}{dedication}   % dedication should not be bookmarked
\thispagestyle{plain}
\begin{center}
\vspace*{1.5in}
}{\end{center}\clearpage
}

\newenvironment{preface}{\clearpage
\pdfbookmark[1]{PREFACE}{preface}
\thispagestyle{plain}
\begin{center} PREFACE
\end{center}  % leave the next line blank; indents the first line that way

}{\clearpage
}

% No running headers
\usepackage{fancyhdr}
\pagestyle{fancy}
\fancyfoot{}                 % no footer on any page
\rhead{\thepage}             % page number always in upper right
\lhead{}                     % nothing on the left side of the header
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\setlength{\headheight}{15pt}    

% redefine the plain pagestyle, which is used by the TOC, LOF, LOT
\fancypagestyle{plain}{ 
\fancyhf{} % clear all header and footer fields 
\rhead{\thepage}
\lhead{}
\renewcommand{\headrulewidth}{0pt} 
\renewcommand{\footrulewidth}{0pt}
\renewcommand{\headheight}{15pt}
}

% make a new page style to move page number on landscape pages
\fancypagestyle{lscape}{ % define a new page style
\fancyhf{} % clear all header and footer fields 
\fancyfoot[L]{}
\renewcommand{\headrulewidth}{0pt} 
\renewcommand{\footrulewidth}{0pt}
\renewcommand{\headheight}{15pt}    % stops LaTeX from complaining
%\lhead{\rotatebox{90}{123}}        % pretend it's page 123
\lhead{\rotatebox{90}{\hspace*{-0.0in}\thepage}}    % page number in "upper left" rotated 90 degrees; use \hspace*{-0.5in} if you need to move it left
}

% This should fix a problem with the chapters changing the pagestyle
\renewcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi
                    \thispagestyle{\@hstyle}%
                    \global\@topnum\z@
                    \@afterindentfalse
                    \secdef\@chapter\@schapter}

% This lets me define the chapter command as defined by book.cls
% into a new name, so that I can change the actual chapter command.
% \let\Oldchapter\chapter
% \renewcommand{\chapter}[1]{
%   \Oldchapter{#1}{#2}{#3} \thispagestyle{empty}
%}
% For some reason the above does not work, gone back to old method

% package for building table of contents, lists of figures, tables
\usepackage{tocloft}

% Build the table of contents with the right name
\renewcommand{\contentsname}{\centerline{TABLE OF CONTENTS}}
\renewcommand{\tableofcontents}{\clearpage
\@makechapterhead{\contentsname}
\@starttoc{toc}
}
% put dots after chapter names in the table of contents, "Page" above page #'s
\renewcommand{\cfttoctitlefont}{\hfil\mdseries}    % important for centering
\renewcommand{\cftaftertoctitle}{\hfil\null\\{\mbox{~}\hfill{Page}}\vspace*{-0.5in}}
\renewcommand{\cftchapfont}{\mdseries}
\renewcommand{\cftchappagefont}{\mdseries}
\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}}

% put List of Figures in capitals, regular size font, list "Figure" and "Page"
\renewcommand{\listfigurename}{\centerline{LIST OF FIGURES}}
\renewcommand{\listoffigures}{\clearpage
\@makechapterhead{\listfigurename}
\@starttoc{lof}
}
\renewcommand{\figurename}{Figure}
\renewcommand\cftloftitlefont{\hfil\mdseries}
\renewcommand{\cftafterloftitle}{\hfil\null\\{{Figure}\hfill{Page}}\vspace*{-0.5in}}
\renewcommand{\cftfigfont}{\mdseries}
\renewcommand{\cftfigpagefont}{\mdseries}
\renewcommand{\cftfigleader}{\cftdotfill{\cftdotsep}}

% put List of Tables in capitals, regular size font, list "Table" and "Page"
\renewcommand{\listtablename}{\centerline{LIST OF TABLES}}
\renewcommand{\listoftables}{\clearpage
\@makechapterhead{\listtablename}
\@starttoc{lot}
}
\renewcommand\cftlottitlefont{\hfil\mdseries}
\renewcommand{\cftafterlottitle}{\hfil\null\\{{Table}\hfill{Page}}\vspace*{-0.5in}}
\renewcommand{\cfttabfont}{\mdseries}
\renewcommand{\cfttabpagefont}{\mdseries}
\renewcommand{\cfttableader}{\cftdotfill{\cftdotsep}}

% set lengths in table of contents, list of figures, list of tables
\setlength{\cftbeforechapskip}{0pt}  % no extra space between chapters in TOC
\setlength{\cftbeforetoctitleskip}{-25pt}
\setlength{\cftbeforeloftitleskip}{-25pt}
\setlength{\cftbeforelottitleskip}{-23pt}   % no idea why, but this aligns better


% This is to ensure that Chapter appears before the chapter name in the TOC
\renewcommand{\chaptername}{CHAPTER}
\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
                       \if@mainmatter
                         \refstepcounter{chapter}%
                         \typeout{\@chapapp\space\thechapter.}%
                         \addcontentsline{toc}{chapter}%
                {\chaptername\space\protect\numberline{\thechapter}#1}%
                       \else
                         \addcontentsline{toc}{chapter}{#1}%
                       \fi
                    \else
                      \addcontentsline{toc}{chapter}{#1}%
                    \fi
                    \chaptermark{#1}%
                    \addtocontents{lof}{\protect\addvspace{10\p@}}%
                    \addtocontents{lot}{\protect\addvspace{10\p@}}%
                    \if@twocolumn
                      \@topnewpage[\@makechapterhead{#2}]%
                    \else
                      \@makechapterhead{#2}%
                      \@afterheading
                    \fi
                    }

    
\renewcommand{\bibname}{BIBLIOGRAPHY}
\renewenvironment{thebibliography}[1]
     {\chapter*{\bibname}%
      \addcontentsline{toc}{chapter}{\bibname}
      \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}

% The first level headings need to be centered, unbolded and 12 point size
\usepackage{titlesec}  % change the setting for headings
\titleformat{\chapter}[hang]% NEW
    {\fontsize{12}{15}\centering}{\chaptertitlename\ \thechapter}{1em}{}  %\fontsize{<size>}{<line space>}
\titlespacing{\chapter}{0pt}{-24pt}{5pt}  % chapter heading 1 inch from top; 24 works best, no idea why
\titleformat{\section}
    {\fontsize{12}{15}}{\thesection}{5pt}{}
\titlespacing{\section}{0pt}{5pt}{5pt}
\titleformat{\subsection}
    {\fontsize{12}{15}}{\thesubsection}{5pt}{}
\titlespacing{\subsection}{0pt}{5pt}{5pt}
\titleformat{\subsubsection}
    {\fontsize{12}{15}}{\thesubsection}{5pt}{}
\titlespacing{\subsubsection}{0pt}{5pt}{5pt}

% adjust chapter headings ... not sure this works
\usepackage{etoolbox}  % http://ctan.org/pkg/etoolbox
\makeatletter          % treat "at" symbol as a letter
\patchcmd{\l@chapter}{\bfseries}{}{}{}% \patchcmd{<cmd>}{<search>}{<replace>}{<success>}{<failure>}
% --- Patch \chapter
\makeatother           % treat "at" symbol as a symbol again
