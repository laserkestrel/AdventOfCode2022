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

#Creates new array, with element of array seperated by the blank row. (gets us 1 elf)
$splitdata = (Get-Content "$ENV:USERPROFILE\Desktop\day1input.txt" -Raw) -split '(?:\r?\n){2,}'



foreach ($elf in $splitdata){

    # null out variables
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
        }
        $Global:Results += $caloriecount
        write-output ..
    }

# Out of all elves, sort by the highest value, and select first record.
$Global:Results | Sort -Descending | Select -First 1

#Part 2
$part2Total = $Global:Results | Sort -Descending | Select -First 3
[int]$Global:Result2 = 0
foreach ($elf in $part2Total){
    $Global:Result2 += $elf
    }
$Global:Result2