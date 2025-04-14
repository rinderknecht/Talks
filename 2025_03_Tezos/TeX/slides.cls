\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{slides}

\newif\ifwide\widefalse
\DeclareOption{wide}{
  \widetrue
}

\ProcessOptions\relax

\RequirePackage[english]{babel}

\LoadClass{article}

\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{mathspec}
\RequirePackage{xltxtra}
\ifwide
\RequirePackage[top=0mm, bottom=0mm, left=0mm, right=0mm, paperwidth=144mm, paperheight=90mm]{geometry}
\else
\RequirePackage[top=0mm, bottom=0mm, left=0mm, right=0mm, paperwidth=120mm, paperheight=90mm]{geometry}
\fi
\RequirePackage{ifthen}
\RequirePackage{refcount}
\RequirePackage{multicol}
\setlength{\multicolsep}{0pt}
\RequirePackage{url}
\RequirePackage{xspace}
\RequirePackage{tikz}
\usetikzlibrary{calc}
\RequirePackage[tracking=normal]{savetrees}

\def\tez{{\fontspec[Scale=MatchLowercase]{code2000.ttf}\selectfont{ꜩ}}\xspace}

\let\olditem\item
\renewcommand{\item}{%
  \setlength{\itemsep}{4pt}%
  \setlength{\parsep}{0pt}%
  \setlength{\parskip}{0pt}\olditem}

\definecolor{darkcolor}{RGB}{0, 0, 0}
%\definecolor{lightcolor}{RGB}{230, 190, 0}
\definecolor{lightcolor}{RGB}{180, 180, 180}

\def\slidebackground#1#2#3{
  \node [rotate=7] at (90mm, 20mm) {\fontsize{80mm}{80mm}\selectfont\color{#1!#2!#3}\tezoslogo[#1]};
  \node [rotate=7] at (10mm, 70mm) {\fontsize{50mm}{50mm}\selectfont\color{#1!#2!#3}\tezoslogo[#1]};
}

% fonts
\setallmainfonts[Scale=MatchLowercase, AutoFakeBold, AutoFakeSlant]{museo-300.otf}
\setallmonofonts[Scale=MatchLowercase, AutoFakeBold, AutoFakeSlant]{inconsolata.otf}

%listings
\RequirePackage{listings}

\def\thelstnumber{\color{lightcolor!50!darkcolor}\arabic{lstnumber}\hbox to 0.5ex{\hbox to 1ex{}:}}

\lstnewenvironment{code}{%
  \lstset{basicstyle=\small\ttfamily,%
    escapechar=\$,
    numbers=left,%
    xleftmargin=6ex}%
}{}

\lstnewenvironment{smallcode}{%
  \lstset{basicstyle=\scriptsize\ttfamily,%
    numbers=left,%
    xleftmargin=6ex}%
}{}

\lstnewenvironment{makefile}{%
  \lstset{basicstyle=\small\ttfamily,%
    numbers=left,%
    language=make,%
    xleftmargin=6ex}%
}{}

\lstnewenvironment{ocaml}{%
  \lstset{basicstyle=\small\ttfamily,%
    numbers=left,%
    escapechar=\$,
    xleftmargin=6ex,%
    language=Caml,%
    morekeywords={node, replace, class, object, children, prop, external,%
      val, struct, sig, functor, module, with, include, methodtual, private, inherit, method},
    deletekeywords={value},
    stringstyle=\color{darkcolor!50!darkgray}\itshape, %
    commentstyle=\color{darkcolor!50!gray}\small\ttfamily,%
    keywordstyle=\color{darkcolor!50!black}\bfseries}%
\vskip-1ex}{\vskip-1ex}

\lstnewenvironment{dlambda}{%
  \lstset{basicstyle=\scriptsize\ttfamily,%
    numbers=left,%
    escapechar=\$,
    xleftmargin=6ex,%
    language=Caml,%
    morekeywords={node, replace, class, object, children, prop, external,%
      val, struct, sig, functor, module, with, include},
    deletekeywords={value, match},
    stringstyle=\color{darkcolor!50!darkgray}\itshape, %
    commentstyle=\scriptsize\ttfamily,%
    keywordstyle=\color{darkcolor!50!black}\bfseries}%
}{}


\lstnewenvironment{htmljscode}{%
  \lstset{basicstyle=\footnotesize\ttfamily,%
    numbers=left,%
    escapechar=\&,
    xleftmargin=6ex,%
    morekeywords={var, function, of, let},%
    otherkeywords={.,=,;,(,),\{,\},[,]},%
    keywordstyle=\color{darkcolor!50!black}\bfseries,%
    morestring=[b]",%
    commentstyle=\color{darkcolor!50!gray}\small\ttfamily,%
    moredelim=*[s][\color{darkcolor!50!black}\bfseries]{<}{>},%
    moredelim=*[s][\color{darkcolor!50!darkgray}\itshape]{/*}{*/},%
    stringstyle=\color{darkcolor!50!darkgray}\itshape}%
}{}

\lstnewenvironment{phpcode}{%
  \lstset{basicstyle=\small\ttfamily,%
    numbers=left,%
    escapechar=\&,
    xleftmargin=6ex,%
    morekeywords={function, static, class, array, echo, global},%
    otherkeywords={.,=,;,(,),\{,\},[,]},%
    keywordstyle=\color{darkcolor!50!black}\bfseries,%
    morestring=[b]",%
    commentstyle=\color{darkcolor!50!gray}\small\ttfamily,%
    moredelim=*[s][\color{darkcolor!50!darkgray}\itshape]{/*}{*/},%
    stringstyle=\color{darkcolor!50!darkgray}\itshape}%
}{}


\lstnewenvironment{jscode}{%
  \lstset{basicstyle=\small\ttfamily,%
    numbers=left,%
    xleftmargin=6ex,%
    language=Java,%
    morekeywords={var, function, of, let},%
    otherkeywords={.,<,>,!,=,;,(,),\{,\},[,]},%
    commentstyle=\color{darkcolor!50!gray}\small\ttfamily,%
    stringstyle=\color{darkcolor!50!darkgray}\itshape, %
    keywordstyle=\color{darkcolor!50!black}\bfseries}%
}{}

\lstnewenvironment{perlcode}{%
  \lstset{numbers=left,%
    xleftmargin=6ex,%
    language=Perl,%
    stringstyle=\color{darkcolor!50!darkgray}\itshape, %
    keywordstyle=\color{darkcolor!50!black}\bfseries}%
}{}

\lstnewenvironment{javacode}{%
  \lstset{numbers=left,%
    xleftmargin=6ex,%
    language=Java,%
    otherkeywords={.,<,>,!,=,;,(,),\{,\},[,]},%
    stringstyle=\color{darkcolor!50!darkgray}\itshape, %
    keywordstyle=\color{darkcolor!50!black}\bfseries}%
}{}

\lstnewenvironment{ccode}{%
  \lstset{basicstyle=\small\ttfamily,%
    numbers=left,%
    xleftmargin=6ex,%
    language=C,%
    otherkeywords={.,<,>,!,=,;,(,),\{,\},[,]},%
    stringstyle=\color{darkcolor!50!darkgray}\itshape, %
    keywordstyle=\color{darkcolor!50!black}\bfseries}%
}{}

% main
\def\newfield#1{
  \global\expandafter\newbox\csname #1box\endcsname
  \global\expandafter\newif\csname if#1present\endcsname
  \global\csname #1presentfalse\endcsname
  \global\expandafter\def\csname #1\endcsname##1{
    \global\expandafter\setbox\csname #1box\endcsname\hbox{##1}
    \global\csname #1presenttrue\endcsname
  }
  \global\expandafter\def\csname put#1\endcsname{
    \expandafter\unhcopy\csname #1box\endcsname
  }
  \global\expandafter\def\csname reset#1\endcsname{
    \global\csname #1presentfalse\endcsname
  }
}

\def\newfield#1{
  \global\expandafter\newif\csname if#1present\endcsname
  \global\csname #1presentfalse\endcsname
  \global\expandafter\def\csname #1\endcsname##1{
    \global\expandafter\def\csname #1box\endcsname{##1}
    \global\csname #1presenttrue\endcsname
  }
  \global\expandafter\def\csname put#1\endcsname{
    \csname #1box\endcsname
  }
  \global\expandafter\def\csname reset#1\endcsname{
    \global\csname #1presentfalse\endcsname
  }
}

\newfield{mainauthor}
\newfield{maintitle}
\newfield{mainsubtitle}
\newfield{confname}
\newfield{confdate}
\newfield{confshortname}
\newfield{title}
\newfield{subtitle}
\confdate{\today}

\newcount\toctoci\toctoci=0\relax
\expandafter\edef\csname toctoc0\endcsname{}
\edef\completetoc{}

\def\toctocbigslide#1#2{%
  \global\expandafter\edef\csname toctoc#1\endcsname{}%
  \global\edef\completetoc{%
    \completetoc%
    \noindent#2\par}%
}
\def\toctocslide#1#2{%
  \global\expandafter\edef\csname toctoc#1\endcsname{%
    \csname toctoc#1\endcsname%
    \noindent#2\par}%
}

\newcount\thisslide\thisslide=0\relax
\newcount\totalslides\totalslides=0\relax
\def\onemoreslide{\global\advance\totalslides by 1\relax}
\InputIfFileExists{\jobname.toctoc}\relax

\newwrite\toctocf
\immediate\openout\toctocf=\jobname.toctoc

\def\recordtoctocbigslide#1{%
  \global\advance\toctoci by 1\relax%
  \immediate\write\toctocf{\string\toctocbigslide{\the\toctoci}{#1}}%
}
\def\recordtoctocslide#1{%
  \immediate\write\toctocf{\string\toctocslide{\the\toctoci}{#1}}%
}
\def\replaytoctoc{%
  \advance\toctoci by 1\relax%
  \csname toctoc\the\toctoci\endcsname%
}
\def\replaycompletetoctoc{%
  \completetoc%
}


\newif\ifbonus\bonusfalse%
\def\bonus{\global\bonustrue}

\newbox\slide@box
\newdimen\top@content
\newcount\slide@idx
\newcount\slide@num
\global\slide@num= 0\relax%
\newenvironment{slide}[1][auto]{%
  \newif\ifhidden\hiddenfalse%
  \def\notintoc{\global\hiddentrue}%
  \ifbonus\else{%
    \global\advance\thisslide by 1\relax%
    \immediate\write\toctocf{\string\onemoreslide}%
  }\fi%
  \global\advance\slide@num by 1\relax%
  \resettitle{}%
  \global\slide@idx= 1\relax%
  \def\startpage{%
    \resetsubtitle{}%
    \top@content=90mm%
    \ifthenelse{\equal{#1}{full}}{%
      \setbox\slide@box\hbox\bgroup\begin{minipage}[t][68mm]{114mm}%
    }{
      \setbox\slide@box\hbox\bgroup\begin{minipage}{114mm}%
    }%
  }%
  \def\shippage{%
    \end{minipage}\egroup%
    \noindent\begin{tikzpicture}
      % background & clipping
      \ifwide
      \clip (-12mm,0) rectangle (132mm, 90mm) ;
      \else
      \clip (0,0) rectangle (120mm, 90mm) ;
      \fi
      \slidebackground{white}{95}{darkcolor}
      \clip (0,0) rectangle (120mm, 90mm) ;
      % header
      \iftitlepresent
      \ifthenelse{\equal{\pageref{slide:start:\the\slide@num}}{\pageref{slide:end:\the\slide@num}}}{}{%
        \fill [lightcolor] (120mm, 90mm) -- +(-13mm, 0) -- +(-13mm, -15mm) -- +(0, -15mm) ;
      }
      \begin{scope}
        \clip (0mm, 80mm) -- (120mm, 84mm) -- (120mm, 90mm) -- (0mm, 90mm) ;
        \fill [darkcolor] (0mm, 0mm) rectangle (120mm, 90mm) ;
        \node at (0mm, 84mm) [text width=120mm, anchor=base west, text height=5mm, text depth=2mm, inner sep=0] {%
          ~\color{lightcolor}\Large\puttitle%
        } ;
      \end{scope}
      \ifthenelse{\equal{\pageref{slide:start:\the\slide@num}}{\pageref{slide:end:\the\slide@num}}}{}{%
        \node at (118mm, 78mm) [anchor=base east, text height=5mm, text depth=2mm, inner sep=0] {%
          \color{darkcolor}\Large%
            \newcount\@tmpc%
            \@tmpc= 1\relax%
            \advance\@tmpc by \getpagerefnumber{slide:end:\the\slide@num}\relax%
            \advance\@tmpc by -\getpagerefnumber{slide:start:\the\slide@num}\relax%
            \the\slide@idx~/~\the\@tmpc%
          } ;
        }%
        \global\advance\top@content by -7mm%
        \ifsubtitlepresent
          \node (TN) at (0mm, 79mm) [anchor=base west] {%
            ~~\color{darkcolor}\large\putsubtitle%
          } ;
          \global\advance\top@content by -7mm%
        \fi
      \fi
      % footer
      \ifmaintitlepresent
      \begin{scope}
        \clip (0, 0) -- (0, 6mm) -- (120mm, 10mm) -- (120mm,0) ;
        \node (CN) at (60mm, 2mm) [anchor=base, text height=40mm, text depth=4mm, fill=lightcolor, inner sep=0] {%
          \Large\color{darkcolor}\strut~~~\putmaintitle~~~~\strut%
        } ;
        \ifconfnamepresent
          \node at (2mm, 2mm) [inner sep=0, anchor=base west, text height=4mm, text depth=4mm] {%
            \color{darkcolor}\ifconfshortnamepresent\putconfshortname\else\putconfname\fi%
          } ;
        \fi
      \end{scope}
      \fi
      \node at (118mm, 2mm) [anchor=base east, inner sep=0, text height=4mm, text depth=4mm]
        {\color{darkcolor}\ifbonus\Huge$\star$\else\large{\the\thisslide}~/~{\the\totalslides}\fi} ;
      % body
      \newdimen\@tmpd%
      \@tmpd=\top@content%
      \advance\@tmpd by -7mm%
      \@tmpd=0.5\@tmpd%
      \advance\@tmpd by 7mm%
      \node at (2mm, \@tmpd) [anchor=west, inner sep=1mm] {\box\slide@box} ;
    \end{tikzpicture}%
  }%
  \def\split{%
    \shippage%
    \clearpage%
    \global\advance\slide@idx by 1\relax%
    \startpage%
    \ifbonus\else{%
      \global\advance\thisslide by 1\relax%
      \immediate\write\toctocf{\string\onemoreslide}%
    }\fi%
  }%
  \label{slide:start:\the\slide@num}
  \startpage%
}{%
  \shippage%
  \label{slide:end:\the\slide@num}
  \ifhidden\else\iftitlepresent\recordtoctocslide{\puttitle}\fi\fi%
  \clearpage%
}

\newenvironment{emptyslide}[1][auto]{%
  \setbox\slide@box\hbox\bgroup%
  \ifwide%
  \begin{minipage}[t][90mm]{144mm}%
  \else%
  \begin{minipage}[t][90mm]{120mm}%
  \fi%
}{%
  \end{minipage}\egroup%
  \noindent\begin{tikzpicture}
    \ifwide
    \clip (-72mm,0) rectangle (72mm, 90mm) ;
    \else
    \clip (-60mm,0) rectangle (60mm, 90mm) ;
    \fi
    \node at (0, 45mm) [inner sep=0mm] {\box\slide@box} ;
  \end{tikzpicture}%
  \clearpage%
}

\newenvironment{tikzslide}[1][auto]{%
  \noindent\begin{tikzpicture}
  \ifwide
  \clip (-72mm,-45mm) rectangle (72mm, 45mm) ;
  \else
  \clip (-60mm,-45mm) rectangle (60mm, 45mm) ;
  \fi
}{%
  \end{tikzpicture}%
   \clearpage%
}

\newenvironment{bigslide}[1][]{%
  \title{~~}%
  \resetsubtitle{}%
  \def\startpage{%
    \top@content=90mm%
    \setbox\slide@box\hbox\bgroup%
    \begin{minipage}{104mm}%
      \centering\color{black}\large\strut%
  }%
  \ifbonus\else{%
    \global\advance\thisslide by 1\relax%
    \immediate\write\toctocf{\string\onemoreslide}%
  }\fi%
  \def\toc{\color{darkcolor}\replaytoctoc}%
  \def\shippage{%
      \par%
    \end{minipage}\egroup%
    \noindent\begin{tikzpicture}
      % background & clipping
      \ifwide
      \clip (-72mm,0) rectangle (72mm, 90mm) ;
      \else
      \clip (-60mm,0) rectangle (60mm, 90mm) ;
      \fi
      % text
      \node (TT) at (0mm, 46mm) [anchor=south, text width=120mm, text centered] {%
        \color{lightcolor}\huge\strut\puttitle%
          \ifsubtitlepresent\\ \Large \putsubtitle\fi%
        } ;

        \begin{scope}[xshift=-60mm]
          \slidebackground{white}{95}{darkcolor}
        \end{scope}
        \begin{scope}
          \clip (TT.north-|-72mm, 0mm) -- (TT.north-|72mm, 4mm) -- (72mm, 90mm) -- (-72mm, 90mm) -- cycle ;
          \fill [lightcolor] (-72mm,0) rectangle (72mm, 90mm) ;
          \begin{scope}[xshift=-60mm]
            \slidebackground{lightcolor}{95}{white}
          \end{scope}
        \end{scope}
      \fill [darkcolor]
        ($(TT.south west)+(-12mm, -6mm)$) -- ($(TT.north west)+(-12mm, 0mm)$) --
        ($(TT.north east)+(12mm, 6mm)$) -- ($(TT.south east)+(12mm, 0mm)$) -- cycle ;
      \node at (0mm, 46mm) [anchor=south, text width=\paperwidth, text centered] {%
        \color{lightcolor}\huge\strut\puttitle%
          \ifsubtitlepresent\\ \Large \putsubtitle\fi%
        } ;
      \node at (TT.south) [anchor=north, yshift=-3mm] {%
        \box\slide@box
      } ;
      % footer
      \ifmaintitlepresent
      \begin{scope}
        \clip (-72mm, 0) -- (-72mm, 5mm) -- (72mm, 11mm) -- (72mm,0) ;
        \node (CN) at (0mm, 2mm) [anchor=base, text height=40mm, text depth=4mm, fill=lightcolor, inner sep=0] {%
          \Large\color{darkcolor}\strut~~~\putmaintitle~~~~\strut%
        } ;
        \ifconfnamepresent
          \node at (-58mm, 2mm) [inner sep=0, anchor=base west, text height=4mm, text depth=4mm] {%
            \color{darkcolor}\ifconfshortnamepresent\putconfshortname\else\putconfname\fi%
          } ;
        \fi
      \end{scope}
      \fi
      \node at (58mm, 2mm) [anchor=base east, inner sep=0, text height=4mm, text depth=4mm]
        {\color{darkcolor}\ifbonus\Huge$\star$\else\large{\the\thisslide}~/~{\the\totalslides}\fi} ;
    \end{tikzpicture}%
    \clearpage%
  }%
  \startpage%
}{%
  \shippage%
  \recordtoctocbigslide{\puttitle}
}

\newcommand{\demotime}[1][Demo]{%
\begin{tikzslide}
  \recordtoctocbigslide{#1 Time}
  \fill [lightcolor] (-200mm,-200mm) rectangle (200mm, 200mm) ;
  \node [rotate=7, text width=200mm, text centered, fill=darkcolor!40!lightcolor, inner sep=4.8mm] {%
    \color{darkcolor}%
    \fontsize{20mm}{20mm}\selectfont{\MakeUppercase{#1}\\[5mm]TIME}%
  } ;
  \node [rotate=7, text width=180mm, text centered] {%
    \hyphenation{every-where}%
    \color{lightcolor!80!darkcolor}\large%
    \foreach \i in {1,2,...,500} {\MakeUppercase{#1} TIME }
  } ;
  \node [rotate=7, text width=200mm, text centered] {%
    \color{darkcolor}%
    \fontsize{20mm}{20mm}\selectfont{\MakeUppercase{#1}\\[5mm]TIME}%
  } ;
\end{tikzslide}%
}

\def\hilightbullet{{\color{darkcolor}$\bullet$}}
\AtBeginDocument{
\renewcommand{\labelitemi}{~~~~~{\large \color{darkcolor}$\bullet$}}
\renewcommand{\labelitemii}{~~~~~\hilightbullet}
\renewcommand{\labelitemiii}{~~~~~\color{darkcolor}$-$}
}

\def\maketitle{%
  \noindent\begin{tikzpicture}
    % background & clipping
    \ifwide
    \clip (-12mm,0) rectangle (132mm, 90mm) ;
    \else
    \clip (0,0) rectangle (120mm, 90mm) ;
    \fi
    \slidebackground{white}{95}{darkcolor}
    \begin{scope}
      \clip (-12mm,42mm) -- (-12mm, 90mm) -- (132mm, 90mm) -- (132mm, 49mm);
      \fill [darkcolor] (-12mm,0) rectangle (132mm, 90mm) ;
      \slidebackground{darkcolor}{80}{white}
    \end{scope}
    % text
    \node (TT) at (60mm, 50mm) [anchor=south, text width=\paperwidth, text centered] {%
      \color{lightcolor}\huge\strut\putmaintitle%
          \ifmainsubtitlepresent\\ \Large \putmainsubtitle\fi%
    } ;
    \node at (TT.south) [anchor=north, yshift=-8mm] {%
      \begin{minipage}{104mm}%
        \centering\large\strut%
        \putmainauthor\\[1mm]
        \putconfdate \par
      \end{minipage}%
    } ;
    % footer
    \ifconfnamepresent
      \ifmaintitlepresent
      \begin{scope}
        \clip (0, 0) -- (0, 6mm) -- (120mm, 10mm) -- (120mm,0) ;
        \node (CN) at (60mm, 2mm) [anchor=base, text height=40mm, text depth=4mm, fill=lightcolor, inner sep=0] {%
          \Large\color{darkcolor}\strut~~~\putconfname~~~~\strut%
        } ;
      \end{scope}
      \fi
  \end{tikzpicture}%
  \clearpage%
}

\def\makethanks#1{%
  \noindent\begin{tikzpicture}
    % background & clipping
    \ifwide
    \clip (-12mm,0) rectangle (132mm, 90mm) ;
    \else
    \clip (0,0) rectangle (120mm, 90mm) ;
    \fi
    \slidebackground{white}{95}{darkcolor}
    \begin{scope}
      \clip (-12mm,42mm) -- (-12mm, 90mm) -- (132mm, 90mm) -- (132mm, 49mm);
      \fill [darkcolor] (-12mm,0) rectangle (132mm, 90mm) ;
      \slidebackground{darkcolor}{80}{white}
    \end{scope}
    % text
    \node (TT) at (60mm, 50mm) [anchor=south, text width=\paperwidth, text centered] {%
      \color{lightcolor}\huge\strut\putmaintitle%
          \ifmainsubtitlepresent\\ \Large \putmainsubtitle\fi%
    } ;
    \node at (TT.south) [anchor=north, yshift=-8mm] {%
      \begin{minipage}{104mm}%
        \centering\Huge\strut%
        #1
      \end{minipage}%
    } ;
    % footer
    \ifconfnamepresent
      \ifmaintitlepresent
      \begin{scope}
        \clip (0, 0) -- (0, 6mm) -- (120mm, 10mm) -- (120mm,0) ;
        \node (CN) at (60mm, 2mm) [anchor=base, text height=40mm, text depth=4mm, fill=lightcolor, inner sep=0] {%
          \Large\color{darkcolor}\strut~~~\putconfname~~~~\strut%
        } ;
      \end{scope}
      \fi
  \end{tikzpicture}%
  \clearpage%
}


\long\def\hilight#1{{\color{darkcolor}#1}}
\def\hilightbox#1{%
  \begin{tikzpicture}[baseline=(N.base)]
    \node (N) [rounded corners=1mm, fill=darkcolor, inner sep=0.4mm, text height=1.5ex, text depth=0.5ex] {\color{white}#1} ;
  \end{tikzpicture}%
}

\def\paramverb#1#2{%
  \global\edef\paramverbaccu{}%
  \def\paramverbaux##1{%
    \ifthenelse{\equal{##1}{#2}}{%
      \def\paramverbaux{%
        \catcode`\^=7\catcode`\$=3\catcode`\#=6%
        \catcode`\~=10\catcode`\ =10\catcode`\_=8\catcode`\{=1%
        \catcode`\}=2\catcode`\&=4\catcode`\#=6%
        #1{\paramverbaccu}%
      }%
    }{%
      \global\edef\paramverbaccu{\paramverbaccu##1}%
    }%
    \paramverbaux%
  }
  \catcode`\^=12\catcode`\$=12\catcode`\#=12%
  \catcode`\~=12\catcode`\ =12\catcode`\_=12\catcode`\{=12%
  \catcode`\}=12\catcode`\&=12\catcode`\#=12%
  \paramverbaux%
}

\def\hilightboxverb#1{\def\hilighttt##1{\hilightbox{\tt##1}}\paramverb{\hilighttt}{#1}}
\def\hilightverb#1{\def\hilighttt##1{\hilight{\tt##1}\xspace}\paramverb{\hilighttt}{#1}}

\renewcommand{\picture}[2][0.5\linewidth]{
  \par \medskip {\centering
    \begin{tikzpicture}
      \node [inner sep=0] (H) {\includegraphics[width=#1]{#2}} ;
    \end{tikzpicture}
 \par} \medskip
}

\newcommand{\tezoslogo}[1][white]{%
  {\begin{tikzpicture}[baseline=(X.base)]
   \node (X) [fill, inner sep=0.2ex, text depth={}, text height={}, shape=circle, text width=] {\color{#1}\tez} ;
  \end{tikzpicture}}\xspace%
}

\def\tableofcontents{
  \begin{slide}
    \title{Outline}
    \centering
    \begin{tikzpicture}
      \node (TT) [fill=lightcolor, text width=0.7\linewidth, text centered] {\large\strut\completetoc} ;
    \end{tikzpicture}
  \end{slide}
}
\def\pro{{\Large\fontspec[Scale=MatchLowercase]{DejaVu Sans}\selectfont\hilight{⊕}}}
\def\con{{\Large\fontspec[Scale=MatchLowercase]{DejaVu Sans}\selectfont\hilight{⊖}}}
\def\same{{\Large\fontspec[Scale=MatchLowercase]{DejaVu Sans}\selectfont\hilight{⊜}}}
