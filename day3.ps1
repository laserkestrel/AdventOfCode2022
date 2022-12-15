# Advent of code 2022 - day 3
clear-host

#Find the item type that appears in both compartments of each rucksack. What is the sum of the priorities of those item types?

$inputdata = get-content "C:\Temp\day3inputtest.txt"

foreach ($rucksack in $inputdata){
    #eacho rucksack has different counts of items. Need to work out 50/50
    $compartmentcount = $rucksack.Length/2
    
    #Substring works by stating where to start, and how many tokens to take as the substring.
    $compartment1 = $rucksack.Substring(0,$compartmentcount)
    $compartment2 = $rucksack.Substring($compartmentcount,$compartmentcount)
   # "$compartment1"#, $compartment2"

    #can now cycle through each compartment and search for duplicate item. 
<#    foreach ($giftItem in $compartment1.ToCharArray()){
        write-output $giftItem

        }
#>
    $CP1 = $compartment1.ToCharArray()
    $CP2 = $compartment2.ToCharArray()
    $cp1 | ForEach-Object {
    if ($CP2 -ccontains $_) {
        Write-Host "`$CP2 contains the `$cp1 string [$_]"
        $mispackedItem = $null
        $mispackedItem = $_
    }

}


Write-output "finished"