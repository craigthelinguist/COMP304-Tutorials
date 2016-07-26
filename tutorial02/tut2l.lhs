\documentclass[11pt]{article}

\usepackage[parfill]{parskip} % Activate to begin paragraphs with an empty line rather than an indent
\usepackage{verbatim}
\usepackage{xcolor}
\usepackage[margin=1.5in]{geometry}
\usepackage{titlesec}
\titlespacing*{\subsection}{0pt}{0\baselineskip}{0.3\baselineskip}
\usepackage{listings}
\lstnewenvironment{code}{
\lstset{
    language=Haskell,
    numbers=left,
    numberstyle=\color{gray!80},
    keywordstyle=\color{black},
    commentstyle=\color{green!50!black},
    stringstyle=\color{orange!85!black},
  showstringspaces=false,
    tabsize=3
}
}{}

\renewcommand{\thesubsection}{\thesection.\alph{subsection}}

\title{Tutorial 2}
\author{James and Aaron} %Your name
\date{}

\begin{document}
\maketitle
This is latex and haskell!

\section{Example}



\begin{code}
included = "code include"
\end{code}
Description can go between.

\begin{code}%
excluded = "code exclude"
\end{code}%

Note have text (\% in this case) immediately follow the \verb \begin{code}    is important to prevent the interpreter from executing the code that should not be executed.

\section{Tests}

You can setup your tests so that by running testIncluded your code is tested, if you are going for a more automated approach.

\begin{code}
testIncluded = included == "code include"
-- test a b = ...
-- testSuite = test 1 2 && test 2 1 
\end{code}

You could also show what you executed in the terminal when you tested your code.

\begin{verbatim}
ghci> included == "code include"
true 
\end{verbatim}

\newpage
\section{Tail recursion}

Defining a length function that uses backwards propagation.

\begin{code}
len1 [] = 0
len1 (x:xs) = 1 + len1 xs 

\end{code}

Showing some expansion

\begin{verbatim}
len1 [1,2,3,4]
1 + len1 [2,3,4]
1 + 1 + len1 [3,4]
1 + 1 + 1 + len1 [4]
1 + 1 + 1 + 1 + len1 []
...
4
\end{verbatim}

If we instead define a length function that uses tail recursion (forwards propagation), we get:

\begin{code}
len2 ls = len2' ls 0

len2' [] c = c
len2' (x:xs) c = len2' xs (c + 1)
\end{code}

Which expands like

\begin{verbatim}
len2 [1,2,3,4]
len2' [1,2,3,4] 0
len2' [2,3,4] 1
len2' [3,4] 2
len2' [4] 3
len2' [] 4
4
\end{verbatim}

The important difference is that the first way expanded sideways (reflecting that it was having to keep track of several values in memory) while the second way simply did not.

\begin{code}
fact n | n > 0     = n * fact(n-1)
       | otherwise = 1
       
\end{code}

\newpage
Note with lists, you still want to add to the front of the list ($O(1)$ with cons) instead of the back (which is $O(n)$). This works naturally for backwards propagation and for tail recursion you need to do a simple trick of building the list backwards and then reversing when you return it.

\begin{code}
ones 0 = []
ones x | x > 0     = x:ones (x - 1)
       | otherwise = error "No negatives!" 
\end{code}






\end{document}