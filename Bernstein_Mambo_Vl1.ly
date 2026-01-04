\version "2.24.1"
\language "deutsch"
%
\header {
  title = "Mambo"
  subtitle = "from West Side Story"
  %subsubtitle = "Noten mit * sind oktaviert"
  instrument = \markup{\fontsize #4 "Violins 1"}
  composer = \markup{\center-column{"Leonard Bernstein" "1918 - 1990)"}}
  %opus = ""
  tagline = \markup {
    Engraved at
    \simple #(strftime "%Y-%m-%d" (localtime (current-time)))
    by tom
    with \with-url #"http://lilypond.org/"
    \line { LilyPond \simple #(lilypond-version) (http://lilypond.org/) }
  }
}
%}
% Letzte Seite mit Notenzeilen bis unten füllen 
\paper {
  ragged-last-bottom = #f
  %page-count = 2
}
\pointAndClickOff

pizz = ^\markup { \italic pizz. }
arco = ^\markup { \italic arco }
ffz = #(make-dynamic-script "ffz")
solo = ^\markup{Solo}
piuf = #(make-dynamic-script
            (markup #:normal-text "più"
                    #:dynamic "f"))
animato = \tempo\markup{\italic\medium animato}
moltoanimato = \tempo\markup{\italic\medium {molto animato}}
cantabile = \markup\italic{cantabile}
lento = \tempo\markup{\italic\medium lento}
piulento = \tempo\markup{\italic\medium {più lento}}
piuanimato = \tempo\markup{\italic\medium {più animato}}
tranquillo = \tempo\markup{\italic\medium tranquillo}
pocotranquillo = \tempo\markup{\italic\medium {poco tranquillo}}
atempo = \tempo\markup{\italic\medium {a tempo}}
rit = \tempo\markup{\italic\medium rit.}
pocorit = \tempo\markup{\italic\medium {poco rit.}}
pocoapocorit = \tempo\markup{\italic\medium {poco a poco rit.}}
ritardo = \tempo\markup{\italic\medium ritardo}
ritenuto = \tempo\markup{\italic\medium ritenuto}
rall = \tempo\markup{\italic\medium rall.}
stretto = \tempo\markup{\italic\medium stretto}
strepitoso = \tempo\markup{\italic\medium strepitoso}
% cpB conditional pageBreak 
%cpB = \pageBreak
cpBvlone = {}
cpBvltwo = {}
cpBva = \pageBreak
cpBvc = {}

o = ^\markup{*} % okatvierte Noten

showbar = {
  % https://lilypond.org/doc/v2.23/Documentation/learning/outside_002dstaff-objects
  \once \override Score.BarNumber.outside-staff-priority = #1500
  % https://lilypond.org/doc/v2.24/Documentation/notation/bars
  \once \override Score.BarNumber.break-visibility = #'#(#f #t #t)
  % https://lilypond.org/doc/v2.25/Documentation/snippets/rhythms_003a-printing-bar-numbers-inside-boxes-or-circles
  \once \override Score.BarNumber.font-size = 2
  \once \override Score.BarNumber.stencil
    %= #(make-stencil-boxer 0.1 0.25 ly:text-interface::print)
    = #(make-stencil-boxer 0.2 0.5 ly:text-interface::print)
    % = #(make-stencil-circler 0.1 0.25 ly:text-interface::print)
}
%
text =\lyricmode{Mam -- bo!}
violin = \relative d'''{\key c \major \tempo "Meno presto" 4=132 \set Score.currentBarNumber = #400
  d8(->\ff e) r4 R2*6 \showbar r16 <f, e'>16-> <f e'>16-> <f e'>16-> <f e'>8-> r8 r8 <e e'>8-> r4 <e e'>16-> <e e'>16-> <e e'>16-> r16 r4 \showbar % bar 410
  a,,16->( c) e gis-> r16 a,( c e) gis-> g r8 fis16-> d r8 
  a16->( c) e gis-> r16 a,( c e) gis->( g) fis d a r16 r8 a16->( c) e gis-> r8 g~-> g4. r8 R2*3 fis''16->\ff f r8 r4 \showbar % bar 420
  h,,,16->( d) fis ais-> r16 h,( d fis) ais-> a r8 gis16 e r8 R2 f''16->\ff fis-> r8 r4 h,,,16( d) fis ais-> r16 h,( d fis) ais->( a) gis e h( gis) r8  
  R2*4 \showbar % bar 430
  a''16( c) e gis-> r16 a,( c e) gis-> g-> r8 fis16-> d-> r8 a16( c) e gis-> r16 a,( c e) gis-> g fis d a fis r8 
  a16( c) e gis-> r8 g8:32~-> g4.:32 r8 R2*5 
  %r8 \override NoteHead.style = #'cross e,_\markup{Mam-} e_\markup{bo!} \revert NoteHead.style r8 
    << {r8 \override NoteHead.style = #'cross e, e \revert NoteHead.style r8 }
     \new CueVoice = "voice" \relative e''{\hideNotes s8^"shout!" e8 e8 s8\unHideNotes}
     \new Lyrics = "text"
  \context Lyrics = "voice" \lyricsto "voice" \text
  >>
  \showbar % bar 442 
  R2*3 r8 h(\f d e) <d fis>-. <d fis>-. r8 <e a>~->( <e a> <d fis>-.) r8 <cis f>->( <h d>) r8 <a des>->( <g b>) 
  r8 h!( d! e!) <d fis>-. <d fis>-. <e a>->( <d fis>) <e a>->( <d fis>) r8 <cis f>->( <h d>-.) <h d>-. <a des>->( <g b>) r8 h!(\< d! fis) 
  \showbar % bar 454 
  <fis, dis' h'>->\ff r8 r4 R2*6 r16 <eis' cis'>8->\ff\pizz <dis h'>16-. <eis cis'>8-. <dis h'>-. \showbar % bar 462 
  <eis, cis'>->\arco <eis cis'>-> r8 <dis h'>-> r16 <eis cis'>8-> <dis h'>16 <eis cis'>8 <dis h'> <eis' cis'>->\pizz r8 r8 <eis cis'>-> r16 <eis cis'>8-> <dis h'>16-> <eis cis'>8-. <dis h'>-. \bar"||" \showbar % bar 466 
  \key a \major 
  <cis a'e'>->\arco r8 r4 R2*5 \showbar % bar 472 
  <d a'>8-.\f\pizz <fis d'>-. r4 <d a'>8-. <fis d'>16-. <e c'>-. r4 
  <d a'>8-. <fis d'>-. r4 <d a'>8-. <fis d'>16-. <e c'>-. r4 R2*4 \showbar % bar 480 
  r4 <f, h g'>8-> r8 r4 <c f d'>8-> r8 r4 <f h g'>8-> r8 r8 <f h g'>-> r4 \bar"||" \showbar % bar 484 
  \key c \major 
  <e c' g'>8\ff-> r8 r4 R2*3 \showbar <e' c'>8->\arco <e c'>-. r8 <d b'>-.-> 
  r16 <e c'>8-.-> <d b'>16-. <e c'>8-. <d b'>-. <c g'>-> <c g'>-. <b f'>-. <c g'>-> R2 <e c'>8->\cresc <e c'>-. <d b'>-. <e c'>-> 
  <e c'>16-. <e c'>8-> <d b'>16 <e c'>8 <d b'> <c g'>->\fff <c g'> <b f'> <f d'>-> r8 <d b'>-. <f d'>-. <b f'>-> \showbar % bar 496 
  <e, c' g'>-. r8 <g' b>->(\f <e g>)
  
  %\pageBreak
  <g b>->( <e g>) <g b>->( <e g>) <g b>->( <e g>) <g b>->( <e g>) <g b>->( <e g>) <g b>->( <e g>) <g b>->( <e g>) <g b>->( <e g>) <g b>->( <e g>) <g b>->( <e g>) <g b>->( <e g>) <g b>->( <e g>) <g b>->(\< <e g>) <g b>->( <e g>)\! \showbar 
  <fis b>->( <e g>) <fis b>->( <e g>) <fis b>->( <e g>) <fis b>->( <e g>) <fis b>->( <e g>) <fis b>->( <e g>) <fis b>->( <e g>) <fis b>->( <e g>) \bar"||" \showbar 
  \key a \major 
  <a e'>->\f <cis a'>-> r4  <a e'>8\cresc <cis a'>16 <h g'>-> r4 <a e'>8-> <cis a'>-> r4 <a e'>8 <cis a'>16 <h g'>-> r4 
  \showbar a8->\ff g16( a~ a4) 
  a8-> g16( e~ e) cis'( h8) a-> r8 r4 R2*2 a8-> g16( e~ e) cis'( h8~) h2:32~ h4.:32 a8( \showbar d->) c16( a~ a8) r8 d8-> c16( a~ a8) r8 
  d->\ff c16( a~ a8 a->) g16 e8. d8-> c16( a~ \bar"||" \showbar % bar 524
  \key c \major 
  a\fff c) e <a, gis'>-> r16 a'( c e) <a, gis'>-> g' r8 <a, fis'>16-> d r8 a16( c) e <a, gis'>-> r16 a( c e) 
  <a, gis'>-> g' fis d a( fis) r8 <e a>16( <a c> <c e> <e gis>->) r16 <es g>8.~ <es g>2~ <es g>4 <fis, h>16( <h d> <d fis>) <fis ais>-> 
  r16 <fis, h>( <h d> <d fis>) <fis! ais>->( <f a>8.:32~) \showbar % bar 532 
  <f a>2:32~ <f a>2:32~ <f a>2:32~ <f a>2:32 \showbar \ottava 1 e'16->\ff e a,8 e-> a~-> a2 e'16-> e a,8 e-> a~-> a2 \ottava 0\showbar 
  a,2~\flageolet\f\>^\markup{sul D} a~\flageolet a~\flageolet \tempo "molto rall." a~\flageolet a4\flageolet\p\glissando d\flageolet \bar"|."
}

  %{
  %_______________________________________
  \relative fis{\time 6/8 \key f \major
  \set Score.currentBarNumber = #242
  % Permit first bar number to be printed
  \bar "" 
  %_______________________________________
  %}

%
%#(set-global-staff-size 20)
\score{<<
  %\set Score.markFormatter = #format-mark-box-numbers
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \new Staff{
    \set Staff.midiInstrument = #"violin" %"acoustic grand"
    \clef violin
    \compressEmptyMeasures %\compressFullBarRests
    \override MultiMeasureRest.expand-limit = #1 
    \time 2/4
    %\partial 4
    \violin
  }
       >>
       \layout{}
       \midi{}
}


%}