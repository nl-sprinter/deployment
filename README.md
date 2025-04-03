# Sprinter 배포용 브랜치

* 최신 submodule 코드 가져오기  
git submodule update --remote  


* 도커 데이터 삭제 루틴  
1. 실행중인 모든 컨테이너 종료: docker stop $(docker ps -q)  
2. 모든 컨테이너 삭제: docker rm $(docker ps -aq)  
3. 모든 도커 이미지 삭제: docker rmi $(docker images -q) -f  
4. 사용되지 않는 볼륨 삭제: docker volume rm $(docker volume ls -q)  (DB 데이터 다날아감)  
5. 사용되지 않는 네트워크 삭제: docker network prune -f  
6. docker compose 캐시 삭제: docker-compose down --rmi all --volumes --remove-orphans
