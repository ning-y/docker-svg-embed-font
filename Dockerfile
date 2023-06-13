FROM golang
RUN \
  mkdir svg-embed-font && \
  cd svg-embed-font && \
  git init . && \
  git remote add origin https://github.com/BTBurke/svg-embed-font && \
  git fetch --depth 1 origin d908a66c91ca1cda7d9f4dca96fc4f9a123c9048 && \
  git checkout FETCH_HEAD
WORKDIR svg-embed-font
RUN go mod init BTBurke.com/svg-embed-font && go mod tidy && go build && go install
ENTRYPOINT ["svg-embed-font"]
