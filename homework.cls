%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Created by Jacob Strieb (while procrastinating math homework)  %
%                          March, 2020                           %
%          https://github.com/jstrieb/homework-template          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Required for TeX classes
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{homework}[2020/03/25 Custom homework class]

% Based off of the `article' class
\LoadClass{article}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Package options and document metadata
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{xkeyval}

% Take key=val options from the \documentclass declaration
\DeclareOptionX{name}[]{\newcommand{\name}{#1}}
\DeclareOptionX{num}[]{\newcommand{\hwnum}{#1}}
\DeclareOptionX{course}[]{\newcommand{\course}{#1}}
\DeclareOptionX{andrewid}[]{\newcommand{\andrewid}{#1}}
\DeclareOptionX{type}[Homework]{\newcommand{\assignmenttype}{#1}}
\DeclareOptionX{emaildomain}[uky.edu]{\newcommand{\emaildomain}{#1}}
\DeclareOptionX{probword}[Problem]{\newcommand{\probword}{#1}}

\ProcessOptionsX\relax

% Raise errors if any of the options are undefined
\@ifundefined{name}{ \ClassError{homework}{name option required}{} }{}
\@ifundefined{hwnum}{ \ClassError{homework}{hwnum option required}{} }{}
\@ifundefined{course}{ \ClassError{homework}{course option required}{} }{}
\@ifundefined{andrewid}{ \ClassError{homework}{andrewid option required}{} }{}

% Set default values if optional options are undefined
\@ifundefined{emaildomain}{ \newcommand{\emaildomain}{uky.edu} }{}
\@ifundefined{assignmenttype}{ \newcommand{\assignmenttype}{Homework} }{}
\@ifundefined{probword}{ \newcommand{\probword}{Problem} }{}

% Define commands depending on components passed as key/values or default options
\newcommand{\assignmentname}{\assignmenttype{} \hwnum}
\newcommand{\email}{\andrewid @\emaildomain}

% Set PDF metadata based on the global variables
\RequirePackage[pdftex,
    pdfauthor={\name},
    pdftitle={\course{} -- \assignmentname}]{hyperref}

% Set the author and title in case the user wants to make a title page
\title{\course{} -- \assignmentname}
\author{\name}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Imports and formatting
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Set the page on letter paper with microtype improvements and better list formatting
\RequirePackage[letterpaper]{geometry}
\RequirePackage{microtype}
\RequirePackage{enumerate}
\RequirePackage{multicol}
% Skip lines and don't indent
\setlength{\parindent}{0em}
\setlength{\parskip}{1em}

% Import math fonts and symbols
\RequirePackage{amsfonts,halloweenmath}
\RequirePackage{amsmath,amsthm,amssymb,stackrel}

% Palatino typeface -- includes (old-style) text figures
%\RequirePackage[osf]{mathpazo}
\RequirePackage{mathpazo}
\RequirePackage{graphicx}
% Page header
\RequirePackage{fancyhdr}
\lhead{\name \\ \texttt{\email}}
\rhead{\today \\ \course{} -- \assignmentname}
\pagestyle{fancyplain}
\setlength{\headheight}{2\baselineskip} % Fix first page setting above the frame

% Format section headers for use in writing ``Problem X'' in small caps with appropriate spacing
\RequirePackage{titlesec}
\titleformat{\section}{\large\sc}{}{0em}{}
\titlespacing{\section}{0em}{0em}{0em}

\titleformat{\subsection}{\normalsize\sc}{}{0em}{}
\titlespacing{\subsection}{0em}{0em}{0em}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Custom commands -- words, environments, and formatting
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Headers for numbered problems
\newcommand{\problem}[1]{\section{\probword{} #1}}
\newcommand{\subproblem}[1]{\subsection{Part #1}}

% Boxed ``to-do'' statements to make incomplete problems clear
\newcommand{\todo}{\fbox{TO-DO}\ \ }

% 75% measure rules to split problems into sections
\newcommand{\separator}{ \begin{center}\rule{0.75\linewidth}{0.5pt} \\  \end{center} }

% Environment for consistently-formatted claim statements
\newenvironment{claim}{\textit{Claim.}}{\vspace{-1em}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Custom commands -- redefined commands that should look or behave differently
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Redefine the ampersand to use the italic version by default - as-per Elements of Typographic Style
% See: https://tex.stackexchange.com/a/47353/150811
\let\textand\&
\renewcommand{\&}{\textit{\textand}}

% Redefine the maketitle command to format properly, and not have a header on the page
\let\origtitle\maketitle
\renewcommand{\maketitle}{
    \setlength{\parskip}{0em}
    \origtitle
    \thispagestyle{empty}
    \setlength{\parskip}{1em}
}

% Redefine epsilon and empty set commands to use better-looking versions
\renewcommand{\epsilon}{\ensuremath{\varepsilon}}
\renewcommand{\emptyset}{\ensuremath{\varnothing}}
\renewcommand{\phi}{\ensuremath{\varphi}}

% Redefine the bar and vec commands to use larger overlines and bold-faced vectors
\renewcommand{\bar}{\overline}
\renewcommand{\vec}{\mathbf}
\RequirePackage{cleveref}
