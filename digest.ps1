$vault = "D:\Claude Code\HermesNous"
. "$vault\secrets.local.ps1"
$webhook = $DigestWebhook

$prompt = @"
Follow the instructions in $vault\digest_instructions.md exactly.
After composing the digest message, post it to this Discord webhook URL using a POST request with JSON body {"content": "<message>"}:
$webhook
Then commit any vault changes to git (do not push unless a remote is configured).
"@

cd $vault
claude -p $prompt --allowedTools "Bash,Read,Write,Edit,Glob,Grep"
