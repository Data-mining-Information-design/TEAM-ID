# TEAM-ID

### 기간 : 2021.04~2021.06
### Participant[ML/DL]
+ Team Leader : 오재호
+ Team Member : 최수지
+ Team Member : 김종민

## Code Explain
1. modeling / 0401~hynix_xgboost.ipynb : XGBoost 방식으로 Grid Search을 통한 삼성전자 주가 예측 진행 코드입니다.
2. modeling / 0401~samsung_basyian_xgboost.ipynb : XGBoost 방식으로 Bayesian Optimization을 통한 삼성전자 주가 예측 진행 코드입니다.
3. modeling / CNN.ipynb : Convolutional Neural Network 방식으로 SK하이닉스&삼성전자 주가 예측 진행 코드입니다.
4. modeling / LDA.ipynb : Linear Discriminant Analysis 방식으로 SK하이닉스&삼성전자 주가 예측 진행 코드입니다.
5. modeling / MTL.ipynb : Multi-Task Learning 방식으로 SK하이닉스&삼성전자 주가 예측 진행 코드입니다.
6. modeling / automl75_py.ipynb : AutoML으로 SK하이닉스&삼성전자 주가 예측 진행 코드입니다. (Jupyter Notebook Error Occur / Colab Recommend)
7. modeling / baseline_modeling.ipynb : Logistic Regression 방식으로 SK하이닉스&삼성전자 주가 예측 진행 코드입니다.
8. modeling / hinix_xgboost.ipynb : NAN
9. modeling / hynix_basyian_xgboost.ipynb : XGBoost 방식으로 Bayesian Optimization을 통한 SK하이닉스 주가 예측 진행 코드입니다.
10. modeling / hynix_xgboost_fin.ipynb : XGBoost 방식으로 Grid Search을 통한 SK하이닉스&삼성전자 주가 예측 진행 코드입니다.
11. modeling / ridgeClassifier.ipynb : Ridge Classifier 방식으로 SK하이닉스&삼성전자 주가 예측 진행 코드입니다.
12. modeling / shynix_basyian_xgboost.ipynb,shynix_xgboost.ipynb,shynix_xgboost_fin.ipynb : NAN
13. modeling / sk_hynix_LSTM.ipynb : RNN(양방향 LSTM) 방식으로 SK하이닉스&삼성전자 주가 예측 진행 코드입니다. 

<br></br>
### Data Collection
전체 데이터
- [x] SK하이닉스 주가
- [x] 삼성 주가(반도체 업종간 비교 데이터셋)

외부적 요인
- [x] 경제 성장율
- [x] 유가
- [x] 환율
- [x] 금리 [한국은행 기준금리 / 미국연방준비은행 기준금리 / 시장금리]
- [x] 물가상승률 [수출입물가지수(한국)]
- [x] 시장지배율(점유율)증감
- [x] 코스피 전체 데이터/코스닥 전체 데이터
- [x] 반도체수출금액지수
- [x] 필라델피아 반도체 지수
- [x] 비트코인 종가/변동률
- [x] S&P 500 데이터 

내부적 요인1_실적(전년분기대비/전년대비년간)
- [x] 매출 _증감
- [x] 영업이익 _증감
- [x] 단기순이익 _증감
- [x] 주가수익률(PER) _증감
- [x] 자기자본이익율(ROE) _증감
- [x] 총자산순이익율(ROA) _증감
- [x] 배당성향
