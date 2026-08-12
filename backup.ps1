$vault = "D:\Claude Code\HermesNous"
. "$vault\secrets.local.ps1"
$webhook = $BackupWebhook

cd $vault
git add .
$changes = git status --porcelain
if ($changes) {
    git commit -m "backup $(Get-Date -Format 'yyyy-MM-dd HH:mm')"
    $pushResult = git push 2>&1
    $status = if ($LASTEXITCODE -eq 0) { "success" } else { "FAILED: $pushResult" }
} else {
    $status = "no changes, skipped commit"
}

$body = @{ content = "Hermes Nous backup: $status" } | ConvertTo-Json
Invoke-RestMethod -Uri $webhook -Method Post -Body $body -ContentType "application/json"
