
$htmlo = Get-Content -Path "mail.html" -Raw

function Send-Email {
    param (
        [string]$smtpServer = "smtp.example.com",
        [int]$smtpPort = 587,
        [string]$smtpUser = "your-email@example.com",
        [string]$smtpPassword = "your-password",
        [string]$from = "your-email@example.com",
        [string]$to = "recipient@example.com",
        [string]$subject = "Test Email",
        [string]$body = $htmlo
    )

    $message = New-Object system.net.mail.mailmessage
    $message.From = $from
    $message.To.Add($to)
    $message.Subject = $subject
    $message.Body = $body
    $message.IsBodyHtml = $true

    $smtp = New-Object Net.Mail.SmtpClient($smtpServer, $smtpPort)
    $smtp.EnableSsl = $true
    $smtp.Credentials = New-Object System.Net.NetworkCredential($smtpUser, $smtpPassword)
    
    try {
        $smtp.Send($message)
        Write-Host "Email sent successfully."
    } catch {
        Write-Host "Failed to send email. $_"
    }
}

Send-Email


$cert = New-SelfSignedCertificate -DnsName "Rami" -CertStoreLocation "Cert:\LocalMachine\My"

Set-AuthenticodeSignature -FilePath "C:\Users\RamiE\.packettracer" -Certificate $cert

# SIG # Begin signature block
# MIIFuQYJKoZIhvcNAQcCoIIFqjCCBaYCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCDXWMvZ4XfWjKp3
# M++dgz/7DzmeemA6PfaDhyl+/qaDkKCCAyIwggMeMIICBqADAgECAhAw8+WQSyql
# gEOwHTojBbHwMA0GCSqGSIb3DQEBCwUAMCcxJTAjBgNVBAMMHFBvd2VyU2hlbGwg
# Q29kZSBTaWduaW5nIENlcnQwHhcNMjQwNjA1MDc1MjMyWhcNMjUwNjA1MDgxMjMy
# WjAnMSUwIwYDVQQDDBxQb3dlclNoZWxsIENvZGUgU2lnbmluZyBDZXJ0MIIBIjAN
# BgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAxb4mMEuFaETJ68IXfSInwdxmuWDc
# nlUGYb/Ihhgg9bA6lY0+tGAp/3qgJy0frcAsxbGs50HlWdxZUjQ1ltjVWRHYD+X0
# 5Cl0tP4XGLJYNi/23LdhFX+95OUYI5RxCkhUoA9a3L9AaPTzbVEABS4sj0hC7W+v
# joPkGnbvZemo1eHEFybYgmHlAqFlSXSUJIRsIJwEw9Vzo8PM/mWEaHHCixxrHP5u
# OXz8V1F9lM4swJofI7JdEtX9SEpHIkTMTj8F8+tK4xlM2kxpYXxPY7erKznDRiLQ
# OhyANpUu1tD2kpDrGu9vFBJce31J2VTeXkmGcGx8vq9YR/F3qJsAZ0X7cQIDAQAB
# o0YwRDAOBgNVHQ8BAf8EBAMCB4AwEwYDVR0lBAwwCgYIKwYBBQUHAwMwHQYDVR0O
# BBYEFKx+z+nPpuFaumrilpB8inTzrweYMA0GCSqGSIb3DQEBCwUAA4IBAQClZo5M
# ukgrVq6GLoctaO6qIHPn5CxnGXWeOHqYd8ut2DpdM9azO/jobPrByZ7UQ7RWkom+
# p3zXlr/bbJ1fc9zvzlkMaJLzEQyxdzNOYV8SkItqSk33O/z6rAjFD3g5Z98zieMN
# FcdOmckRq+eayhgu3sDoQONRbZw5KwkLP7dGlGehRT8Ep/97h8xs7+D1cY/oFYBX
# nTNAs6Nv3PyvRYOMRRatAWMfQdHHvZ7AlJfyjXe/hehn8J/1Ju9/CaNAmMizUtoe
# O7U2S5AWSVRoMXwwU0aExZZ/PaC+wpJinmQVosEYoDMnSq25JV1ElTpsfTVyGJol
# GsCKARiJmnznIkhmMYIB7TCCAekCAQEwOzAnMSUwIwYDVQQDDBxQb3dlclNoZWxs
# IENvZGUgU2lnbmluZyBDZXJ0AhAw8+WQSyqlgEOwHTojBbHwMA0GCWCGSAFlAwQC
# AQUAoIGEMBgGCisGAQQBgjcCAQwxCjAIoAKAAKECgAAwGQYJKoZIhvcNAQkDMQwG
# CisGAQQBgjcCAQQwHAYKKwYBBAGCNwIBCzEOMAwGCisGAQQBgjcCARUwLwYJKoZI
# hvcNAQkEMSIEIFR7oJe+T+hs/Cff+K0j2ryeu/ugKGXFsLM+OPgG4ayzMA0GCSqG
# SIb3DQEBAQUABIIBAJyegeWYJYnQneKUnFu+FKzIDyOPwfwUoVIIMWc6S9nnJKbS
# mBV+XRVTohYihKPUvgrRt8GgOgqIfehQmRwvmYZZ7/0olqZnYA1UMgLmCtG1DDBM
# H8MvvEF6Awk01J+HLQp2lhYgFrriJxL4g7SnqUmF1lJu5n2BZ2xBSfvu8+6Ovj+y
# FRWM7e/zhDXxdh3mnJJ+gAak63vBnPl1zq1KcPWfFsLmGi0HYmo6tt/3qkjWTYQD
# DbiECzlP/sTMuNglM8jOzcjzGmL0iWoHRhTiLqFQttMp2yKcgSW/1IZ8/eIIwP1z
# zLEB849npL+uiGNiIEMiCWNoEM7IrM8wFmhUWu0=
# SIG # End signature block
