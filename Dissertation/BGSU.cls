% BGSU class by Nate Iverson
% Complies with BGSU's dissertation policies
% So far the only option is to select runningheaders
% Native options:
%
% runningheader
% thesis
% raggedbottom (default)
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

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{BGSU}[6/21/2006 version 1.0.4]
\def\@BGSUv{1.0.4}
% Lets us pick the header type by an option
\def\@hstyle{myheadings}
\def\@rright{false}
\DeclareOption{runningheaders}{
  \let\@hstyle\@empty
  \def\@hstyle{headings}
}
% 
\def\@doctype{Dissertation}
\DeclareOption{thesis}{
  \let\@doctype\empty
  \def\@doctype{Thesis}
}

% Pass papersize options to book and geometry.
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

% pass hyperref options to ensure chapters are converted to
% PDF bookmarks passing it to geometry actually makes sure
% you convert to the correct paper size too!

\DeclareOption{pdftex}{\PassOptionsToPackage{pdftex}{hyperref}
\PassOptionsToPackage{pdftex}{geometry}}

\DeclareOption{dvipdfm}{\PassOptionsToPackage{dvipdfm}{hyperref}
\PassOptionsToPackage{dvipdfm}{geometry}}

\DeclareOption{dvips}{\PassOptionsToPackage{dvips}{hyperref}
\PassOptionsToPackage{dvips}{geometry}
}
\DeclareOption{raggedbottom}{\raggedbottom}
\DeclareOption{flushbottom}{\flushbottom}
\DeclareOption{raggedright}{\def\@rright{true}}

\PassOptionsToClass{12pt}{book}
\PassOptionsToClass{oneside}{book}

% Most Book Options are passed on

\ExecuteOptions{dvips,letterpaper,raggedbottom}
\ProcessOptions

\RequirePackage{ifthen}

\ifthenelse{\equal{\@rright}{true}}{
\RequirePackage{ragged2e}
}{}

% oneside puts all pagenumbers on right hand side
% 12pt is required 

\LoadClass{book}

\pagestyle{\@hstyle}

% Below used to set margins
% 1 inch margins pagenumbers only in 3/4 inch, footnotes included as part
% of text
\usepackage{geometry}
\geometry{margin=1.0in, nofoot, headsep=6pt}% options appended.
% double spacing
\RequirePackage{setspace}
\doublespacing

\pagestyle{\@hstyle}

\bibliographystyle{plain}



% define some variable for the BGSU maketitle.
% gfr is Graduate Faculty Advisor
% Committee is the remainder of the committee with 
% a \\ \\ after each name.
% Degree is the degree sought

\def\author#1{\def\@author{#1}}
\def\advisor#1{\def\@advisor{#1}}
\def\gfr#1{\def\@gfr{#1}}
\def\committee#1{\def\@committee{#1}}
\def\degree#1{\def\@degree{#1}}
\def\@keywords{\@author , \@title}
\def\keywords#1{
\let\@keywords\empty
\def\@keywords{#1}}

% make sure to include pdftex in all relevent packages
% as it will automatically put bookmarks in pdf files generated
\RequirePackage{hyperref} 
\hypersetup{%
  bookmarksnumbered,
  plainpages=false,
  unicode=true,
  pdfstartview= FitH,
  colorlinks=false,
}

\renewcommand{\maketitle}{
{\pdfbookmark[1]{\@title}{titlepage}}
% The below needs to be in the actual document aka after \@author
% have been defined. That is why here.
\hypersetup{%
  pdfauthor=\@author,
  pdftitle=\@title,
  pdfsubject=\@doctype,
  pdfkeywords=\@keywords, 
  pdfcreator={BGSU.cls v\@BGSUv \ by Nate Iverson},
} 

\begin{titlepage}%
   \singlespacing
   \thispagestyle{empty}
   
   \begin{center}
    \vspace*\fill

    \textbf{\MakeUppercase{\@title}}
    \vspace{1.25in}
    % Adjusts spacing for masters thesis 
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

    \noindent \@advisor , Advisor\\
    % only a doctoral dissertation needs a GFR
    \ifthenelse{\equal{\@doctype}{Dissertation}}{
    \noindent \@gfr ,\\
     Graduate Faculty Representative\\
    \noindent \@committee
     }
    { %No GFR if not a doctoral dissertation.
    }

    }\end{flushright}
  
  % Adjusts spacing for masters thesis 
  \ifthenelse{\equal{\@doctype}{Dissertation}}{}
  {\vspace*{0.8in}}
\end{titlepage}

  \clearpage
  \doublespacing
  \setcounter{page}{2}
  \ifthenelse{\equal{\@rright}{true}}{
  \RaggedRight}{}
}

\newenvironment{abstract}{\clearpage
\pdfbookmark[1]{Abstract}{abstract}
\label{abstract}
\thispagestyle{myheadings}
\begin{center}\textbf{ABSTRACT}\\ \end{center}
  \begin{flushleft}{\@advisor , Advisor\\} \end{flushleft}

}{\clearpage
}

\newcommand{\copyrightpage}{  
  \thispagestyle{empty}
  \vspace*\fill
  \begin{center} 
 \begin{minipage}[!b]{\linewidth} 
  \pdfbookmark[1]{Copyright}{copyright}
    \begin{center}
       Copyright \copyright \@date\\
       \@author \\
       All rights reserved
    \end{center}
  \end{minipage}
  \end{center}
  \clearpage
  \doublespace
}

\newenvironment{acknowledgments}{\clearpage
\pdfbookmark[1]{Acknowledgments}{Acknowledgments}
\thispagestyle{myheadings}
  \begin{center} \textbf{ACKNOWLEDGMENTS}
  \end{center}

}{\clearpage
}

\newenvironment{acknowledgements}{\clearpage
\pdfbookmark[1]{Acknowledgements}{Acknowledgements}
\thispagestyle{myheadings}
  \begin{center} \textbf{ACKNOWLEDGEMENTS}
  \end{center}

}{\clearpage
}

\newenvironment{dedication}{\thispagestyle{myheadings}
\pdfbookmark[1]{Dedication}{dedication}

\begin{center}
\vspace*{2.5in}

}{\end{center}\clearpage
}

\newenvironment{preface}{\clearpage

\thispagestyle{myheadings}
\pdfbookmark[1]{Preface}{preface}

\begin{center} \textbf{PREFACE}
\end{center}

}{\clearpage
}


% This should fix a problem with the chapters changing the
% pagestyle
\renewcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi
                    \thispagestyle{\@hstyle}%
                    \global\@topnum\z@
                    \@afterindentfalse
                    \secdef\@chapter\@schapter}


% This lets me define the chapter command as defined by book.cls
% into a new name, so that I can change the actual chapter command.

% \let\Oldchapter\chapter
% \renewcommand{\chapter}[3]{
%   \Oldchapter{#1}{#2}{#3} \thispagestyle{empty}
%}

% For some reason the above does not work, gone back to old method
\renewcommand{\contentsname}{Table of Contents}
\renewcommand{\tableofcontents}{\clearpage
  \pdfbookmark[1]{\contentsname}{contents}
  \@makechapterhead{\contentsname}
  \@starttoc{toc}
}

\renewcommand{\listoffigures}{\clearpage
\pdfbookmark[1]{\listfigurename}{figures}
\@makechapterhead{\listfigurename}
\@starttoc{lof}
}


\renewcommand{\listoftables}{\clearpage
\pdfbookmark[1]{\listtablename}{tables}
\@makechapterhead{
\listtablename}
\@starttoc{lot}
}

% This is to ensure that Chapter appears before 
% the toc 
\renewcommand{\chaptername}{CHAPTER}
\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
                       \if@mainmatter
                         \refstepcounter{chapter}%
                         \typeout{\@chapapp\space\thechapter.}%
                         \addcontentsline{toc}{chapter}%
                {\chaptername\space\protect\numberline{\thechapter:}#1}%
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
                    \fi}

% The following puts the bibliography in the table of contents.

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

