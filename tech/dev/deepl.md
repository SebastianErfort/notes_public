---
title: DeepL
type: software
category: translation
url: "https://www.deepl.com/translator"
docs: "https://www.deepl.com/docs-api"
source: "https://github.com/DeepLcom"
developer: "DeepL SE"
desc-short: |
  DeepL Translator is a neural machine translation service
tags: ""
---
`=this.img` `= ("[Website](" + this.url + ")")` |  `= ("[Source](" + this.source + ")")` | `= ("[Documentation](" + this.docs + ")")`
`= ("> " + this.desc-short)`

## API

API requests can be used to detect the language of a text and/or translate it. The free plan allows for 500 000 characters of translation per month, sign-up requires a credit card for identification.

Upon subscription the API key can be found in the [DeepL account](https://www.deepl.com/account/summary).

The [API documentation](https://www.deepl.com/docs-api) details how to detect and translate a text through HTTP requests, for example
```bash
curl -X POST 'https://api-free.deepl.com/v2/translate' \
--header 'Authorization: DeepL-Auth-Key [yourAuthKey]' \
--data-urlencode 'text=Hello, world!' \
--data-urlencode 'target_lang=DE'
```
with a response in JSON format,
```json
{"translations":[{"detected_source_language":"EN","text":"Hallo, Welt!"}]}
```
[Translating documents](https://www.deepl.com/docs-api/documents) is also possible.


Implementations

- [Python library: deepl-python](https://github.com/DeepLcom/deepl-python)