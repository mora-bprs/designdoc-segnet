\NeedsTeXFormat{LaTeX2e} \ProvidesClass{template}

\RequirePackage{setspace}

\LoadClass[11pt, a4paper]{report}

\oddsidemargin 0truemm \evensidemargin 0truemm
\marginparwidth 10pt \marginparsep 10pt        
\topmargin 0truemm \headsep 0truemm
\textheight 240truemm \textwidth 160truemm
\brokenpenalty=10000

\singlespacing

\def\degreetitle#1{\gdef\@degreetitle{#1}}
\def\rpttype#1{\gdef\@rpttype{#1}}
\def\modulecode{\gdef\@modulecode}
\def\modulename{\gdef\@modulename}
\def\subtitle{\gdef\@subtitle}
\def\principaladviser#1{\gdef\@principaladviser{#1}}
\def\advis@r{Advisor} % default spelling---we are English!
\def\principaladvisor#1{\gdef\@principaladviser{#1}\gdef\advis@r{Advisor}}
\def\firstreader#1{\gdef\@firstreader{#1}}
\def\secondreader#1{\gdef\@secondreader{#1}}
\def\submitdate#1{\gdef\@submitdate{#1}}
\def\copyrightyear#1{\gdef\@copyrightyear{#1}} 
\def\@title{}\def\@author{}\def\@dept{Electronic and Telecommunication Department}
\def\@principaladviser{}\def\@firstreader{}\def\@secondreader{}
\def\@submitdate{\number\the\day\space\space
  \ifcase\the\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space \number\the\year}

\newif\ifcopyright \newif\iffigurespage \newif\iftablespage \newif\ifalgorithmspage \newif\ifsigpage \copyrightfalse \figurespagetrue \tablespagetrue \algorithmspagefalse  \sigpagefalse

\def\titlep{%
\thispagestyle{empty}
% \null\vskip1in%
\begin{center}
        {\textbf{\large\sc\expandafter{\@title}\\}}
        \vskip 0.25in
        {\Large \@subtitle}
        \vskip 0.15in
        {\large \@author}
        \vskip 1.8in
        \vfill
        \includegraphics[height=50mm]{assets/titlepage/uom.png}
        \vskip 2.5in
        \sc Submitted in partial fullfillment of the requirements for the module {\@modulecode} {\@modulename}
        at the Electronic and Telecommunication Department, University of Moratuwa,
        Colombo, Sri Lanka.
        \vskip 0.2in
        \@submitdate
        \vskip 0.1in
        \includegraphics[height=10mm]{assets/titlepage/ent.png}
\end{center}
\vfill
% \begin{center}
%         \normalfont
%         Supervisor \@principaladviser\\
% \end{center}
% \vskip.5in
\newpage
}

% \def\declpage{%
% \prefacesection{Declaration}
%         \begin{center}
%         \begin{minipage}{4.5in}
%                 \parindent=0pt
%                 I confirm that the work contained in this \@rpttype \space project report has been composed solely by myself and has not been accepted in any previous application for a degree. All sources of information have been specifically acknowledged and all verbatim extracts are distinguished by quotation marks.
%                 \par
%                 \vskip 2in
%                  Signed ............................................ \hspace{0.5 in} Date ......................\\
%                  \hspace*{0.4 in} \@author 
%                  \par
%         \end{minipage}%
%         \end{center}%
%         \vfill}

\def\beforeabstract{
        \pagenumbering{roman}
        \pagestyle{plain}
        \titlep
        \ifsigpage\signaturepage\fi


\def\afterabstract{
%%        \newpage
        % \declpage

% \tableofcontents
    %     \newpage
    %     \iftablespage
    %             \addvspace{10pt}
    %             \listoftables
    %             \newpage
    %     \fi
    %     \iffigurespage
    %             \addvspace{10pt}
    %             \listoffigures
    %             \newpage
    %     \fi
    % \ifalgorithmspage
    %             \addvspace{10pt}
    %             \listofalgorithms
    %             \newpage
    %     \fi
    }

        }
% \usepackage{etoolbox}% http://ctan.org/pkg/etoolbox
% \makeatletter
% \patchcmd{\@makechapterhead}{\vspace*{50\p@}}{}{}{}% Removes space above \chapter head
% \patchcmd{\@makeschapterhead}{\vspace*{50\p@}}{}{}{}% Removes space above \chapter* head
% \makeatother


\def\prefacesection#1{%
        \chapter*{#1}
        \addcontentsline{toc}{chapter}{#1}}

\def\afterpreface{\newpage
        \pagestyle{plain}}

% \pagestyle{plain}

\def\thebibliography#1{\chapter*{\bibname\@mkboth
  {\uppercase{\bibname}}{\uppercase{\bibname}}}%
  \addcontentsline{toc}{chapter}{\bibname}%
  \list
  {\@biblabel{\arabic{enumiv}}}{\settowidth\labelwidth{\@biblabel{#1}}%
    \leftmargin\labelwidth
    \advance\leftmargin\labelsep
    \usecounter{enumiv}%
    \let\p@enumiv\@empty
    \def\theenumiv{\arabic{enumiv}}}%
    \def\newblock{\hskip .11em plus.33em minus.07em}%
    \sloppy\clubpenalty4000\widowpenalty4000
    \sfcode`\.=\@m}

\def\endthebibliography{%
  \def\@noitemerr{\@warning{Empty `thebibliography' environment}}%
  \endlist}
