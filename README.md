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

### 数字の出現回数の集計
```
小数部分の長さ: 30103
数字の出現回数:
0: 3006
1: 3060
2: 2907
3: 2986
4: 3068
5: 3059
6: 3021
7: 2986
8: 2988
9: 3022
```

<img width="605" height="434" alt="Digit Distribution of π" src="https://github.com/ishi720/pi_digit_analysis/blob/main/bar_chart.png" />

<img width="605" height="434" alt="Digit Distribution of π" src="https://github.com/ishi720/pi_digit_analysis/blob/main/line_chart.png" />

### 連続する2桁の集計
```
2桁ペアの出現回数:
00: 297  01: 323  02: 296  03: 302  04: 294  05: 277  06: 294  07: 325  08: 286  09: 312
10: 312  11: 305  12: 286  13: 316  14: 330  15: 292  16: 319  17: 290  18: 306  19: 304
20: 274  21: 300  22: 294  23: 312  24: 270  25: 300  26: 298  27: 297  28: 282  29: 280
30: 297  31: 285  32: 281  33: 273  34: 331  35: 323  36: 282  37: 298  38: 289  39: 327
40: 298  41: 331  42: 291  43: 296  44: 275  45: 323  46: 310  47: 318  48: 306  49: 320
50: 288  51: 302  52: 298  53: 297  54: 328  55: 311  56: 312  57: 316  58: 300  59: 307
60: 316  61: 304  62: 309  63: 290  64: 304  65: 317  66: 297  67: 292  68: 292  69: 300
70: 305  71: 311  72: 301  73: 306  74: 285  75: 281  76: 314  77: 288  78: 316  79: 279
80: 304  81: 283  82: 287  83: 289  84: 326  85: 329  86: 295  87: 289  88: 300  89: 285
90: 315  91: 315  92: 264  93: 305  94: 325  95: 306  96: 300  97: 273  98: 311  99: 308
```


<img width="605" height="434" alt="Digit Distribution of π" src="https://github.com/ishi720/pi_digit_analysis/blob/main/pair_bar_chart.png" />

<img width="605" height="434" alt="Digit Distribution of π" src="https://github.com/ishi720/pi_digit_analysis/blob/main/pair_heatmap.png" />
