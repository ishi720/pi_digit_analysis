using Printf
using Plots
using HypothesisTests

# 任意精度設定
setprecision(BigFloat, 100010)  # 小数10万桁＋少し余裕
pi_big = BigFloat(π)

# 小数部分を文字列として取得
pi_str = string(pi_big)[3:end]  # "3." を除く
println("小数部分の長さ: ", length(pi_str))

# 0～9 の出現回数をカウント
counts = Dict(digit => 0 for digit in '0':'9')
for c in pi_str
    counts[c] += 1
end

println("数字の出現回数:")
for d in '0':'9'
    println(d, ": ", counts[d])
end

# カイ二乗検定で均等性チェック
observed = [counts[c] for c in '0':'9']
theta0 = fill(1/10, 10)  # 各数字の理論上の確率（合計1）
chi_test = ChisqTest(observed, theta0)
println("\nカイ二乗検定結果:")
println(chi_test)

# 可視化（棒グラフ）
bar(string.('0':'9'), observed,
    title="Digit Distribution of π (100,000 digits)",
    xlabel="Digit", ylabel="Count",
    legend=false)