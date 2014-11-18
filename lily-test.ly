\version "2.16.0" %must define version at top
 
#(set-global-staff-size 20) %set overall size of notation
 
% define stuff for layout in paper block. If you don't do this, it will come out all wack from a printer.
 
\paper {
  %two-sided = ##t
  page-limit-inter-system-space = ##t
  ragged-bottom = ##f % used to do fit-to-page (optional)
  ragged-last-bottom = ##f % used to do fit-to-page (optional)
  page-limit-inter-system-space-factor = 1.3
  top-margin = 1\cm
  inner-margin = 2\cm
  outer-margin = 1.6\cm
  %system-separator-markup = \slashSeparator
  %max-systems-per-page = 1
  #(set-paper-size "letter")
}
 
 
flam = \drummode {
  \override Stem #'length = #4
  \acciaccatura {sn8}
  \revert Stem #'length
}
 
#(define mydrums '(
         (bassdrum        default   #f           -3)
         (snare           default   #f           1)
         (hihat           cross     #f           5)
         (halfopenhihat   cross     "halfopen"   5)
	 (openhihat       cross     "open"       5)
         (closedhihat     cross     "stopped"    5)
         (pedalhihat      xcircle   "stopped"    2)
         (lowtom          diamond   #f           3)
	 (pedalhihat      cross     "stopped"    -5)
	 (ridecymbal      cross     #f           4)
	 (crashcymbal     cross     #f           6)))
\layout { indent = 0.0\cm }
\header {
  title = "Drum Notes"
  composer = "Pete Savage (cbx33)"
}
 
\score {
  \new DrumStaff
  <<
    \set DrumStaff.drumStyleTable = #(alist->hash-table mydrums)
    \context DrumVoice  = "1" { s1 }
    \context DrumVoice  = "1" { s1 }
    \drummode {
      <<
	{
	  cymc16 hh hh r hh hh r hh hh hh r hh r hh r hh | % use bar checks
	} \\
	{
	  sn8    r16       sn8 r16       sn8 r16          bd16     sn8       sn        sn | % use bar checks
	}
      >>
    }
  >>
  \header {
    piece = "Practice Groove 1"
  }
}
 
\score {
  \new DrumStaff
  <<
    \set DrumStaff.drumStyleTable = #(alist->hash-table mydrums)
    \context DrumVoice  = "1" { s1 }
    \context DrumVoice  = "2" { s2 }
    \drummode {
      <<
	{
	  \tempo 4 = 105
          \mark \markup { \box A }
	  \set Score.repeatCommands = #'((volta #f) end-repeat)
	  cymc16 hhc hho hho r hhc hho hho hhc hhc hho hho r hhc hho hho |
	} \\
	{
	  <hhp bd>4                   <hhp bd sn>4           <hhp bd>4                <hhp bd sn>4 |
	}
      >>
      <<
	{
	  \set Score.repeatCommands = #'((volta "1.") end-repeat)
	  cymc16 hhc hho hho r hhc hho hho hhc hhc hho hho r hhc r hho |
	} \\
	{
	  <hhp bd>4                   <hhp bd sn>4           <hhp bd>4                <hhp bd sn>8  sn8 |
	}
      >>
      <<
	{
	  \set Score.repeatCommands = #'((volta "2.") end-repeat)
	  cymc16 hhc hho hho r hhc hho hho hhc hhc sn sn sn sn sn sn | \break
	  \set Score.repeatCommands = #'((volta #f) end-repeat)
	} \\
	{
	  <hhp bd>4                   <hhp bd sn>4           <hhp bd>4                <hhp bd>8 r8 |
	}
      >>
    }
  >>
  \header {
    piece = "Where the spirit of the Lord is (Main Groove)"
  }
}
 
voltaAdLib = \markup { 1. 2. 3... \text \italic { ad lib. } }
 
\score {
  \new DrumStaff
  <<
    \set DrumStaff.drumStyleTable = #(alist->hash-table mydrums)
    \context DrumVoice  = "1" { s1 }
    \context DrumVoice  = "2" { s2 }
    \drummode {
      <<
	{
	  \tempo 4 = 130
          \mark \markup { \box A }
	  cymr4 cymr cymr cymr | %one line of lilypond notation per bar, then a bar check at the end of each measure/line
	  cymr4 cymr cymr cymr |
	  cymr4 cymr cymr cymr |
	  cymr4 cymr cymr cymr |
	  cymc4 cymr cymr cymr |
	  cymr4 cymr cymr cymr |
	  cymc4. cymc8~ cymc4 cymc4~ 	  |
	  cymc8 cymc4.  cymc4  r4 |
	} \\
	{
	  bd4 r8 bd8 sn4  r4  |
	  bd16\accent r r bd r r bd r sn4 r |
	  bd4 r8 bd8 sn4  r4  |
	  bd16\accent r8 bd16 r8 bd16 r16 sn4 r4 |
	  bd4 r8 bd8 sn4  r4  |
	  bd16\accent r8 bd16 r8 bd16 r16 sn4 r4 |
	  bd4 sn8 bd~ bd sn bd4 |
	  sn8 bd4 sn8 bd sn \times 2/3 { sn sn sn } |
	}
      >>
      \break
      <<
	{
          \mark \markup { \box B }
	  cymr8 cymr cymr cymr cymr cymr cymr cymr |
	  cymr8 cymr cymr cymr cymr cymr cymr cymr |
	  cymr8 cymr cymr cymr cymr cymr cymr cymr |
	  cymr8 cymr cymr cymr cymr cymr cymr cymr |
	  cymr8 cymr cymr cymr cymr cymr cymr cymr |
	  cymr8 cymr cymr cymr cymr cymr cymr cymr |
	  cymc4. cymc8~ cymc4 cymc4~ || cymc8 cymc4. r2 |
	} \\
	{
	  bd4 r8 bd16 bd16 sn4  r4  |
	  bd16\accent r8 bd16 r8 bd16 r16 sn4 r4 |
	  bd4 r8 bd16 bd16 sn4  r4  |
	  bd16\accent r8 bd16 r8 bd16 r16 sn4 r4 |
	  bd4 r8 bd16 bd16 sn4  r4  |
	  bd16\accent r8 bd16 r8 bd16 r16 sn4 r4 |
	  bd4 \flam sn8 bd~ bd \flam sn bd4 |
	  sn8 bd4 sn8 \times 4/6 {sn16 sn sn sn r r } \times 4/6 { tomh tomh tomh tomh r r} |
	}
      >>
 
    }
  >>
  \header {
    piece = "Happy Day (Bridge Groove)"
  }
}
