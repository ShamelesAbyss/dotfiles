$global:__SuppressProfileLoadingTime = $true

[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$OutputEncoding = [System.Text.Encoding]::UTF8
chcp 65001 > $null

Clear-Host

function Write-AbyssHeader {
    Write-Host ""
    Write-Host "Initializing Abyss Core..." -ForegroundColor DarkGray
    Write-Host "Loading modules: node - python - rust - git" -ForegroundColor DarkGray
    Write-Host "Establishing desktop dev shell..." -ForegroundColor DarkGray
    Write-Host "Chain link status: alive" -ForegroundColor DarkGray
    Write-Host ""
    Write-Host "      <>  ShamelesAbyss Windows dev rig online  <>" -ForegroundColor Cyan
    Write-Host "          powershell - git - rust - abyss shell" -ForegroundColor Green
    Write-Host ""
}

function Start-AbyssShell {
    Clear-Host
    Write-AbyssHeader

    $image = "C:\Users\Shame\OneDrive\Desktop\cyber.png"

    if (Get-Command chafa -ErrorAction SilentlyContinue) {
        if (Test-Path $image) {
            chafa $image --symbols vhalf --size 44x32
        } else {
            Write-Host "cyber.png not found at: $image" -ForegroundColor Yellow
        }
    } else {
        Write-Host "chafa not found. Install with: winget install hpjansson.Chafa" -ForegroundColor Yellow
    }

    Write-Host ""

    if (Get-Command fastfetch -ErrorAction SilentlyContinue) {
        fastfetch --logo none
    } else {
        Write-Host "fastfetch not found. Install with: winget install Fastfetch-cli.Fastfetch" -ForegroundColor Yellow
    }
}

function prompt {
    $branch = git branch --show-current 2>$null

    if ($branch) {
        $branch = " [$branch]"
    }

    Write-Host "$env:USERNAME@$env:COMPUTERNAME" -NoNewline -ForegroundColor Cyan
    Write-Host ":" -NoNewline -ForegroundColor DarkGray
    Write-Host (Get-Location).Path -NoNewline -ForegroundColor Green
    Write-Host "$branch" -NoNewline -ForegroundColor Magenta

    return " > "
}

function abyss { Start-AbyssShell }
function reload { . $PROFILE; Start-AbyssShell }

function ll { Get-ChildItem -Force }
function la { Get-ChildItem -Force }
function gs { git status }
function ga { git add . }
function gc { git commit }
function gp { git push }
function gl { git log --oneline --graph --decorate -20 }
function .. { Set-Location .. }
function home { Set-Location $HOME }

Start-AbyssShell