# Check for word lists
if ((Get-ChildItem .\words\).count -eq 0) {
    Write-Host "Hey, you forgot to add the word lists!" -ForegroundColor Yellow
    exit
}

# Select number of passwords to generate
$HowManyPasswords = Read-Host "How Many Passwords Would You Like?"
Write-Host "$HowManyPasswords fresh passwords coming right up!
" -ForegroundColor Green

# Read word list
$WordList = Get-Content .\words\*.txt

# Shake the jar!
$WordList = $WordList | Sort-Object {Get-Random}

$ThisMany = 1..$HowManyPasswords

foreach ($Password in $ThisMany) {
    
    # Get 4 random words from list
    $GrabWords = Get-Random -InputObject $WordList -Count 4
    
    # Convert word to titlecase, make it human readable
    $TextInfo = (Get-Culture).TextInfo
    
    # Output Password, Remove Spaces
    $Output = $TextInfo.ToTitleCase($GrabWords) -replace '\s',''

    $Output
}