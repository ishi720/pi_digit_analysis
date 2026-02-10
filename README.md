# Pi Digit Analysis

円周率(π)の小数部分に現れる数字(0〜9)の出現頻度を集計し、均等に分布しているかをカイ二乗検定で検証するプログラムです。

## 概要

- Juliaの任意精度演算(`BigFloat`)を使い、πの小数点以下 最大10万桁 を取得
- 各数字(0〜9)の出現回数をカウント
- カイ二乗検定(χ²検定)で均等分布かどうかを統計的に検証
- 棒グラフで出現頻度を可視化

## 必要環境

- [Julia](https://julialang.org/) 1.6 以上
- パッケージ: `Plots`, `HypothesisTests`

## セットアップ

```bash
julia --project=. -e 'using Pkg; Pkg.instantiate()'
```

## 実行方法

```bash
julia --project=. pi_digit_analysis.jl
```

## 出力例

```
小数部分の長さ: 30107
数字の出現回数:
0: 3006
1: 3060
2: 2907
3: 2987
4: 3068
5: 3061
6: 3021
7: 2986
8: 2988
9: 3023
```

<img width="605" height="434" alt="Digit Distribution of π" src="https://github.com/ishi720/pi_digit_analysis/blob/main/bar_chart.png" />

<img width="605" height="434" alt="Digit Distribution of π" src="https://github.com/ishi720/pi_digit_analysis/blob/main/line_chart.png" />
