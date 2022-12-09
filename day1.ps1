# Advent of code 2022 - day 1
#$creds = get-credential
#$Response = Invoke-WebRequest -Uri https://adventofcode.com/2022/day/1/input
$Global:Results = [System.Collections.ArrayList]@()
$inputdata = (Get-Content "$ENV:USERPROFILE\Desktop\day1input.txt")

# Measure lines WITHOUT blank rows
$rowsNoBlanks = $inputdata | Measure-Object -Line | Select Lines -ExpandProperty Lines

#Total number of rows (should be 2237)
$rowsAllCount = $inputdata.Count

#Calculate the elves
$elvesCount = $rowsAllCount - $rowsNoBlanks

Get-Content "$ENV:USERPROFILE\Desktop\day1input.txt" | Measure-Object -Line

#Creates array grouping by each set of numbers seperated by blank row
$ajr2 = (Get-Content "$ENV:USERPROFILE\Desktop\day1input.txt" -Raw) -split '(?:\r?\n){2,}'


foreach ($elf in $ajr2){
    write-host $elf
    $elf2 = $null
    $caloriecount = $null
    $elf2 = $elf.Split([System.Environment]::NewLine,[System.StringSplitOptions]::RemoveEmptyEntries)
    write-host ..
    foreach ($snack in $elf2){
        # Convert the string to an integer
        [int]$snack = $snack
        
        #Add up all the snacks into a total per elf
        [int]$caloriecount += $snack
        write-output "Total is [$caloriecount]"
        #$caloriecount += $Global:Results
        }
        $Global:Results += $caloriecount
        write-output ..
    }

$Global:Results | Sort -Descending | Select -First
