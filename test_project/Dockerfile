FROM dart:stable AS build

WORKDIR /app
COPY . .

RUN dart pub get
RUN dart pub global activate dart_frog_cli

ENV PATH="$PATH:/root/.pub-cache/bin"

RUN dart_frog build
RUN dart compile exe build/bin/server.dart -o /app/server

FROM scratch

ENV PORT=8080

COPY --from=build /runtime/ /
COPY --from=build /app/server /app/server

EXPOSE $PORT
CMD ["/app/server"]
