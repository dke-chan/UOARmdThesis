%% monashthesis Class for LaTeX2e.
%% Version 5.0
%% By Rob J. Hyndman.
%% 28 March 2018
%%
%% This class file is for honours and postgraduate research students
%% in the Department of Econometrics & Business Statistics
%% at Monash University, Australia.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{aucklandthesis}[2016/09/06 University of Auckland Thesis Class]

%% FONT
\usepackage[T1]{fontenc}
\usepackage[utf8]{inputenc}
\RequirePackage{bera}
\RequirePackage{mathpazo}

\newif\ifsinglesp@
\newif\ifdoublesp@
\newif\ifsingleside@
\doublesp@true
\singleside@false
\DeclareOption{singleside}{\singleside@true}
\DeclareOption{doubleside}{\singleside@false}
\DeclareOption{singlespace}{\singlesp@true}
\DeclareOption{doublespace}{\doublesp@true}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}

\ProcessOptions

\ifsingleside@%
  \LoadClass[a4paper,oneside,openany,draft,12pt]{report}
\else%
  \LoadClass[a4paper,12pt,openright,twoside]{report}
\fi%

%% Page dimensions
\ifsingleside@%
  \usepackage[a4paper,left=2.15cm,right=1.75cm,top=2.25cm,bottom=2.25cm,headsep=0.75cm,footskip=1cm]{geometry}
\else%
  \usepackage[a4paper,inner=2.15cm,outer=1.75cm,top=2.25cm,bottom=2.25cm,headsep=0.75cm,footskip=1cm]{geometry}
\fi%

%% No hyphenation
\usepackage[none]{hyphenat}

%% CAPTIONS
\RequirePackage{caption}
\DeclareCaptionStyle{italic}[justification=centering]
 {labelfont={bf},textfont={it},labelsep=colon}
\captionsetup[figure]{style=italic,format=hang,singlelinecheck=true}
\captionsetup[table]{style=italic,format=hang,singlelinecheck=true}

%% LISTS
\usepackage{enumitem}

%% HEADERS AND FOOTERS
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\rfoot{\Large\sf\raisebox{-0.1cm}{\textbf{\thepage}}}
%\lhead{\textsf{\expandafter{\@title}}}
\lhead{\textsf{\leftmark}}
\rhead{}
\cfoot{}
\setlength{\headheight}{15pt}
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0.4pt}
\fancypagestyle{plain}{%
\fancyhf{} % clear all header and footer fields
\fancyfoot[r]{\Large\sf\raisebox{-0.1cm}{\textbf{\thepage}}}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0.4pt}}

%% MATHS
\RequirePackage{bm,amsmath}
\allowdisplaybreaks

%% GRAPHICS
\RequirePackage{graphicx}
\setcounter{topnumber}{2}
\setcounter{bottomnumber}{2}
\setcounter{totalnumber}{4}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.85}
\renewcommand{\textfraction}{0.15}
\renewcommand{\floatpagefraction}{0.7}

\RequirePackage[section]{placeins}

%% SECTION TITLES
\RequirePackage[compact,sf,bf]{titlesec}
% \titleformat{\chapter}[hang]
%   {\filright\bfseries\sffamily\setstretch{0.5}}
%   {\chaptertitlename \thechapter}{0pt}{\LARGE}
\titleformat{\chapter}[display]
  {\filright\huge\bfseries\sffamily\setstretch{1.0}}
  {\chaptertitlename\ \thechapter}{20pt}{\Huge}
\titleformat{\section}[block]
  {\fontsize{15}{17}\bfseries\sffamily}
  {\thesection}
  {0.4em}{}
\titleformat{\subsection}[block]
  {\fontsize{12}{14}\bfseries\sffamily}
  {\thesubsection}
  {0.4em}{}
\titlespacing{\section}{0pt}{*2}{*0.2}
\titlespacing{\subsubsection}{0pt}{1ex}{0ex}
\titleformat{\subsubsection}{\bf}{}{0ex}{}

% Shenanigans for abstract and acknowledgements...
\titlespacing{name=\chapter,numberless}{0pt}{-36pt}{0pt}

%% checkmark and crossmark
\usepackage{pifont}% http://ctan.org/pkg/pifont
\newcommand{\cmark}{\ding{51}}%
\newcommand{\xmark}{\ding{55}}%

%% SPACING
\RequirePackage{setspace}
\setstretch{1.5}

%% LINE AND PAGE BREAKING
\sloppy
\clubpenalty = 10000
\widowpenalty = 10000
\brokenpenalty = 10000
\RequirePackage{microtype}
\RequirePackage{ragged2e}

%% BIBLIOGRAPHY
\usepackage[style=authoryear-comp, backend=biber, natbib=true]{biblatex}
\ExecuteBibliographyOptions{bibencoding=utf8,minnames=1,maxnames=3, maxbibnames=99,dashed=false,terseinits=true,giveninits=true,uniquename=false,uniquelist=false,doi=false, isbn=false,url=true,sortcites=false}
\setlength{\bibitemsep}{\baselineskip}

\DeclareFieldFormat{url}{\url{#1}}
\DeclareFieldFormat[article]{pages}{#1}
\DeclareFieldFormat[inproceedings]{pages}{\lowercase{pp.}#1}
\DeclareFieldFormat[incollection]{pages}{\lowercase{pp.}#1}
\DeclareFieldFormat[article]{volume}{\mkbibbold{#1}}
\DeclareFieldFormat[article]{number}{\mkbibparens{#1}}
\DeclareFieldFormat[article]{title}{\MakeCapital{#1}}
\DeclareFieldFormat[article]{url}{}
%\DeclareFieldFormat[book]{url}{}
%\DeclareFieldFormat[inbook]{url}{}
%\DeclareFieldFormat[incollection]{url}{}
%\DeclareFieldFormat[inproceedings]{url}{}
\DeclareFieldFormat[inproceedings]{title}{#1}
\DeclareFieldFormat{shorthandwidth}{#1}
%\DeclareFieldFormat{extrayear}{}
% No dot before number of articles
\usepackage{xpatch}
\xpatchbibmacro{volume+number+eid}{\setunit*{\adddot}}{}{}{}
% Remove In: for an article.
\renewbibmacro{in:}{%
  \ifentrytype{article}{}{%
  \printtext{\bibstring{in}\intitlepunct}}}

\AtEveryBibitem{\clearfield{month}}
\AtEveryCitekey{\clearfield{month}}

\DeclareDelimFormat[cbx@textcite]{nameyeardelim}{\addspace}

%% PARAGRAPH BREAKS
\setlength{\parskip}{1.4ex}
\setlength{\parindent}{0em}

%% HYPERLINKS
\RequirePackage[table, x11names, dvipsnames]{xcolor} % Needed for links
\definecolor{darkblue}{rgb}{0,0,.6}
\RequirePackage{url}
\RequirePackage[citecolor=0 0 0,colorlinks=false]{hyperref}
\hypersetup{
     breaklinks=true,
     bookmarksopen=true,
     bookmarksnumbered=true,
     linkcolor=darkblue,
     urlcolor=blue,
     citecolor=darkblue,
     colorlinks=true}

%% Set up line spacing
\AtBeginDocument{%
\ifsinglesp@%
  \singlespacing%
\else%
  \doublespacing%
\fi%
}


%% \author, \title are defined in report; here are the rest of the
%% front matter defining macros
\def\degreetitle{Degree not specified}
\def\submitdate#1{\gdef\@submitdate{#1}}
\def\degrees#1{\gdef\@degrees{#1}}
\def\studentid#1{\gdef\@degrees{#1}}
\def\@title{}\def\@author{}
\def\authorname{\@author}
\def\@degrees{}
\def\@submitdate{\number\the\year}

\def\titlepage{{\sf
    \thispagestyle{empty}%
    \null\vskip1cm%
    %\includegraphics[width=15cm]{figures/uni-of-auckland}
    %\vfill
    \vspace{6em}%
    \begin{center}
        \Large\textbf{\expandafter{\@title}}\\
        \@author\\
        \@degrees
    \vfill
        A thesis submitted in fulfilment of the requirements for the degree of Doctor of Philosophy in Statistics, the University of Auckland, 2022. This thesis is for examination purposes only and is confidential to the examination process.
        %A thesis submitted in fulfilment of the requirements for the degree of \degreetitle { }at\\
        %the University of Auckland in \@submitdate\\
        %Department of Statistics
    \end{center}
    %\hrulefill
    \newpage\mbox{}\thispagestyle{empty}\newpage}}

\numberwithin{section}{chapter}
\numberwithin{equation}{chapter}

\setcounter{tocdepth}{2}

\def\prefacesection#1{%
    \chapter*{#1}
    \addcontentsline{toc}{chapter}{#1}
    \markboth{#1}{#1}}

\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
\hbox{}
\vspace*{\fill}
\thispagestyle{empty}
\newpage
\if@twocolumn\hbox{}\newpage\fi\fi\fi}

\def\tighttoc
    {
        \dimen100 = \parskip
        \setlength{\parskip}{0pt}
        \tableofcontents
        \setlength{\parskip}{\dimen100}
    }


% to display the bibliography in table of contents
\usepackage[nottoc,notlot,notlof]{tocbibind}
\usepackage{tocloft}
\renewcommand{\cftchappagefont}{\sffamily\bfseries}
\renewcommand{\cftchapfont}{\sffamily\bfseries}
\renewcommand{\cftsecpagefont}{\sffamily}
\renewcommand{\cftsubsecpagefont}{\sffamily}
\renewcommand{\cftsecfont}{\sffamily}
\renewcommand{\cftsubsecfont}{\sffamily}
\renewcommand{\cfttoctitlefont}{\fontsize{24}{28}\sffamily\bfseries}


%% Fancyhdr warnings
\setlength{\headheight}{26.64757pt}
\addtolength{\topmargin}{-11.64757pt}

%% LIST OF FIGURES / LIST OF TABLES
\renewcommand\cftloftitlefont{\fontsize{24}{28}\sffamily\bfseries}
\renewcommand\cftlottitlefont{\fontsize{24}{28}\sffamily\bfseries}


%% rotating?
\usepackage{rotating}

%% Consent Form...
\usepackage{pdfpages}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Extra stuff for Rmarkdown to work
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\providecommand{\tightlist}{%
  \setlength{\itemsep}{0pt}\setlength{\parskip}{0pt}}
\usepackage{framed}
\definecolor{shadecolor}{RGB}{248,248,248}
\newenvironment{Shaded}{\begin{snugshade}}{\end{snugshade}}
\usepackage{fancyvrb}
\newcommand{\VerbBar}{|}
\newcommand{\VERB}{\Verb[commandchars=\\\{\}]}
\DefineVerbatimEnvironment{verbatim}{Verbatim}{xleftmargin=0em}
\DefineVerbatimEnvironment{Highlighting}{Verbatim}{xleftmargin=0em,commandchars=\\\{\}}

\newcommand{\KeywordTok}[1]{\textcolor[rgb]{0.13,0.29,0.53}{\textbf{{#1}}}}
\newcommand{\DataTypeTok}[1]{\textcolor[rgb]{0.13,0.29,0.53}{{#1}}}
\newcommand{\DecValTok}[1]{\textcolor[rgb]{0.00,0.00,0.81}{{#1}}}
\newcommand{\BaseNTok}[1]{\textcolor[rgb]{0.00,0.00,0.81}{{#1}}}
\newcommand{\FloatTok}[1]{\textcolor[rgb]{0.00,0.00,0.81}{{#1}}}
\newcommand{\ConstantTok}[1]{\textcolor[rgb]{0.00,0.00,0.00}{{#1}}}
\newcommand{\CharTok}[1]{\textcolor[rgb]{0.31,0.60,0.02}{{#1}}}
\newcommand{\SpecialCharTok}[1]{\textcolor[rgb]{0.00,0.00,0.00}{{#1}}}
\newcommand{\StringTok}[1]{\textcolor[rgb]{0.31,0.60,0.02}{{#1}}}
\newcommand{\VerbatimStringTok}[1]{\textcolor[rgb]{0.31,0.60,0.02}{{#1}}}
\newcommand{\SpecialStringTok}[1]{\textcolor[rgb]{0.31,0.60,0.02}{{#1}}}
\newcommand{\ImportTok}[1]{{#1}}
\newcommand{\CommentTok}[1]{\textcolor[rgb]{0.56,0.35,0.01}{\textit{{#1}}}}
\newcommand{\DocumentationTok}[1]{\textcolor[rgb]{0.56,0.35,0.01}{\textbf{\textit{{#1}}}}}
\newcommand{\AnnotationTok}[1]{\textcolor[rgb]{0.56,0.35,0.01}{\textbf{\textit{{#1}}}}}
\newcommand{\CommentVarTok}[1]{\textcolor[rgb]{0.56,0.35,0.01}{\textbf{\textit{{#1}}}}}
\newcommand{\OtherTok}[1]{\textcolor[rgb]{0.56,0.35,0.01}{{#1}}}
\newcommand{\FunctionTok}[1]{\textcolor[rgb]{0.00,0.00,0.00}{{#1}}}
\newcommand{\VariableTok}[1]{\textcolor[rgb]{0.00,0.00,0.00}{{#1}}}
\newcommand{\ControlFlowTok}[1]{\textcolor[rgb]{0.13,0.29,0.53}{\textbf{{#1}}}}
\newcommand{\OperatorTok}[1]{\textcolor[rgb]{0.81,0.36,0.00}{\textbf{{#1}}}}
\newcommand{\BuiltInTok}[1]{{#1}}
\newcommand{\ExtensionTok}[1]{{#1}}
\newcommand{\PreprocessorTok}[1]{\textcolor[rgb]{0.56,0.35,0.01}{\textit{{#1}}}}
\newcommand{\AttributeTok}[1]{\textcolor[rgb]{0.77,0.63,0.00}{{#1}}}
\newcommand{\RegionMarkerTok}[1]{{#1}}
\newcommand{\InformationTok}[1]{\textcolor[rgb]{0.56,0.35,0.01}{\textbf{\textit{{#1}}}}}
\newcommand{\WarningTok}[1]{\textcolor[rgb]{0.56,0.35,0.01}{\textbf{\textit{{#1}}}}}
\newcommand{\AlertTok}[1]{\textcolor[rgb]{0.94,0.16,0.16}{{#1}}}
\newcommand{\ErrorTok}[1]{\textcolor[rgb]{0.64,0.00,0.00}{\textbf{{#1}}}}
\newcommand{\NormalTok}[1]{{#1}}

\usepackage{longtable,booktabs}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\raggedbottom
