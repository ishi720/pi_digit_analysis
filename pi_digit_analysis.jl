using Printf
using Plots
using HypothesisTests

# 任意精度設定
setprecision(BigFloat, 100000)
pi_big = BigFloat(π)

# 小数部分を文字列として取得
pi_str = string(pi_big)[3:end]  # 整数部分を除去
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
savefig("bar_chart.png")

# 可視化（折れ線グラフ：桁数 vs 累積カウント）
n = length(pi_str)
cumcounts = zeros(Int, n, 10)  # 各桁時点での累積カウント
running = zeros(Int, 10)
for i in 1:n
    d = pi_str[i] - '0'  # 0〜9 の整数に変換
    running[d+1] += 1
    cumcounts[i, :] .= running
end

plot(1:n, cumcounts,
    title="Cumulative Digit Count of π",
    xlabel="Number of digits",
    ylabel="Count",
    label=reshape(string.(0:9), 1, 10),
    legend=:topleft,
    size=(800, 500))
savefig("line_chart.png")

# === 2桁ペアの集計 ===
# 隣接する2桁をスライディングウィンドウで取得 (14,41,15,59,...)
pairs = [pi_str[i:i+1] for i in 1:length(pi_str)-1]

# 00〜99 の出現回数をカウント
pair_counts = Dict(lpad(i, 2, '0') => 0 for i in 0:99)
for p in pairs
    pair_counts[p] += 1
end

# 出現回数の表示
println("\n2桁ペアの出現回数:")
for i in 0:99
    key = lpad(i, 2, '0')
    @printf("%s: %d  ", key, pair_counts[key])
    (i + 1) % 10 == 0 && println()
end

# カイ二乗検定（2桁ペア）
pair_labels = [lpad(i, 2, '0') for i in 0:99]
pair_observed = [pair_counts[k] for k in pair_labels]
pair_theta = fill(1/100, 100)
pair_chi_test = ChisqTest(pair_observed, pair_theta)
println("\n2桁ペアのカイ二乗検定結果:")
println(pair_chi_test)

# 可視化（2桁ペアのヒートマップ）
heatmap_data = reshape(pair_observed, 10, 10)  # 行:十の位, 列:一の位
heatmap(string.(0:9), string.(0:9), heatmap_data,
    title="2-Digit Pair Frequency of π",
    xlabel="Second digit",
    ylabel="First digit",
    color=:viridis,
    size=(600, 500))
savefig("pair_heatmap.png")

# 可視化（2桁ペアの棒グラフ）
bar(pair_labels, pair_observed,
    title="2-Digit Pair Distribution of π",
    xlabel="Pair", ylabel="Count",
    legend=false,
    xticks=(1:5:100, pair_labels[1:5:100]),
    xrotation=45,
    size=(1000, 500))
savefig("pair_bar_chart.png")