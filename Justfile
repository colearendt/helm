setup:
  #!/bin/bash
  # TODO: idempotency

  # TODO: check for macos
  mkdir -p ./bin/helm-docs-1.5.0/
  curl -L https://github.com/norwoodj/helm-docs/releases/download/v1.5.0/helm-docs_1.5.0_Darwin_x86_64.tar.gz | tar -xzvf - -C ./bin/helm-docs-1.5.0/
  ln -s $PWD/bin/helm-docs-1.5.0/helm-docs $PWD/bin/helm-docs

docs:
  #!/bin/bash
  ./bin/helm-docs --chart-search-root=charts --template-files=README.md.gotmpl --template-files=./_templates.gotmpl

lint:
  #!/bin/bash
  ct lint ./charts --target-branch main
