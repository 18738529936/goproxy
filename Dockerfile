FROM goproxy/goproxy:latest AS build

FROM alpine:latest
COPY --from=build /goproxy /goproxy 
ENV PORT=8081
RUN apk add --no-cache -U git mercurial subversion bzr fossil
RUN mkdir -m 777 /go
CMD /goproxy
