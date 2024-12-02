# Building the frontend
FROM node:22-alpine3.20 AS frontend-builder

COPY hereismy.space-frontend /frontend

WORKDIR /frontend

RUN npm install
RUN node_modules/.bin/ng build

# Building the server and copying the frontend
FROM alpine:3.20 AS server

WORKDIR /backend

RUN apk update \
  && apk upgrade \
  && apk add --no-cache \
    make \
    clang18 \
    cmake

COPY hereismy.space-backend /backend

RUN CXX=/usr/bin/clang++-18 CC=/usr/bin/clang-18 cmake -B /backend/build -S /backend -DCMAKE_BUILD_TYPE=Release -DUSE_CLANG_TIDY=OFF
RUN cmake --build /backend/build

COPY --from=frontend-builder /frontend/dist/here-is-my-space/browser staticfiles/

USER guest

ENTRYPOINT ["./build/here_is_my_space"]
