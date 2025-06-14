## Command Line

`mailx`

```bash
echo "$message" | mailx \
-r $from_address \
-s $subject \
-b $bcc_address \
-c $cc_address \
-a $attachment \
-S $smtp_server
-q $content_file \
$to_addr
```

`s-nail`

```bash
echo "Automated e-mail, do not reply" | LC_ALL=c s-nail -S mta=smtp://$EMAIL_SMTP \
    -S smtp-auth=none -S v15-compat -S from=$EMAIL_AUTHOR \
    -s "$EMAIL_SUBJECT" [-a "$EMAIL_ATTACHMENT" \
    -. "$EMAIL_BCC"
```
