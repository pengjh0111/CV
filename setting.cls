%% setting.cls — 简历样式文件
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{setting}[2024/01/01 Resume Class]

%% ── 基础类 ───────────────────────────────────────────────────
\LoadClass[10pt, a4paper]{article}

%% ── 中文支持：冬青黑体简体中文（macOS 内置）─────────────────
\RequirePackage{xeCJK}
\setCJKmainfont{Hiragino Sans GB W3}[
  BoldFont = Hiragino Sans GB W6
]

%% ── 西文字体 ─────────────────────────────────────────────────
\RequirePackage{fontspec}
\setmainfont{Times New Roman}

%% ── 版面 ─────────────────────────────────────────────────────
\RequirePackage[
  top    = 1.2cm,
  bottom = 1.2cm,
  left   = 1.5cm,
  right  = 1.5cm
]{geometry}

\pagestyle{empty}
\setlength{\parindent}{0pt}
\setlength{\parskip}{0pt}

%% ── 颜色 ─────────────────────────────────────────────────────
\RequirePackage{xcolor}
\definecolor{themeblue}{RGB}{0, 45, 85}
\definecolor{sectionrule}{RGB}{0, 45, 85}
\definecolor{subtitlebg}{RGB}{235, 240, 248}

%% ── 必要宏包 ─────────────────────────────────────────────────
\RequirePackage{tikz}
\usetikzlibrary{calc}
\RequirePackage{graphicx}
\RequirePackage{enumitem}
\RequirePackage{tabularx}
\RequirePackage{fontawesome5}
\RequirePackage{hyperref}
\hypersetup{hidelinks}
\RequirePackage{calc}
\RequirePackage{array}
\RequirePackage{amsmath}

%% ── 列表间距 ─────────────────────────────────────────────────
\setlist[itemize]{
  leftmargin = 2em,
  topsep     = 2pt,
  itemsep    = 1pt,
  parsep     = 0pt
}

%% ══════════════════════════════════════════════════════════════
%%  \key — 深蓝色加粗关键词
%% ══════════════════════════════════════════════════════════════
\newCJKfontfamily\CJKbold{Hiragino Sans GB W6}
\newcommand{\key}[1]{%
  {\bfseries\CJKbold\color{themeblue}#1}%
}

%% ══════════════════════════════════════════════════════════════
%%  \name — 居中姓名
%% ══════════════════════════════════════════════════════════════
\newcommand{\name}[1]{%
  \begin{center}{\LARGE\bfseries #1}\end{center}%
  \vspace{-6pt}%
}

%% ══════════════════════════════════════════════════════════════
%%  \basicContactInfo{手机}{邮箱}
%% ══════════════════════════════════════════════════════════════
\newcommand{\basicContactInfo}[2]{%
  \begin{center}
    \small
    \faPhone\ #1 \quad
    \faEnvelope\ \href{mailto:#2}{#2} \quad
    {\color{themeblue!60!black}%
      \faBriefcase\ \textbf{实习状态：}可随时到岗，实习期 $\geq$ 6 个月}%
  \end{center}%
  \vspace{-4pt}%
}

%% ══════════════════════════════════════════════════════════════
%%  \logosection — 节标题（图标 + 文字 + 蓝色下划线）
%% ══════════════════════════════════════════════════════════════
\newcommand{\logosection}[2]{%
  \vspace{6pt}%
  \noindent{\large\bfseries\color{themeblue}#1\enspace #2}\par
  \noindent\textcolor{sectionrule}{\rule{\textwidth}{0.8pt}}%
  \vspace{2pt}%
}

%% ══════════════════════════════════════════════════════════════
%%  \datedline{左内容}{右内容}
%% ══════════════════════════════════════════════════════════════
\newcommand{\datedline}[2]{%
  \par\noindent
  \begin{tabular*}{\textwidth}{@{}l@{\extracolsep{\fill}}r@{}}
    #1 & #2
  \end{tabular*}\par
}

%% ══════════════════════════════════════════════════════════════
%%  \tripleInfo{a}{b}{c}
%% ══════════════════════════════════════════════════════════════
\newcommand{\tripleInfo}[3]{#1 \quad #2 \quad #3}

%% ══════════════════════════════════════════════════════════════
%%  \dateRange{开始}{结束}
%% ══════════════════════════════════════════════════════════════
\newcommand{\dateRange}[2]{#1--#2}

%% ══════════════════════════════════════════════════════════════
%%  \projecttitle{标题}{右侧附注} — 项目标题行
%% ══════════════════════════════════════════════════════════════
\newcommand{\projecttitle}[2]{%
  \vspace{5pt}%
  \par\noindent
  \textcolor{themeblue}{\rule[-0.15em]{0.2em}{1.1em}}\hspace{0.35em}%
  \textbf{\large #1}%
  \ifx&#2&\else\quad{\small\normalfont #2}\fi
  \par\vspace{1pt}%
}

%% ══════════════════════════════════════════════════════════════
%%  \subtitle{文字} — 项目内小标题
%% ══════════════════════════════════════════════════════════════
\newcommand{\subtitle}[1]{%
  \vspace{4pt}%
  \noindent
  \tikz[baseline=-0.55ex]\node[inner sep=2pt, fill=themeblue, rotate=45]{};%
  \hspace{0.4em}{\bfseries #1}%
  \par\vspace{1pt}\noindent\ignorespaces%
}