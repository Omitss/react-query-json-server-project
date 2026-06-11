docker build -t my-jenkins .

docker run -d --name jenkins -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home -v //var/run/docker.sock:/var/run/docker.sock my-jenkins

컨테이너 ID(Container ID : 975d4169b68e1c7ea93350e71b1dbb94a895b7e485155d76439d1856b95dc2ff
초기 키 값 : 7b4c50d6408545e480b31e2e5b63bddf

[Jenkins 완전 삭제 → 캐시 정리 → 재설치]
:: Jenkins 컨테이너 삭제
docker rm -f jenkins
:: Jenkins 이미지 삭제
docker rmi my-jenkins
docker rmi jenkins/jenkins:lts-jdk17
:: Jenkins 볼륨 삭제
docker volume rm jenkins_home
:: 사용하지 않는 컨테이너, 이미지, 네트워크, 볼륨, 캐시 삭제
docker system prune -a -f --volumes
:: Docker 빌드 캐시 삭제
docker builder prune -a -f
:: Dockerfile 재빌드
docker build --no-cache -t my-jenkins .
:: Jenkins 재실행
docker run -d --name jenkins -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home my-jenkins
:: Jenkins 상태 확인
docker ps
:: 초기 관리자 비밀번호 확인
docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword
