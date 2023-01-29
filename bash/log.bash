#!/bin/bash

function Log_function {		
SEARCH="|DRMO0000\|DXMO00000|\|9999999|"	# 찾을 파일명
cd /~	# 경로 지정
ls log.2022-10-??-??|sort|xargs cat|grep "${SEARCH}"|	# 로그 파일들의 파일명 날짜를 정렬(ASC)하여 특정 SVC_CD나 USER_ID를 지정 
awk -F "|" '{ gsub("null_",""); print $1,"|"$7,"|"$2,"|"$3,"|"$4,"|"$6,"|"$5,"|"$8,"|"$9,"|"$10,"|"$11,"|"$12}'|
sed '/null/d'|sed 's/\s*\(|\)\s*/\1/g' > /logs/운영서버/파일명-$(date -d '1 day ago' '+%Y-%m-%d').txt
#서버ID의 null_, 각|마다 생기는 공백 제거, 칼럼순서 (인덱스 고려하여) 변경
scp -rp /logs/운영서버/파일명-$(date -d '1 day ago' '+%Y-%m-%d').txt oracle@#오라클 주소:/DB팀 요청 주소.txt		
# scp를 통해 DB팀에서 요청한 주소로 전송
}

log_function "log Function"
