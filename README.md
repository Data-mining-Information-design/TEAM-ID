# TEAM-ID

### 팀원 정보
+ 팀장 : 오재호
+ 팀원 : 최수지
+ 팀원 : 권동형
+ 팀원 : 김종민
+ 팀원 : 구현주

#### 데이터 수집_최수지 제안
외부적 요인
- [x] 경제 성장율
- [x] 환율
- [x] 금리 [한국은행 기준금리 / 미국연방준비은행 기준금리]
- [ ] 물가상승률 [수출입물가지수(한국, 미국, ???)]
- [ ] 유가 [기준점 정리 필요]
- [x] 시장지배율(점유율)증감

내부적 요인1_실적
- 현재 재무제표 수집 관련 정리중 (별도 재무제표/연결 재무제표 관련 sk계열사 조사) => 데이터셋 수집 일시정지
- [ ] 실적(전년분기대비/전년대비년간)
- [ ] 매출증감
- [ ] 영업이익증감
- [ ] (PER)
- [ ] 자기자본이익율(ROE) 증감
- [ ] 총자산순이익율(ROA) 증감
- [ ] 배당성향

내부적 요인2_계획(기업설명회 등을 통한)  
=> 네이버 뉴스 api(인당, 일당, 월당 api 호출 횟수 제한 및 내용 최대 3줄 긁어오기 가능)를 사용하여 'sk하이닉스' 키워드를 담은 뉴스 추출  
=> 이후 감성분석[Pos(0)/Neu(0)/Neg(1)] 으로 분류하여 특성 추가 가능  
=> 현재 분석 예정 특성이 많아 시간나면 하고, 안나면 PASS  
- [ ] 언론(뉴스)
