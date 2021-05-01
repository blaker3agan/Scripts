$username = "breagan"
$user = get-aduser -filter { DisplayName -eq $username }
echo $user.SamAccountName