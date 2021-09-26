# 応力

この節では，弾性体の変形をもたらす力である **応力** について学習します．
変形を表すひずみが単一の量でなく6つの独立成分を持つテンソルであったように，応力もまたテンソル量として表されることと，その意味を学びます．

## 応力・トラクションとその定義

いきなりですが，連続体（弾性体）に働きうる力には，2種類があります．

```{margin}
質量 $m$ に対して $mg$ ではないのかと思うかもしれません．
しかし，連続体では質量が連続的に分布しているので，「ある点」の重さ $m$ ではなく，空間平均の密度 $\rho$ が用いられます．同じ理由で，実体力は「単位体積あたりの力」で表現するほうが適切なのです．
```
ひとつは **実体力（体積力; body force）** と呼ばれるもので，弾性体の内部の任意の点に働く外部からの力です．
実体力のわかりやすい例としては， **重力** があります．
地球上にあるかぎり，弾性体のあらゆる点には $g$ だけの重力加速度がかかっているため，微小体積 $dV$ にはその場の**質量密度** $\rho$ を用いて $\rho \times g \times dV$ だけの実体力がかかります．

もうひとつは， **面力（surface force）** とよばれる力です．
弾性体は，たとえ全体としては静止していても，物体の **内部** にはさまざまな力がかかり，それが総体として釣り合っています．
たとえば，{numref}` Fig. {number} <fig-internal-force>`のように，一本の棒を左右に張力 $T$ で引っ張ることを考えましょう．
この棒は静止して（壊れることなく）釣り合っているものとします．
では，その棒を **仮想的に** どこかで2つに切り離してみたらどうでしょうか．
棒は左右に引っ張られているのですから，もしその仮想的な断面にまったく力がかかっていなかったら，棒は2つに別れて左右に飛んでいってしまうことでしょう．
そうならず，棒が棒として形を保っているということは，その仮想的な断面をまたいで両側に離れまいとする力が働いているのです．
このように，物体を仮想的に切断したときに現れる，物体内部で働く力を特に **内力** といいます．
一方，それと区別して実体力のことを **外力** ということもあります．


```{figure} ./fig/internal_force.png
:align: center
:width: 80%
:name: fig-internal-force

内力を理解するための思考実験．(a)弾性体の棒の両端に  $T$  の張力がかかっている．中心の点線は仮想的な切断面．(b)仮想切断面の左側とそこにかかる力．(c)仮想切断面の右側とそこにかかる力．
```

ほかにも，たとえば水中の物体には**圧力**（水圧；{numref}`Fig. {number} <fig-waterpressure>`）がかかります．これも（水とその内側の物体を一連の系とみなしたときの）内力のひとつです．水圧はつねに物体表面に垂直に，同じ深さであれば同じ大きさの力が働きます．つまり，同じ深さでも，物体表面の無向きが変わると，その面に対してかかる力の向きが変わってしまうのです．

```{figure} ./fig/waterpressure.png
:align: center
:width: 40%
:name: fig-waterpressure

水中の円形物体にかかる水圧 $p$ の模式図．本来は水圧は深さによって異なり，物体上辺と下辺ではその大きさが僅かにことなる（その差の分物体は**浮力**を受ける）が，ここでは便宜上その違いを省略している．
```


このように，内力である面力は，どのように仮想的な面をとるかによってその力の向きや大きさが変わってきます．
弾性体棒の例に戻って，こんどは，{numref}` Fig. {number} <fig-internal-force2>`のように（もちろん仮想的に）斜めに切ったらどうでしょうか．
外力は同じですから，面には全体として左右に引っ張り合うような力が働きます．しかし，それは面に対しては斜めに働いているのです．
つまりこの内力は，面に垂直な成分と，面を横滑りさせるような成分とに分解できます．先程の垂直断面のときとは違いますね．
このように，内力とは **物体に仮想的な面を考えたとき，面にかかる力** です．
その力は，**面のとり方によって異な**ります．


```{figure} ./fig/internal_force2.png
:align: center
:name: fig-internal-force2
:width: 80%

仮想面の方向に応じて変化する内力の模式図．
```


```{margin}
この図はいかにも弾性体ひとかたまりを取ってきた表面のように見えるかもしれませんが，そうではありません．弾性体の内部一部をくり抜いた物体の表面だと思ってください．
```
いま，{numref}` Fig. {number} <fig_katamari>`のように，弾性体のある領域の面の一部分の微小な面積要素 $dS$ を取ってきて，そこに働く力全体を $\boldsymbol{F}$ としましょう．
これまでの議論と同じように，この力 $\boldsymbol{F}$ は，面の向きによって変わります．
それを数学的に表現するためには，まず「面の向き」の表現が必要ですね．そこで，**法線ベクトル** $\hat{\boldsymbol{n}}$ の出番です．法線ベクトルは，ある微小な面要素に垂直な方向をもち，大きさが$1$のベクトルです．

```{figure} ./fig/SurfaceForce.png
:align: center
:width: 60%
:name: fig_katamari

弾性体の塊（体積 $V$ ）と，その面要素 $dS$ に働く力 $\boldsymbol{F}$ の模式図． $\hat{\boldsymbol{n}}$ は要素 $dS$ の法線ベクトルである．
```

```{margin}
ベクトル $n$ の上についている記号 `^` は **ハット(hat)** といいます．本書では，ハット記号は長さが1の単位ベクトルの印として用います．
```
逆に，あるベクトル $\hat{\boldsymbol{n}}$ に垂直な面は，たった1つに定まります．
力 $\boldsymbol{F}$ は，面の向き $\hat{\boldsymbol{n}}$ と面の面積 $dS$ に依存する量なのです．
ですが，面力をモデル化するときに，いちいち有限のサイズ $dS$ を扱うのは厄介です．
$dS$ のサイズが変わると， $\boldsymbol{F}$ も変わってしまいます．
```{margin}
表面力という言葉を，このような「面積あたりの表面力」をもって定義するテキストもあります．
```
そこで，面のサイズで規格化をします．
**トラクション（Traction）** $\boldsymbol{T}^{(\hat{\boldsymbol{n}})}$ という量を，
```{math}
:label: 
\begin{align}
  \boldsymbol{T}^{(\hat{\boldsymbol{n}})} \equiv \lim_{dS\rightarrow 0} \frac{\boldsymbol{F}}{dS}
\end{align}
```
で定義します．

これは要するに面積あたりの力なのですが，十分に小さな面要素 $dS \rightarrow 0$ の極限をとっている特徴があります．
一見面が複雑な形をしていても，その凸凹のスケールよりも小さな面積 $dS$ の極限をとれば，面は平らな正方形で近似できます．つまり，面の形状は考えず，方向だけを指定すればすむのです．
トラクションの単位は面積あたりの力なので，SI単位系で N/m ${}^2$ をとります．圧力と同じ（圧力はトラクションの一種）です．



```{margin}
同じ弾性体力学でも，分野によって定義が異なる場合があります．
```
ところで，トラクションは向きも重要です．
ここでは， トラクションを法線ベクトル $\hat{\boldsymbol{n}}$ の向きの反対側から正の側に向かう力を正と定義します．つまり，ある面の法線ベクトルの方向（外向き）に膨張する力を正に取るということです．

ところで，1つの面要素に対して，それに垂直な法線ベクトルは面の表側と裏側の2つありえます．表側の面の法線ベクトルを $\hat{\boldsymbol{n}}$ とすると，裏側の面の法線ベクトルは符号を反転して $-\hat{\boldsymbol{n}}$ です．
トラクションは向きをもったベクトルで，法線ベクトルとの関係で方向を定めるのですから，面の向きの正負によって，その力の符号が変化します．具体的には，
```{math}
:label: 
\begin{align}
  \boldsymbol{T}^{(-\hat{\boldsymbol{n}})} = -  \boldsymbol{T}^{(\hat{\boldsymbol{n}})}
\end{align}
```
です．



トラクションの例としては， **圧力** がイメージしやすいでしょう．
圧力は「面」に垂直に働く力で，その単位は（力/面積）だ．圧力は面の外側から内側に向かう力なので，物質表面に働く圧力 $p$ は，トラクションの符号としては $\boldsymbol{T}^{(\hat{\boldsymbol{n}})} = -p \hat{\boldsymbol{n}}$ のようにマイナスが付きます．

粘性のない水（流体）の中であれば，圧力は常に面に垂直な方向しかとりません．
しかし，固体中の面力はもうすこし複雑です．
面力の大きな特徴は， **力が面積要素の向きに依存する** ということでした．
このことを，弾性体内部の小さな立方体を取り出すことによって考えましょう（{numref}` Fig. {number} <fig_bunkai>`）．
% 
 $x_1$ ,  $x_2$ ,  $x_3$ それぞれの方向に法線を持つ面（ $x_2$ -- $x_3$ 面,  $x_1$ -- $x_3$ 面,  $x_1$ -- $x_2$ 面）に対して，トラクション $\boldsymbol{T}^{(\hat{\boldsymbol{n}}_1)}$ ,  $\boldsymbol{T}^{(\hat{\boldsymbol{n}}_2)}$ ,  $\boldsymbol{T}^{(\hat{\boldsymbol{n}}_3)}$ がかかります．
 ただし，
```{math}
:label: eq:normalvector_definition
\begin{align}
\hat{\boldsymbol{n}}_1 = \begin{pmatrix} 1\\0\\0  \end{pmatrix}, \quad 
\hat{\boldsymbol{n}}_2 = \begin{pmatrix} 0\\1\\0  \end{pmatrix}, \quad 
\hat{\boldsymbol{n}}_3 = \begin{pmatrix} 0\\0\\1  \end{pmatrix} 
\end{align}
```
は各軸方向の法線ベクトルです．

```{figure} ./fig/Traction.png
:align: center
:width: 80%
:name: fig_bunkai

弾性体内の微小立体要素に働く力 $\boldsymbol{T}^{(\hat{\boldsymbol{n}}_1)}$ ,  $\boldsymbol{T}^{(\hat{\boldsymbol{n}}_2)}$ ,  $\boldsymbol{T}^{(\hat{\boldsymbol{n}}_3)}$ とその成分．
```

水（完全流体）中の圧力であれば，面にかかるトラクションは常に面の法線方向に並行ですが，弾性体内の力は「ねじれ」を許容するため，それ以外の方向にも力がかかり得ます．
トラクションはベクトルですので，たとえば図中の $\boldsymbol{T}^{(\hat{\boldsymbol{n}}_2)}$ は，
```{math}
:label: 
\begin{align}
  \boldsymbol{T}^{(\hat{\boldsymbol{n}}_2)} = \begin{pmatrix} {T}^{(\hat{\boldsymbol{n}}_2)}_1\\ {T}^{(\hat{\boldsymbol{n}}_2)}_2\\ {T}^{(\hat{\boldsymbol{n}}_2)}_3\end{pmatrix}
\end{align}
```
のような3つの成分を持っています．
ということは，（トラクションベクトル $3$ つ） $\times$ （トラクションの成分 $3$ つ） $=9$ 成分があれば，ここにかかる力がすべて記述できます．そこで，それらの力を行列のように
```{math}
:label: 
\begin{align}
  \boldsymbol{\sigma} \equiv
  \left(
  \begin{matrix}
    \sigma_{11} & \sigma_{12} & \sigma_{13} \\
    \sigma_{21} & \sigma_{22} & \sigma_{23} \\
    \sigma_{31} & \sigma_{32} & \sigma_{33} \\
  \end{matrix}
  \right)
  =
  \left(
  \begin{matrix}
    T^{(\hat{\boldsymbol{n}}_1)}_1 &     T^{(\hat{\boldsymbol{n}}_2)}_1 &     T^{(\hat{\boldsymbol{n}}_3)}_1 \\ 
    T^{(\hat{\boldsymbol{n}}_1)}_2 &     T^{(\hat{\boldsymbol{n}}_2)}_2 &     T^{(\hat{\boldsymbol{n}}_3)}_2 \\ 
    T^{(\hat{\boldsymbol{n}}_1)}_3 &     T^{(\hat{\boldsymbol{n}}_2)}_3 &     T^{(\hat{\boldsymbol{n}}_3)}_3 \\ 
  \end{matrix}
  \right)
\end{align}
```
とまとめて表記しましょう．これを **応力テンソル** と呼びます．
```{margin}
ギリシャ文字 $\sigma$ ではなく $\tau$ や英文字 $s$ ,  $t$ を使う場合もあります．
```
 $\sigma_{ij}$ の意味は，「 $j$ 番目の軸に法線を持つ面にかかるトラクションの $i$ 成分 」です．
```{margin}
教科書によっては，応力テンソルの $i$ と $j$ の順番が逆転していたり，1つ目と2つ目の添字の意味が逆転していたり，いろいろのようだ．だが，このあとに示す応力テンソルの対称性によって，それらは実は「どっちでもいい」ことになります．
```
これらのうち， $\sigma_{11}$ ,  $\sigma_{22}$ ,  $\sigma_{33}$ を **法線応力（normal stress）** ，残りの $\sigma_{23}$ ,  $\sigma_{13}$ ,  $\sigma_{12}$ を **剪断応力（shear stress）** と呼んで区別することがあります．これらの名前の付け方はひずみテンソルと同じで，法線応力は物体を膨張・圧縮させようとする力に，剪断応力はねじれの力にそれぞれ相当します．
{numref}` Fig. {number} <fig_stress_12>`に， $x_1$ - $x_2$ 面内の微小四角形の辺に働く応力テンソルの成分を示しました．
{numref}` Fig. {number} <fig_bunkai>`では表現の都合上法線が座標軸正の方向を向いた面の応力（トラクション）しか表示していませんでしたが，実際には反対側の面にも（法線方向が反対なので）逆方向の力がかかります．
したがって，法線応力は全体として（符号がプラスの場合には）物質を膨張させる張力なのです．

```{figure} ./fig/stress_12.png
:align: center
:width: 60%
:name: fig_stress_12

弾性体内の $x_1$ - $x_2$ 面内の微小要素に働く応力テンソルの成分．
```


## 応力テンソルの特徴

応力テンソルの重要な特徴を2つ挙げておきます．
ひとつめは， **応力テンソルは対称テンソルである** ことです．
```{math}
:label: 
\begin{align}
  \sigma_{ij} = \sigma_{ji}
\end{align}
```
```{margin}
より厳密には，角運動量の保存則を考える必要があります．ここでは簡略化された説明をしています．
```
この条件は，弾性体全体が回転しないという条件から導かれます．
{numref}` Fig. {number} <fig_stress_symmetry>`に $x_1$ -- $x_2$ 平面内の微小正方形にかかる応力テンソルを示しました．
媒質全体が回転しないためには，明らかに
```{math}
:label: 
\begin{align}
  \sigma_{12} = \sigma_{21}
\end{align}
```
でなければなりませんね．
```{margin}
ひずみの定義で，回転成分をのぞいた真の変形だけを取り扱うことにしたのでした．
```
 $\sigma_{13} = \sigma_{31}$ ,  $\sigma_{23}=\sigma_{32}$ の対称性も同様に導かれます．

```{figure} ./fig/stress_symmetry.png
:align: center
:width: 60%
:name: fig_stress_symmetry

応力テンソルの対称性． $12$ 平面の（微小）正方形にかかる応力テンソルのうち剪断応力テンソル成分を矢印で示す．
```

応力テンソルが対称テンソルであることから， $\sigma_{12} = \sigma_{21}$ ,  $\sigma_{13} = \sigma_{31}$ ,  $\sigma_{23} = \sigma_{32}$ です．
よって，応力テンソルの独立な成分は6つです．

もうひとつの特徴は，任意の方向の面（法線ベクトル $\hat{\boldsymbol{n}}$ ）のトラクション $ \boldsymbol{T}^{(\hat{\boldsymbol{n}})}$ が，応力テンソルから
```{math}
:label: eq:Cauchy-relation
\begin{align}
  T_i^{(\hat{\boldsymbol{n}})}= \sum_{j=1}^3 \sigma_{ij} \hat{n}_j
\end{align}
```
で求められるということです．
これは **コーシー（Cauchy）の関係式** と呼ばれる法則です．
コーシーの関係式はたいへん強力で， **応力テンソルの6つの独立な成分さえわかれば，弾性体内に働くあらゆる方向のトラクションを知ることができる** ということを意味しています．

この関係式は，釣り合いの状態にある微小三角錐（あるいは2次元であれば三角形）のトラクションを考察することで導出できます．
ここでは簡単のため，ふたたび2次元の $x_1$ -- $x_2$ 平面だけを考えましょう．

まず，{numref}` Fig. {number} <fig_stress_equi>`のように， $x_1$ -- $x_2$ 平面における微小三角形に働く力を考えます．

三角形の2辺はそれぞれ $x_1$ 軸と $x_2$ 軸に平行でその長さを $dx_1$ と $dx_2$ ，もう1つの辺は長さ $d\ell$ で，その辺（3次元なら面）の法線ベクトルを $\hat{\boldsymbol{n}}$ ，そこに働くトラクションベクトルを $\boldsymbol{T}^{(\hat{\boldsymbol{n}})}=(T_1, T_2)$ とします．
残りの2つの面に働くトラクションベクトルの成分は，定義により{numref}` Fig. {number} <fig_stress_equi>` にある応力テンソル成分で表現できます．

```{figure} ./fig/Equillibrium.png
:align: center
:width: 80%
:name: fig_stress_equi

2次元 $12$ 平面内における微小三角形に働く力の釣り合い．
```

それでは， $x_1$ 方向と $x_2$ 方向それぞれの力の釣り合いを考えましょう．
面に働く力はトラクションベクトルにその面の面積（この場合は2次元なので辺の長さ）を乗じたものですから， $x_1$ ,  $x_2$ 方向それぞれについて，
```{math}
:label: eq:traction-tsuriai
\begin{align}
  \begin{split}
  & T_1 d\ell = \sigma_{11} dx_2 + \sigma_{12} dx_1 \\
  & T_2 d\ell = \sigma_{21} dx_2 + \sigma_{22} dx_1 = \sigma_{12} dx_2 + \sigma_{22} dx_1 
\end{split}
\end{align}
```
です．
ただし，第2式では応力テンソルの対称性 $\sigma_{12} = \sigma_{21}$ を用いました．

ところで，辺 $d \ell$ の法線ベクトルと $x_1$ 軸のなす角を $\theta$ とすると， $\hat{n}_1 = \cos \theta$ ,  $\hat{n}_2 = \sin \theta$ です．
一方，辺 $d \ell$ と $x_2$ 軸のなす角も $\theta$ ですから，
```{math}
:label: eq:kitei-kankei
\begin{align}
  \begin{split}
    &dx_2 = d\ell \cos \theta = d\ell \hat{n}_1 \\
    &dx_1= d\ell \sin \theta = d\ell \hat{n}_2 \\
  \end{split}
\end{align}
```
の関係があります．{eq}`eq:kitei-kankei`式を{eq}`eq:traction-tsuriai`に代入して整理すると，
```{math}
:label: eq:traction_represent
\begin{align}
  \begin{split}
    & T_1 = \sigma_{11} \hat{n}_1 + \sigma_{12} \hat{n}_2\\
    & T_2 = \sigma_{12} \hat{n}_1 + \sigma_{22} \hat{n}_2\\
  \end{split}
\end{align}
```
が得られました．行列（テンソル）とベクトルの積の形で書くと，
```{math}
:label: 
\begin{align}
\begin{split}
  \boldsymbol{T}^{(\hat{\boldsymbol{n}})} =
  \left( \begin{matrix} T_1 \\ T_2 \end{matrix} \right)
  =
  \left(
    \begin{matrix} \sigma_{11} & \sigma_{12} \\ \sigma_{12} & \sigma_{22} \end{matrix}
  \right)
  \left( \begin{matrix} \hat{n}_1 \\ \hat{n}_2 \end{matrix} \right)
  = \boldsymbol{\sigma} \hat{\boldsymbol{n}}
\end{split}
\end{align}
```
となり，たしかにコーシーの関係式（の2次元版）が成立していることが証明できました．

3次元の場合は，三角形の代わりに三角錐（すい）を用いて考察することになります．
煩雑ですが，考え方は2次元と同じでそれほど難しくはありません．
興味があれば他の弾性体力学の教科書を参照してください．


````{admonition} 演習問題：コーシーの関係式
:class: dropdown
  式{eq}`eq:kitei-kankei`と{eq}`eq:traction-tsuriai`から，コーシーの関係式{eq}`eq:traction_represent`を導出されることを計算して確かめなさい．
````

````{admonition} 演習問題：応力テンソルとトラクション
:class: dropdown
  2次元 $x_1$ -- $x_2$ 平面内の応力テンソルが
  \begin{align*}
    \boldsymbol{\sigma} =
    \left(
    \begin{matrix}
      \sigma_{11} & \sigma_{12} \\
      \sigma_{12} & \sigma_{22}
    \end{matrix}
    \right)
    = \left( \begin{matrix}
      -40 & -10 \\ -10  & -50 
    \end{matrix}\right) \text{MPa}
  \end{align*}
  であるときに，以下の法線応力で与えられる面にかかるトラクションベクトルを求めなさい：
  \begin{align*}
    \hat{\boldsymbol{n}}_1 = \left( \begin{matrix} 1/\sqrt{2} \\ 1/\sqrt{2} \end{matrix} \right),
    \quad
    \hat{\boldsymbol{n}}_2 = \left( \begin{matrix} 1/\sqrt{2} \\ - 1/\sqrt{2} \end{matrix} \right),
  \end{align*}
  （注）1MPa =  $10^6$  Pa．
````

