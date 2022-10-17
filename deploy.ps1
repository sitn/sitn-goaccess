$envFile = (".env")

if (-Not (Test-Path -Path $envFile)) {
    Write-Error "Please create a .env file based on .env.sample" -ErrorAction Stop
}

# Read .env
foreach ($line in Get-Content $envFile) {
    $args = $line -split "="
    If ($args[0] -And !$args[0].StartsWith("#")) {
        $cmd = '$env:' + $args[0].Trim('"') + '="' + $args[1].Trim('"') + '"'
        Invoke-Expression $cmd
    }
}

docker build -t sitn/goaccess .

foreach ($line in Get-Content $envFile) {
    $args = $line -split "="
    If ($args[0] -And !$args[0].StartsWith("#")) {
        $cmd = '$env:' + $args[0].Trim('"') + '=""'
        Invoke-Expression $cmd
    }
}
