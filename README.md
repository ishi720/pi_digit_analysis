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
小数部分の長さ: 100000
数字の出現回数:
0: 9999
1: 10137
2: 9908
3: 10025
4: 9971
5: 10026
6: 10028
7: 10026
8: 9978
9: 9902
```

<img width="605" height="434" alt="Digit Distribution of π" src="https://github.com/ishi720/pi_digit_analysis/blob/main/bar_chart.png" />

<img width="605" height="434" alt="Digit Distribution of π" src="https://github.com/ishi720/pi_digit_analysis/blob/main/line_chart.png" />

### 連続する2桁の集計
```
2桁ペアの出現回数:
00: 998  01: 1027  02: 962  03: 993  04: 968  05: 1007  06: 1009  07: 1017  08: 1001  09: 1017
10: 1042  11: 1034  12: 992  13: 1010  14: 1030  15: 971  16: 982  17: 1008  18: 1044  19: 1024
20: 974  21: 1064  22: 971  23: 966  24: 943  25: 1003  26: 1048  27: 1017  28: 955  29: 967
30: 979  31: 974  32: 994  33: 1008  34: 1041  35: 1075  36: 965  37: 1009  38: 982  39: 998
40: 1020  41: 1001  42: 987  43: 1014  44: 971  45: 962  46: 1032  47: 1009  48: 975  49: 1000
50: 966  51: 966  52: 1029  53: 1031  54: 1019  55: 1015  56: 1017  57: 1004  58: 1008  59: 971
60: 1054  61: 1012  62: 1048  63: 997  64: 1020  65: 998  66: 953  67: 972  68: 949  69: 1025
70: 948  71: 1046  72: 981  73: 1031  74: 945  75: 961  76: 1100  77: 1012  78: 1040  79: 961
80: 1011  81: 996  82: 992  83: 946  84: 1001  85: 1020  86: 970  87: 1044  88: 1027  89: 971
90: 1007  91: 1016  92: 952  93: 1029  94: 1033  95: 1014  96: 952  97: 934  98: 997  99: 968
```


<img width="605" height="434" alt="Digit Distribution of π" src="https://github.com/ishi720/pi_digit_analysis/blob/main/pair_bar_chart.png" />

<img width="605" height="434" alt="Digit Distribution of π" src="https://github.com/ishi720/pi_digit_analysis/blob/main/pair_heatmap.png" />
