FROM golang:1.19.2-bullseye as installgolang

# Install claat tool
# https://github.com/googlecodelabs/tools/blob/master/claat/README.md#install
RUN git clone https://github.com/PanatchaiV22/tools.git
RUN cd tools/claat && CGO_ENABLED=0 go install

FROM scratch

WORKDIR /app
COPY --from=installgolang /go/bin/claat /claat

EXPOSE 9090
VOLUME /app

ENTRYPOINT ["/claat"]
