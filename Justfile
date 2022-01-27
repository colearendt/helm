docs:
  #!/bin/bash
  helm-docs --chart-search-root=charts --template-files=README.md.gotmpl --template-files=./_templates.gotmpl

lint:
  #!/bin/bash
  ct lint ./charts --target-branch main
