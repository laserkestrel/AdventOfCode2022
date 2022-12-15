# Advent of code 2022 - day 2
clear-host

[int]$ScoreRock = 1
[int]$ScorePaper = 2
[int]$ScoreScissors = 3

#Round bonus score n (0 lost, 3 draw, 6 win)

[int]$PointsRoundLose = 0
[int]$PointsRoundDraw = 3
[int]$PointsRoundWin = 6

# calculate score if you follow the strategy.

[int]$Global:TotalPoints = 0

# Col1 is opponent hand
# Col2 is my hand 
$inputdata = get-content "C:\Temp\day2input.txt"

foreach ($round in $inputdata){
    #write-output "Current Score is [$Global:TotalPoints]"
    #Clear Variables for this loop
    $handOpponent = $null
    $handMine = $null
    $scoreOpponent = $null
    $scoreMine = $null
    $roundpoints = $null
    [int]$bonuspoints = 0

    # break up each line into opponent and my hands.
    $handOpponent = $round.Split(" ")[0]
    $handMine = $round.Split(" ")[1]
    #Write-Output $round
    #Write-Output $handOpponent
    #Write-Output $handMine
    
    #Setup Opponent Hand
    If ($handOpponent -eq "A"){
        #"Opponent Rock"
        $scoreOpponent = $ScoreRock
        }
    ElseIf ($handOpponent -eq "B"){
        #"Opponent Paper"
        $scoreOpponent = $ScorePaper
        }
    ElseIf ($handOpponent -eq "C"){
        #"Opponent Scissors"
        $scoreOpponent = $ScoreScissors}
    else {
          "ERROR1!"
          exit 1
          }
    
    #Setup My Hand
    If ($handMine -eq "X"){
        #"I am Rock"
        $scoreMine = $ScoreRock}
    ElseIf ($handMine -eq "Y"){
         #"I am Paper"
         $scoreMine = $ScorePaper}
    ElseIf ($handMine -eq "Z"){
        #"I am Scissors"
         $scoreMine = $ScoreScissors}
    else {
        "ERROR2!"
        exit 2
        }
    # Calculate winning score
    #write-output "Opponent [$scoreOpponent] v Myscore [$ScoreMine]"

    if ($scoreMine -gt $scoreOpponent){
        #"I Won"
        $bonuspoints = $PointsRoundWin
        }
    elseif ($scoreMine -eq $scoreOpponent){
       # "I drew"
        $bonuspoints = $PointsRoundDraw
        }
    elseif ($scoreMine -le $scoreOpponent){
       # "I Lost"
        $bonuspoints = $PointsRoundLose
        }
    else{
        "ERROR3!"
        exit 3
        }
  #write-output "This round's bonus points were [$bonuspoints]"

  # Add the round points up
  $roundTotal = $scoremine + $bonuspoints

   # Now add the round points to the total.
    $Global:TotalPoints += $roundTotal
    Write-Output "[$handOpponent] [$scoreOpponent] [$handMine] [$scoreMine] - [$scoremine] + [$bonuspoints] = [$roundTotal]"
    #write-output ..
    }

Write-output "The total points were $Global:TotalPoints"