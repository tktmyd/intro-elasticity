# 応力

この節では，弾性体の変形をもたらす力である **応力** について学習する．変形を表すひずみが単一の量でなく6つの独立成分を持つテンソルであったように，応力もまたテンソル量として表される．

## 応力・トラクションとその定義

連続体（弾性体）に働きうる力には，二種類があある．
一つは **実体力（体積力; body force）** と呼ばれるもので，弾性体の内部の任意の点に働く外部からの力だ．実体力のなかでわかり易い例としては， **重力** が挙げられる．
地球上にあるかぎり，弾性体のあらゆる点には $g$ だけの重力加速度がかかっているため，微小体積 $dV$ にはその場の質量密度 $\rho$ を用いて $\rho \times g \times dV$ だけの実体力がかかる．
```{margin}
質量 $m$ に対して $mg$ ではないのかと思うかもしれないが，連続体では質量が連続的に分布しているので，「ある点」の重さ $m$ ではなく，空間平均の密度 $\rho$ が用いられ，実体力は「単位体積あたりの力」で表現するほうが適切なのだ．
```

もう一つは， **面力（surface force）** とよばれる力だ．
弾性体は，たとえ全体としては静止していても，物体の **内部** にはさまざまな力がかかり，それが総体として釣り合っている．
たとえば，図{numref}`{number} <fig-internal-force>`のように，一本の棒を左右に張力 $T$ で引っ張ることを考えよう．
この棒は静止して（壊れることなく）釣り合っているものとする．
では，その棒を **仮想的に** どこかで真っ二つに切り離してみたらどうだろうか？
もし，その仮想的な断面にまったく力がかかっていなかったら，棒は2つに別れて左右に飛んでいってしまうだろう．
そうならず，棒が棒として形を保っているということは，その仮想断面をまたいで両側に離れまいとする力が働いているのだ．
このように，物体を仮想的に切断してみたときに現れる，物体内部で働く力を特に **内力** という．一方，それと区別して実体力のことを **外力** ということもある．


```{figure} ./fig/internal_force.png
:align: center
:width: 80%
:name: fig-internal-force

内力を理解するための思考実験．(a)弾性体の棒の両端に  $T$  の張力がかかっている．中心の点線は仮想的な切断面．(b)仮想切断面の左側とそこにかかる力．(c)仮想切断面の右側とそこにかかる力．
```


内力である面力は，どのように仮想的な面をとるかによってその力の向きや大きさが変わってくる．
先の例では，内力は仮想切断面に垂直に働いていた．
では，先の棒を仮想的に2つにわけるときに，図{numref}`{number} <fig-internal-force2>`のように仮想面を斜めに切ったらどうだろうか？
外力は同じだから，面には全体として左右に引っ張り合うような力が働くが，それは面に対して斜めに働いている．
言い換えれば，この内力は面に垂直な成分と，面を横滑りさせるような成分とに分解できるだろう．
このように，内力とは **物体に仮想的な面を考えたときに面にかかる力** であり，かつ **同じ場所でも面のとり方によって異なる** のだ．


```{figure} ./fig/internal_force2.png
:align: center
:name: fig-internal-force2
:width: 80%

仮想面の方向に応じて変化する内力の模式図．
```



いま，図{numref}`{number} <fig_katamari>`のように，弾性体のある領域の面の一部分の微小な面積要素 $dS$ を取ってきて，そこに働く力全体を $\boldsymbol{F}$ としよう．
```{margin}
この図はいかにも弾性体ひとかたまりを取ってきた表面のように見えるかもしれないが，そうではなく，弾性体の内部一部をくり抜いた物体の表面だと思ってほしい．
```
これまでの議論と同じように，この力 $\boldsymbol{F}$ は，面の向きによって変わる．では，その「面の向き」はどう表現するのが良いだろうか？実は，面の向きは面の外側を正とする面の法線ベクトル（大きさ1で方向だけを表すベクトル） $\hat{\boldsymbol{n}}$ によって特徴づけることができる．
```{margin}
ベクトル $n$ の上についている記号 $\hat{}$ は **ハット(hat)** という．この講義では，ハット記号を長さが1で方向だけを表す単位ベクトルの印として使う．
```
逆に，あるベクトル $\hat{\boldsymbol{n}}$ に垂直な面，というのは一つに定まる．力 $\boldsymbol{F}$ は，面の向き $\hat{\boldsymbol{n}}$ と面の面積 $dS$ に依存する量である．
だが，面力をモデル化するときに，有限のサイズ $dS$ を扱うのは厄介だ． $dS$ のサイズが変わると， $\boldsymbol{F}$ も変わってしまう．
```{margin}
たとえば水圧を考えると，圧力 $\times$ 面積がその面にかかる力なので，同じ水圧下でもある面かかっている力は面積に比例する．
```
そこで，面のサイズで規格化をする． **トラクション（Traction）**   $\boldsymbol{T}^{(\hat{\boldsymbol{n}})}$ という量を，
```{math}
:label: 
\begin{align}
  \boldsymbol{T}^{(\hat{\boldsymbol{n}})} \equiv \lim_{dS\rightarrow 0} \frac{\boldsymbol{F}}{dS}
\end{align}
```
で定義する．
```{margin}
表面力という言葉じたいを，このような「面積あたりの表面力」をもって定義するテキストもある．
```
これは要するに面積あたりの力なのだが， $dS\rightarrow 0$ の極限をとることで，「十分に小さな面要素を取る」ということを意味している．この極限操作によって，面の複雑な凸凹は考えないで済む（凸凹のスケールよりも小さな面積 $dS$ を取れば，その面は平らな正方形で近似できる）のである．
トラクションの単位は面積あたりの力なので，SI単位系であればN/m ${}^2$ だ．

```{figure} ./fig/SurfaceForce.png
:align: center
:width: 60%
:name: fig_katamari

弾性体の塊（体積 $V$ ）と，その面要素 $dS$ に働く力 $\boldsymbol{F}$ の模式図． $\hat{\boldsymbol{n}}$ は要素 $dS$ の法線ベクトルである．
```

ところで，トラクションは向きも重要である．ここでは， トラクションを法線ベクトル $\hat{\boldsymbol{n}}$ の向きの反対側から正の側に向かう力を正と定義する．
外向きに膨張する力を正に取るということだ．
同じ弾性体力学を使っていても，分野によって定義が異なる場合があるので注意してほしい．
面積力は向きをもったベクトルであるから，
面の向きの正負によって，その力の符号も変化する．具体的には，
```{math}
:label: 
\begin{align}
  \boldsymbol{T}^{(-\hat{\boldsymbol{n}})} = -  \boldsymbol{T}^{(\hat{\boldsymbol{n}})}
\end{align}
```
である．




面力あるいはトラクションとしては， **圧力** がイメージしやすいだろう．圧力は「面」に垂直に働く力で，その単位は（力/面積）だ．圧力は面の外側から内側に向かう力なので，物質表面に働く圧力 $p$ は，トラクションの符号としては $\boldsymbol{T}^{(\hat{\boldsymbol{n}})} = -p \hat{\boldsymbol{n}}$ のようにマイナスが付く．

粘性のない水（流体）の中であれば，圧力は面に垂直な方向しかとらないので単純なのだが，固体中の面力はもうすこし複雑である．
面力の大きな特徴は， **力が面積要素の向きに依存する** ということだ．このことを，弾性体内部の小さな立方体を取り出すことによって考えよう（図 {numref}`{number} <fig_bunkai>`）．
% 
 $x_1$ ,  $x_2$ ,  $x_3$ それぞれの方向に法線を持つ面（ $x_2$ -- $x_3$ 面,  $x_1$ -- $x_3$ 面,  $x_1$ -- $x_2$ 面）に対して，トラクション $\boldsymbol{T}^{(\hat{\boldsymbol{n}}_1)}$ ,  $\boldsymbol{T}^{(\hat{\boldsymbol{n}}_2)}$ ,  $\boldsymbol{T}^{(\hat{\boldsymbol{n}}_3)}$ がかかる．ただし，
```{math}
:label: eq:normalvector_definition
\begin{align}
\hat{\boldsymbol{n}}_1 = \begin{pmatrix} 1\\0\\0  \end{pmatrix}, \quad 
\hat{\boldsymbol{n}}_2 = \begin{pmatrix} 0\\1\\0  \end{pmatrix}, \quad 
\hat{\boldsymbol{n}}_3 = \begin{pmatrix} 0\\0\\1  \end{pmatrix} 
\end{align}
```
は各軸方向の法線ベクトルだ．

```{figure} ./fig/Traction.png
:align: center
:width: 80%
:name: fig_bunkai

弾性体内の微小立体要素に働く力 $\boldsymbol{T}^{(\hat{\boldsymbol{n}}_1)}$ ,  $\boldsymbol{T}^{(\hat{\boldsymbol{n}}_2)}$ ,  $\boldsymbol{T}^{(\hat{\boldsymbol{n}}_3)}$ とその成分．
```

水（完全流体）中の圧力であれば，面にかかるトラクションは常に面の法線方向に並行だが，弾性体内の力は「ねじれ」を許容するため，それ以外の方向にも力がかかってしまう．一つ一つのトラクションがベクトルであるからら，たとえば図中の $\boldsymbol{T}^{(\hat{\boldsymbol{n}}_2)}$ は，
```{math}
:label: 
\begin{align}
  \boldsymbol{T}^{(\hat{\boldsymbol{n}}_2)} = \begin{pmatrix} {T}^{(\hat{\boldsymbol{n}}_2)}_1\\ {T}^{(\hat{\boldsymbol{n}}_2)}_2\\ {T}^{(\hat{\boldsymbol{n}}_2)}_3\end{pmatrix}
\end{align}
```
のような3つの成分を持っている．
ということは，（トラクションベクトル $3$ つ） $\times$ （トラクションの成分 $3$ つ） $=9$ 成分があれば，ここにかかる力がすべて記述できることになるのだ．そこで，それらの力を行列のように
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
とまとめて表記しよう．これを **応力テンソル** と呼ぶ．
```{margin}
ギリシャ文字 $\sigma$ ではなく $\tau$ や英文字 $s$ ,  $t$ を使う場合もある．
```
 $\sigma_{ij}$ の意味は，「 $j$ 番目の軸に法線を持つ面にかかるトラクションの $i$ 成分 」である．
```{margin}
教科書によっては，応力テンソルの $i$ と $j$ の順番が逆転していたり，1つ目と2つ目の添字の意味が逆転していたり，いろいろのようだ．だが，この直後で示す応力テンソルの対称性によって，それらは実は「どっちでもいい」ことになる．
```
これらのうち， $\sigma_{11}$ ,  $\sigma_{22}$ ,  $\sigma_{33}$ を **法線応力（normal stress）** ，残りの $\sigma_{23}$ ,  $\sigma_{13}$ ,  $\sigma_{12}$ を **剪断応力（shear stress）** と呼んで区別することがある．これらの名前の付け方はひずみテンソルと同じで，法線応力は物体を膨張・圧縮させようとする力に，剪断応力はねじれの力にそれぞれ相当する．
図{numref}`{number} <fig_stress_12>`に， $x_1$ - $x_2$ 面内の微小四角形の辺に働く応力テンソルの成分を示した．
図{numref}`{number} <fig_bunkai>`では表現の都合上法線が座標軸正の方向を向いた面の応力（トラクション）しか表示していなかったが，実際には反対側の面にも（法線方向が反対なので）逆方向の力がかかる．
したがって，法線応力は全体として（符号がプラスの場合には）物質を膨張させる方向の張力であることがわかるだろう．

```{figure} ./fig/stress_12.png
:align: center
:width: 60%
:name: fig_stress_12

弾性体内の $x_1$ - $x_2$ 面内の微小要素に働く応力テンソルの成分．
```


## 応力テンソルの特徴

応力テンソルの重要な特徴を2つ挙げておく．ひとつは **応力テンソルは対称テンソルである** ことだ：
```{math}
:label: 
\begin{align}
  \sigma_{ij} = \sigma_{ji}
\end{align}
```
この条件は，弾性体全体が回転しない（より厳密には，角運動量が保存する）という条件から導かれる．
図{numref}`{number} <fig_stress_symmetry>`に $x_1$ -- $x_2$ 平面内の微小正方形にかかる応力テンソルを示した．
媒質全体が回転しないためには，明らかに
```{math}
:label: 
\begin{align}
  \sigma_{12} = \sigma_{21}
\end{align}
```
でなければならない．
```{margin}
ひずみの定義で，回転成分をのぞいた真の変形だけを取り扱うことにしたのだった．
```
 $\sigma_{13} = \sigma_{31}$ ,  $\sigma_{23}=\sigma_{32}$ の対称性も同様に導かれる．

```{figure} ./fig/stress_symmetry.png
:align: center
:width: 60%
:name: fig_stress_symmetry

応力テンソルの対称性． $12$ 平面の（微小）正方形にかかる応力テンソルのうち剪断応力テンソル成分を矢印で示す．
```

応力テンソルが対称テンソルであることから， $\sigma_{12} = \sigma_{21}$ ,  $\sigma_{13} = \sigma_{31}$ ,  $\sigma_{23} = \sigma_{32}$ であることがわかる．よって，応力テンソルの独立な成分は6つである．

もうひとつの特徴は，任意の方向の面（法線ベクトル $\hat{\boldsymbol{n}}$ ）のトラクション $ \boldsymbol{T}^{(\hat{\boldsymbol{n}})}$ が，応力テンソルから
```{math}
:label: eq:Cauchy-relation
\begin{align}
  T_i^{(\hat{\boldsymbol{n}})}= \sum_{j=1}^3 \sigma_{ij} \hat{n}_j
\end{align}
```
で求められるということだ．
これは **コーシー（Cauchy）の関係式** と呼ばれている．コーシーの関係式は， **応力テンソルの6つの独立な成分さえわかれば，弾性体内に働くあらゆる方向のトラクションを知ることができる** ということを意味している．

この関係式は，釣り合いの状態にある微小三角錐（あるいは2次元であれば三角形）のトラクションを考察することで導出できる．ここでは簡単のため，ふたたび2次元の $x_1$ -- $x_2$ 平面だけを考察しよう．

まず，図{numref}`{number} <fig_stress_equi>`のように $x_1$ -- $x_2$ 平面における微小三角形に働く力を考える．
三角形の2辺はそれぞれ $x_1$ 軸と $x_2$ 軸に平行でその長さを $dx_1$ と $dx_2$ ，もう一つの辺は長さ $d\ell$ で，その辺（3次元なら面）の法線ベクトルを $\hat{\boldsymbol{n}}$ ，そこに働くトラクションベクトルを $\boldsymbol{T}^{(\hat{\boldsymbol{n}})}=(T_1, T_2)$ とする．
残りの2つの面に働くトラクションベクトルの成分は，定義により図のような応力テンソル成分で表現することができる．

```{figure} ./fig/Equillibrium.png
:align: center
:width: 80%
:name: fig_stress_equi

2次元 $12$ 平面内における微小三角形に働く力の釣り合い．
```

このとき， $x_1$ 方向と $x_2$ 方向それぞれの力の釣り合いを考える．
面に働く力はトラクションベクトルにその面の面積（この場合は2次元なので辺の長さ）を乗じたものであるから， $x_1$ ,  $x_2$ 方向それぞれについて，
```{math}
:label: eq:traction-tsuriai
\begin{align}
  \begin{split}
  & T_1 d\ell = \sigma_{11} dx_2 + \sigma_{12} dx_1 \\
  & T_2 d\ell = \sigma_{21} dx_2 + \sigma_{22} dx_1 = \sigma_{12} dx_2 + \sigma_{22} dx_1 
\end{split}
\end{align}
```
が得られる．
ただし第2式では応力テンソルの対称性 $\sigma_{12} = \sigma_{21}$ を用いた．

ところで，辺 $d \ell$ の法線ベクトルと $x_1$ 軸のなす角を $\theta$ とすると， $\hat{n}_1 = \cos \theta$ ,  $\hat{n}_2 = \sin \theta$ である．一方，辺 $d \ell$ と $x_2$ 軸のなす角も $\theta$ であるので，
```{math}
:label: eq:kitei-kankei
\begin{align}
  \begin{split}
    &dx_2 = d\ell \cos \theta = d\ell \hat{n}_1 \\
    &dx_1= d\ell \sin \theta = d\ell \hat{n}_2 \\
  \end{split}
\end{align}
```
の関係がある．{eq}`eq:kitei-kankei`式を{eq}`eq:traction-tsuriai`に代入して整理すると，
```{math}
:label: eq:traction_represent
\begin{align}
  \begin{split}
    & T_1 = \sigma_{11} \hat{n}_1 + \sigma_{12} \hat{n}_2\\
    & T_2 = \sigma_{12} \hat{n}_1 + \sigma_{22} \hat{n}_2\\
  \end{split}
\end{align}
```
が得られる．これを行列（テンソル）とベクトルの積の形で書くと，
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
となり，たしかにコーシーの関係式（の2次元版）が成立していることが確認できた．

3次元の場合は，三角形の代わりに三角錐（すい）を用いて考察することになる．煩雑なだけでそれほど難しくはないので，興味があれば他の弾性体力学の教科書で勉強してみてほしい．


````{admonition} 演習問題：コーシーの関係式
:class: 
  式{eq}`eq:kitei-kankei`と{eq}`eq:traction-tsuriai`から，コーシーの関係式{eq}`eq:traction_represent`を導出されることを計算して確かめよ．
````

````{admonition} 演習問題：応力テンソルとトラクション
:class: 
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
  であるときに，以下の法線応力で与えられる面にかかるトラクションベクトルを求めよ：
  \begin{align*}
    \hat{\boldsymbol{n}}_1 = \left( \begin{matrix} 1/\sqrt{2} \\ 1/\sqrt{2} \end{matrix} \right),
    \quad
    \hat{\boldsymbol{n}}_2 = \left( \begin{matrix} 1/\sqrt{2} \\ - 1/\sqrt{2} \end{matrix} \right),
  \end{align*}
  （注）1MPa =  $10^6$  Pa．
````

