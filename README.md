# valve-pandoc-builder

[![GitHub release](https://img.shields.io/github/release/opsnow-tools/valve-pandoc-builder.svg)](https://github.com/opsnow-tools/valve-pandoc-builder/releases)
[![CircleCI](https://circleci.com/gh/opsnow-tools/valve-pandoc-builder.svg?style=svg)](https://circleci.com/gh/opsnow-tools/valve-pandoc-builder)

[![DockerHub Badge](http://dockeri.co/image/opsnowtools/valve-pandoc-builder)](https://hub.docker.com/r/opsnowtools/valve-pandoc-builder/)

valve-pandoc-builder 는 젠킨스에서 젠킨스 슬레이브가 단위 작업에 사용할 컨테이너 이미지를 제공합니다.
node를 베이스 이미지로 사용하여 pandoc을 설치해 최종 이미지를 제공합니다.
설치되는 주요 도구는 아래와 같습니다.

## tools
```
ENV pandoc 2.8
```

## docket image
최종적으로 만들어진 이미지는 도커허브에 업로드 됩니다.
```bash
docker pull opsnowtools/valve-pandoc-builder
```

## Jenkinsfile
마크다운 문서를 html 문서로 변환하기 위해서 젠킨스파일을 다음과 같이 설정할 수 있습니다.
```
...

podTemplate(label: label, containers: [
  containerTemplate(name: "pandoc-builder", image: "opsnowtools/valve-pandoc-builder:v0.1.1", command: "cat", ttyEnabled: true, alwaysPullImage: true)
], volumes: [
  hostPathVolume(mountPath: "/var/run/docker.sock", hostPath: "/var/run/docker.sock")
]) {
    ...
    stage("Precompile") {
      container("pandoc-builder") {
        ...
      }
    }
    ...
}
```