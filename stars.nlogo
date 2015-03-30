;Intro to CS First Term
;Extra Credit Project
;Sharon Lin - PD 9 - Mr. Brooks
;1/23/15

breed [stars star]
breed [Ss S]
breed [Ts T]
breed [As A]
breed [Rs R]
breed [S2s S2]
breed [plates plate]
breed [bunnies bunny]
breed [blockers blocker]
breed [persons person]
breed [mini-stars mini-star]
breed [meepers meeper]
breed [tickers ticker]
breed [circle-outlines circle-outline]
breed [instructions instruction]
breed [highscores highscore]
breed [highscore1s highscore]
breed [highscore2s highscore]
breed [highscore3s highscore]
breed [highscore4s highscore]
breed [highscore5s highscore]
breed [highscore6s highscore]
breed [highscore7s highscore]
breed [highscore8s highscore]
breed [highscore9s highscore]
breed [highscore10s highscore]
breed [instructions-backs instructions-back]
breed [high-backs high-back]
breed [end-games end-game]
breed [end-screens end-screen]
breed [end-backs end-back]
breed [Aas Aa]
breed [Gs G]
breed [Ms M]
breed [Es Ee]
breed [Os O]
breed [Vs V]
breed [Rrs Rr]
breed [i1s i1]
breed [i2s i2]
breed [i3s i3]
breed [i4s i4]
breed [i5s i5]
breed [i6s i6]
breed [i7s i7]
breed [i8s i8]
breed [p1s p1]
breed [p2s p2]
breed [p3s p3]
breed [p4s p4]
breed [p5s p5]
breed [p6s p6]
breed [start-backs start-back]

persons-own [frame]

globals [
  lives
  highscore1
  highscore2
  highscore3
  highscore4
  highscore5
  highscore6
  highscore7
  highscore8
  highscore9
  highscore10
  highscore1n
  highscore2n
  highscore3n
  highscore4n
  highscore5n
  highscore6n
  highscore7n
  highscore8n
  highscore9n
  highscore10n
  count-up
  count-down
  speed
  killed
  timetodeath
  plate-total
  clicked
  score
  bonus?
  money
  points
  magic
  health
  age
  on?
  brooks
  brok
  coopers
  state
  oldpos
  oldposy
]

turtles-own [old-pos]

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;SETUP PROCEDURES;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


to setup
  ca
  draw-space
 ; ask patches [if pxcor = 0 and pycor = 0 [sprout-bunnies 1 ] ]
 ; ask bunnies [set heading 0 setxy 0 -12 set shape "bunny" set size 20 ]
  set clicked 0
  set score 0
  set on? 0
  set brok 1
  set lives 5
  ask patch 2 -5 [set plabel "PLAY" set plabel-color white]
  ask patch 10 -15 [set plabel "INSTRUCTIONS" set plabel-color white]
  ask patch 8 -25 [set plabel "HIGHSCORES" set plabel-color white]
  create-Ss 1 [set shape "S" set size 20 setxy -30 40 set color gray set heading 0]
  create-Ts 1 [set shape "T" set size 20 setxy -15 40 set color gray set heading 0]
  create-As 1 [set shape "A" set size 20 setxy 0 40 set color gray set heading 0] 
  create-Rs 1 [set shape "R" set size 20 setxy 15 40 set color gray set heading 0]
  create-S2s 1 [set shape "S" set size 20 setxy 28 40 set color gray set heading 0]
  cro 1 [set breed blockers set size 1000 set color black set hidden? true]
  cro 300 [set breed meepers set shape "circle" set color white fd 60 set hidden? true ]
  cro 1 [set breed persons set shape "brooks-bae" set size 20 set color gray setxy 0 0 set hidden? true]
  set count-up 0
  set count-down 100
  set speed .001
  set brooks 0
  set coopers 0
  set highscore1 "Joe Bob"
  set highscore2 "Joe Bob"
  set highscore3 "Joe Bob"
  set highscore4 "Joe Bob"
  set highscore5 "Joe Bob"
  set highscore6 "Joe Bob"
  set highscore7 "Joe Bob"
  set highscore8 "Joe Bob"
  set highscore9 "Joe Bob"
  set highscore10 "Joe Bob"
  set highscore1n 0
  set highscore2n 0
  set highscore3n 0
  set highscore4n 0
  set highscore5n 0
  set highscore6n 0
  set highscore7n 0
  set highscore8n 0
  set highscore9n 0
  set highscore10n 0
  set state 0
  cro 1 [set breed circle-outlines set hidden? true set shape "circle-outline" set size 2 ]
  cro 1 [set breed tickers set hidden? true set size 10 set shape "ticker" set color orange ]
  cro 1 [set breed instructions set hidden? true set color black]
  cro 1 [set breed highscores set hidden? true set color black]
  cro 1 [set breed highscore1s set hidden? true set color black]
  cro 1 [set breed highscore2s set hidden? true set color black]
  cro 1 [set breed highscore3s set hidden? true set color black]
  cro 1 [set breed highscore4s set hidden? true set color black]
  cro 1 [set breed highscore5s set hidden? true set color black]
  cro 1 [set breed highscore6s set hidden? true set color black]
  cro 1 [set breed highscore7s set hidden? true set color black]
  cro 1 [set breed highscore8s set hidden? true set color black]
  cro 1 [set breed highscore9s set hidden? true set color black]
  cro 1 [set breed highscore10s set hidden? true set color black]
  cro 1 [set breed instructions-backs set hidden? true set shape "back" set label "BACK" set size 20 setxy max-pxcor - 5 max-pycor - 5]
  cro 1 [set breed i1s set hidden? true set color black]
  cro 1 [set breed i2s set hidden? true set color black]
  cro 1 [set breed i3s set hidden? true set color black]
  cro 1 [set breed i4s set hidden? true set color black]
  cro 1 [set breed i5s set hidden? true set color black]
  cro 1 [set breed i6s set hidden? true set color black]
  cro 1 [set breed i7s set hidden? true set color black]
  cro 1 [set breed i8s set hidden? true set color black]
  cro 1 [set breed p1s set hidden? true ]
  cro 1 [set breed p2s set hidden? true ]
  cro 1 [set breed p3s set hidden? true ]
  cro 1 [set breed p4s set hidden? true ]
  cro 1 [set breed p5s set hidden? true ]
  cro 1 [set breed p6s set hidden? true ]
  cro 1 [set breed high-backs set hidden? true set shape "back" set label "BACK" set size 20 setxy min-pxcor - 10 max-pycor - 7]
  cro 1 [set breed end-games set hidden? true set size 1000 set color black]
  cro 1 [set breed end-screens set shape "end-screen" setxy 0 30 set hidden? true set size 20 set color white]
  cro 1 [set breed end-backs set hidden? true set shape "back" set label "BACK" set size 20 setxy min-pxcor - 10 max-pycor - 7]
  create-Gs 1 [set shape "G" set size 20 setxy -30 -20 set color gray set heading 0 set hidden? true]
  create-Aas 1 [set shape "Aa" set size 20 setxy -15 -20 set color gray set heading 0 set hidden? true]
  create-Ms 1 [set shape "M" set size 20 setxy 0 -20 set color gray set heading 0 set hidden? true]
  create-Es 1 [set shape "E" set size 20 setxy 15 -20 set color gray set heading 0 set hidden? true]
  create-Os 1 [set shape "O" set size 20 setxy -30 -40 set color gray set heading 0 set hidden? true]
  create-Vs 1 [set shape "V" set size 20 setxy -15 -40 set color gray set heading 0 set hidden? true]
  create-Es 1 [set shape "E" set size 20 setxy 0 -40 set color gray set heading 0 set hidden? true]
  create-Rrs 1 [set shape "Rr" set size 20 setxy 15 -40 set color gray set heading 0 set hidden? true]
  cro 1 [set breed start-backs set hidden? true set shape "back" set label "BACK" set size 20 setxy min-pxcor - 10 max-pycor - 7]
  ask patches with [(abs pxcor < 12 and abs pxcor > 10) and (pycor < 0 and pycor > -10)] [set pcolor 104]
   ask patches with [(pycor < 1 and pycor > -1) or (pycor < -8 and pycor > -10) and (abs pxcor < 12)] [set pcolor 104] 
 ask patches with [abs pxcor < 12 and abs pxcor > 10 and pycor < -11 and pycor > -19] [set pcolor 104
   ask patches with [(pycor < -11 and pycor > -13) or (pycor < -17 and pycor > -19) and (abs pxcor < 12)] [set pcolor 104]] 
 ask patches with [abs pxcor < 12 and abs pxcor > 10 and pycor > -29 and pycor < -20] [set pcolor 104
   ask patches with [(pycor < -20 and pycor > -22) or (pycor < -27 and pycor > -29) and (abs pxcor < 12)] [set pcolor 104]]
  ask patch 0 0 [sprout (random 10) + 10 
      [set breed mini-stars set shape "star" set color 49 set size 5 set heading (random 360) set hidden? true ]]
  create-stars 1 [set shape "circle" set size .5 set color white set heading 315 setxy min-pxcor max-pycor 
    repeat 50 [setxy (random 70) - 70 min-pycor wait .01 
      repeat 20 [ wait .01 go repeat 20 [fd 1  wait .001]]]]
  reset-ticks
end

to start-screen
  ask blockers [set hidden? false]
  ask meepers [set hidden? false]
  ask persons [set hidden? false]
  ask mini-stars [set hidden? false set color 49 set state 0 setxy (random 49) + 10 (random 49) + 10]
  ask tickers [set hidden? false]
  ask circle-outlines [set hidden? false]
  if mouse-down?
  [repeat 50000 [start-game]]
  ask start-backs [set hidden? false set label "BACK" setxy min-pxcor - 10 min-pycor - 5]
end

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;RUNTIME PROCEDURES;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

to start-game 
  ask start-backs [set hidden? false]
  ask instructions-backs [set hidden? true]
  ask high-backs [set hidden? true]
  ask end-backs [set hidden? true]
  starting-back
  record
  ask blockers [set hidden? false]
  ask mini-stars [
    if any? mini-stars with [state = 1] [ask mini-stars with [state = 1] [stop]]
    if any? mini-stars with [color = red] [ask mini-stars with [color = red] [stop]]
    if distancexy 0 0 >= 60 [die]
    fd .5 rt (random 40) lt (random 40) wait .0008
    if (count mini-stars with [color = 49] < 15) [hatch-mini-stars 5 [setxy (random 30) + (random 30) - (random 60) (random 30) + (random 30) - (random 60) set color 49 set state 0]]
  ]
  ask circle-outlines [if any? mini-stars in-radius (count-up * 3) [ask mini-stars in-radius (count-up * 3) [set color red set state 1 stop]]]
  ask persons [setxy mouse-xcor mouse-ycor
    if any? mini-stars in-radius 10 with [color = red] [ask mini-stars in-radius 10 with [color = red] [die] set score score + 1]
    if any? mini-stars in-radius 4 with [color = 49] and brok = 1 [set brok 0 hurt-person set lives lives - 1]
    if not any? mini-stars-on neighbors and brok = 0 [set brok 1]
    ifelse mouse-down? [ 
      set brooks 0
      set count-up count-up + 1 ask tickers [
        set hidden? false animate-ticker setxy mouse-xcor + 3 mouse-ycor + 3] 
      ask circle-outlines [make-radius setxy mouse-xcor mouse-ycor]
      if count-up = 16 [ask circle-outlines [set size 1] ask tickers [set shape "ticker" set count-up 0 set brooks 0]
        set speed .00001]] [if brooks = 0 [set brooks 1 animate-person (set coopers count-up) set count-up 0 bazinga 
        ask circle-outlines [set hidden? true] ask tickers [set hidden? true] set speed .001 set count-down 0]]]
    if lives <= 0 [ask mini-stars [stop] endgame ifelse score >= highscore1n [set highscore10n highscore9n set highscore10 highscore9 set highscore9n highscore8n set highscore9 highscore8 set highscore8n highscore7n set highscore8 highscore7 set highscore7n highscore6n set highscore7 highscore6 set highscore6n highscore5n set highscore6 highscore5 set highscore5n highscore4n set highscore5 highscore4 set highscore4n highscore3n set highscore4 highscore3 set highscore3n highscore2n set highscore3 highscore2 set highscore2n highscore1n set highscore2 highscore1 set highscore1n score set highscore1 username stop] [
          ifelse score >= highscore2n [set highscore10n highscore9n set highscore10 highscore9 set highscore9n highscore8n set highscore9 highscore8 set highscore8n highscore7n set highscore8 highscore7 set highscore7n highscore6n set highscore7 highscore6 set highscore6n highscore5n set highscore6 highscore5 set highscore5n highscore4n set highscore5 highscore4 set highscore4n highscore3n set highscore4 highscore3 set highscore3n highscore2n set highscore3 highscore2 set highscore2n score set highscore2 username stop] [
            ifelse score >= highscore3n [set highscore10n highscore9n set highscore10 highscore9 set highscore9n highscore8n set highscore9 highscore8 set highscore8n highscore7n set highscore8 highscore7 set highscore7n highscore6n set highscore7 highscore6 set highscore6n highscore5n set highscore6 highscore5 set highscore5n highscore4n set highscore5 highscore4 set highscore4n highscore3n set highscore4 highscore3 set highscore3n score set highscore3 username stop] [
              ifelse score >= highscore4n [set highscore10n highscore9n set highscore10 highscore9 set highscore9n highscore8n set highscore9 highscore8 set highscore8n highscore7n set highscore8 highscore7 set highscore7n highscore6n set highscore7 highscore6 set highscore6n highscore5n set highscore6 highscore5 set highscore5n highscore4n set highscore5 highscore4 set highscore4n score set highscore4 username stop ] [
                ifelse score >= highscore5n [set highscore10n highscore9n set highscore10 highscore9 set highscore9n highscore8n set highscore9 highscore8 set highscore8n highscore7n set highscore8 highscore7 set highscore7n highscore6n set highscore7 highscore6 set highscore6n highscore5n set highscore6 highscore5 set highscore5n score set highscore5 username stop ][
                  ifelse score >= highscore6n [set highscore10n highscore9n set highscore10 highscore9 set highscore9n highscore8n set highscore9 highscore8 set highscore8n highscore7n set highscore8 highscore7 set highscore7n highscore6n set highscore7 highscore6 set highscore6n score set highscore6 username stop] [
                    ifelse score >= highscore7n [set highscore10n highscore9n set highscore10 highscore9 set highscore9n highscore8n set highscore9 highscore8 set highscore8n highscore7n set highscore8 highscore7 set highscore7n score set highscore7 username stop] [
                      ifelse score >= highscore8n [ set highscore10n highscore9n set highscore10 highscore9 set highscore9n highscore8n set highscore9 highscore8 set highscore8n score set highscore8 username stop] [
                        ifelse score >= highscore9n [ set highscore10n highscore9n set highscore10 highscore9 set highscore9n score set highscore9 username stop] [
                          ifelse score >= highscore10n [set highscore10n score set highscore10 username stop][endgame]]]]]]]]]]]
end

to record
  set oldpos mouse-xcor
  set oldposy mouse-ycor 
end

to bazinga
  animate-person
  ask circle-outlines [set size (coopers)]
  ask mini-stars [if distancexy mouse-xcor mouse-ycor <= coopers [set state "selected" set color red stop set score score + 1]]
end

to instruction-screen
  if mouse-down?
  [repeat 500000 [instructionss]]
end
  
to instructionss
  ask start-backs [set hidden? false]
  starting-back
  ask blockers [set hidden? false]
;  ask Ss [stop]
;  ask Ts [stop]
;  ask As [stop]
;  ask Rs [stop]
;  ask stars [stop]
;  ask patch 2 -5 [set plabel "" set plabel-color white]
;  ask patch 10 -15 [set plabel "" set plabel-color white]
;  ask patch 8 -25 [set plabel "" set plabel-color white]
;  ask stars [set hidden? true] 
  ask instructions-backs [set hidden? false set shape "circle" set color black set label "Instructions" setxy max-pxcor - 15 max-pycor - 15] 
  ask i1s [set hidden? false setxy max-pxcor - 5 max-pycor - 30 set label "The object of the game is to capture as many stars as possible." ]
  ask p1s [set hidden? false setxy -60 max-pycor - 10 set shape "star" set size 10]
  ask i2s [set hidden? false setxy max-pxcor - 5 max-pycor - 35 set label "When you click, the ticker will go up and increase the radius of your circle."]
  ask p2s [set hidden? false setxy -60 max-pycor - 30 set shape "circle-outline" set size 10]
  ask i3s [set hidden? false setxy max-pxcor - 5 max-pycor - 40 set label "After you release your mouse key, you will be able to capture the stars within the radius chosen by your ticker."]
  ask p3s [set hidden? false setxy -60 max-pycor - 50 set shape "ticker" set size 10]
  ask i4s [set hidden? false setxy max-pxcor - 5 max-pycor - 45 set label "The stars will turn red and stop in their place. This is your chance to earn point!"]
  ask i5s [set hidden? false setxy max-pxcor - 5 max-pycor - 50 set label "However, you will lose a life if you touch the stars."]
  ask i6s [set hidden? false setxy max-pxcor - 5 max-pycor - 55 set label "(They are very pointy!)"]
  ask i7s [set hidden? false setxy max-pxcor - 5 max-pycor - 60 set label "Once you lose five lives, GAME OVER! (Check out your high score afterwards!)"]
  ask p4s [set shape "end-screen" setxy -60 max-pycor - 70 set hidden? false set size 10]
  ask p5s [set shape "brooks-bae" setxy -60 max-pycor - 60 set hidden? false set size 10]
  ask i8s [set hidden? false setxy max-pxcor - 5 max-pycor - 65  set label "Good luck!"]
end

to starting-back
  ifelse (mouse-xcor > 50 and mouse-xcor < 70) and (mouse-ycor > 50 and mouse-ycor < 70) and mouse-down? [start-again] [
    ifelse (mouse-xcor > 50 and mouse-xcor < 70) and (mouse-ycor > 50 and mouse-ycor < 70) [ask start-backs [set shape "backon"]] [ask start-backs [set shape "back"]]]
end

to endgame
  ask start-backs [set hidden? false ]
  starting-back
  ask blockers [set hidden? false]
  ask end-games [set hidden? false]
  ask end-screens [set size 50  set hidden? false]
  ask Gs [set hidden? false]
  ask Aas [set hidden? false]
  ask Ms [set hidden? false]
  ask Es [set hidden? false]
  ask Os [set hidden? false]
  ask Vs [set hidden? false]
  ask Es [set hidden? false]
  ask Rrs [set hidden? false]
end

to high-scores
  if mouse-down?
  [repeat 500000 [high-scoress]]
end

to high-scoress
  ask start-backs [set hidden? false]
  starting-back
  ask blockers [set hidden? false]
  ask highscores [set hidden? false setxy 0 max-pycor - 12 set label "HIGH SCORES"]
  ask highscore1s [set hidden? false setxy 0 max-pycor - 16 set label (word "1. " highscore1 "                         " highscore1n)]
  ask highscore2s [set hidden? false setxy 0 max-pycor - 20 set label (word "2. " highscore2 "                         " highscore2n)]
  ask highscore3s [set hidden? false setxy 0 max-pycor - 24 set label (word "3. " highscore3 "                         " highscore3n)]
  ask highscore4s [set hidden? false setxy 0 max-pycor - 28 set label (word "4. " highscore4 "                         " highscore4n)]
  ask highscore5s [set hidden? false setxy 0 max-pycor - 32 set label (word "5. " highscore5 "                         " highscore5n)]
  ask highscore6s [set hidden? false setxy 0 max-pycor - 36 set label (word "6. " highscore6 "                         " highscore6n)]
  ask highscore7s [set hidden? false setxy 0 max-pycor - 40 set label (word "7. " highscore7 "                         " highscore7n)]
  ask highscore8s [set hidden? false setxy 0 max-pycor - 44 set label (word "8. " highscore8 "                         " highscore8n)]
  ask highscore9s [set hidden? false setxy 0 max-pycor - 48 set label (word "9. " highscore9 "                         " highscore9n)]
  ask highscore10s [set hidden? false setxy 0 max-pycor - 52 set label (word "10. " highscore10 "                         " highscore10n)]
end

to start-again
 ; draw-space
 ; ask patches [if pxcor = 0 and pycor = 0 [sprout-bunnies 1 ] ]
 ; ask bunnies [set heading 0 setxy 0 -12 set shape "bunny" set size 20 ]
  set clicked 0
  set score 0
  set on? 0
  set brok 1
  set lives 5
  ask patch 2 -5 [set plabel "PLAY" set plabel-color white]
  ask patch 10 -15 [set plabel "INSTRUCTIONS" set plabel-color white]
  ask patch 8 -25 [set plabel "HIGHSCORES" set plabel-color white]
  ask Ss [set hidden? false]
  ask Ts [set hidden? false]
  ask As [set hidden? false] 
  ask Rs [set hidden? false]
  ask S2s [set hidden? false set shape "S" set size 20 setxy 28 40 set color gray set heading 0]
  generate-star
  ask blockers [set hidden? true]
  ask meepers [set hidden? true ]
  ask persons [set hidden? true]
  set count-up 0
  set count-down 100
  set speed .001
  set brooks 0
  set coopers 0
  ask circle-outlines [ set hidden? true]
  ask tickers [ set hidden? true ]
  ask instructions [ set hidden? true]
  ask highscores [ set hidden? true ]
  ask highscore1s [set hidden? true]
  ask highscore2s [set hidden? true]
  ask highscore3s [set hidden? true]
  ask highscore4s [set hidden? true]
  ask highscore5s [set hidden? true]
  ask highscore6s [set hidden? true]
  ask highscore7s [set hidden? true]
  ask highscore8s [set hidden? true]
  ask highscore9s [set hidden? true]
  ask highscore10s [set hidden? true]
  ask start-backs [set hidden? true]
  ask instructions-backs [set hidden? true]
  ask i1s [set hidden? true]
  ask i2s [set hidden? true]
  ask i3s [set hidden? true]
  ask i4s [set hidden? true]
  ask i5s [set hidden? true]
  ask i6s [set hidden? true]
  ask i7s [set hidden? true]
  ask i8s [set hidden? true]
  ask p1s [set hidden? true ]
  ask p2s [set hidden? true ]
  ask p3s [set hidden? true ]
  ask p4s [set hidden? true ]
  ask p5s [set hidden? true ]
  ask p6s [set hidden? true ]
  ask high-backs [set hidden? true]
  ask end-games [set hidden? true ]
  ask end-screens [set hidden? true]
  ask Gs [set hidden? true]
  ask Aas [set hidden? true]
  ask Ms [set hidden? true]
  ask Es [set hidden? true]
  ask Os [set hidden? true]
  ask Vs [set hidden? true]
  ask Es [set hidden? true]
  ask Rrs [set hidden? true] 
  ask mini-stars [set hidden? true]
  ask stars [set hidden? false set shape "circle" set size .5 set color white set heading 315 setxy min-pxcor max-pycor 
    repeat 50 [setxy (random 70) - 70 min-pycor wait .01 
      repeat 20 [ wait .01 go repeat 20 [fd 1  wait .001]]]]
end

to hurt-person
  ask persons [
    setxy mouse-xcor mouse-ycor 
    set shape (word "hurtperson-" frame)
    forward 1 / 3
    set frame frame + 1
    if frame > 3
    [set frame 0 set shape "hurtperson-0"]
    set lives lives - 1
  ]
end
  
to-report stars-in-radius
  ask persons [
  report count stars in-radius (count-up)
  ]
end  
  
to animate-person
  ask persons [
    setxy mouse-xcor mouse-ycor 
    set shape (word "person-" frame)
    forward 1 / 3
    set frame frame + 1
    if frame > 3
    [set frame 0 set shape "person-0"]
  ]
end

to animate-ticker
  ask tickers [
    setxy mouse-xcor mouse-ycor 
    set shape (word "ticker-" count-up)
  ]
end

to make-radius
    set hidden? false
    set size (count-up * 5) 
end
  


to-report meepers?
  report count meepers-here
end

to starstop
  ask stars [stop]
end



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;BACKGROUND PROCEDURES;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

to go
  if (abs mouse-xcor < 12) and (abs mouse-ycor < 10) and mouse-down? [ start-screen] 
  ifelse (abs mouse-xcor < 12) and (abs mouse-ycor < 10) [ask patches with [(abs pxcor < 12 and abs pxcor > 10) and (pycor < 0 and pycor > -10)] [set pcolor white ask patches with [(pycor < 1 and pycor > -1) or (pycor < -8 and pycor > -10) and (abs pxcor < 12)] [ set pcolor white]]]
  [ask patches with [(abs pxcor < 12 and abs pxcor > 10) and (pycor < 0 and pycor > -10)] [set pcolor 104 ask patches with [(pycor < 1 and pycor > -1) or (pycor < -8 and pycor > -10) and (abs pxcor < 12)] [set pcolor 104] ]]
  if (abs mouse-xcor < 12) and (mouse-ycor < -10) and (mouse-ycor > -19)  and mouse-down? [ instruction-screen] 
  ifelse (abs mouse-xcor < 12) and (mouse-ycor < -10) and (mouse-ycor > -19) [ask patches with [abs pxcor < 12 and abs pxcor > 10 and pycor < -11 and pycor > -19] [set pcolor white ask patches with [(pycor < -11 and pycor > -13) or (pycor < -17 and pycor > -19) and (abs pxcor < 12)] [set pcolor white]]]
  [ask patches with [abs pxcor < 12 and abs pxcor > 10 and pycor < -11 and pycor > -19] [set pcolor 104 ask patches with [(pycor < -11 and pycor > -13) or (pycor < -17 and pycor > -19) and (abs pxcor < 12)] [set pcolor 104]]]
  if (abs mouse-xcor < 12) and (mouse-ycor < -20) and (mouse-ycor > -29) and mouse-down? [ high-scores] 
  ifelse (abs mouse-xcor < 12) and (mouse-ycor < -20) and (mouse-ycor > -29) [ask patches with [abs pxcor < 12 and abs pxcor > 10 and pycor > -29 and pycor < -20] [set pcolor white ask patches with [(pycor < -20 and pycor > -22) or (pycor < -27 and pycor > -29) and (abs pxcor < 12)] [set pcolor white]]]
  [ask patches with [abs pxcor < 12 and abs pxcor > 10 and pycor > -29 and pycor < -20] [set pcolor 104 ask patches with [(pycor < -20 and pycor > -22) or (pycor < -27 and pycor > -29) and (abs pxcor < 12)] [set pcolor 104]]]
end
  
to draw-space
  ask patches with [pycor < 50 and pycor > 30] [set pcolor 102]
 ; ask patches with [pycor < -60] [set pcolor (random 10) + 60] 
  generate-star
end
    

to generate-star
  ask patches with [pycor >= -70] [
    if random 1 = 0 [
      sprout-stars 1 [
        set shape "circle"
        set color white
        ifelse random 10 = 0 
          [set size random-float .9 - .5]
          [set size random-float .7 - .5]
        setxy abs random-float 200 - 300  ycor + random-float 1.0 - .5
      ]
    ]
  ]
end
