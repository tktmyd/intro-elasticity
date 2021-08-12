# 構成関係式

## 構成関係式の導入

運動方程式は，応力テンソル（の空間微分）がわかれば記述できる．つまり，かかっている力（応力テンソルの空間微分）がわかれば，物体の変形が記述できるということだ．では，応力はどうやって求めるのだろうか？物体が変形すると，それによってあらたに内力である応力がかかる．
このとき，応力 $\sigma_{ij}$ とひずみ $\varepsilon_{ij}$ の間をつなぐのが **構成関係式（あるいは構成関係式）** だ．構成関係式は，バネにつながれた質点におけるフックの法則（ $F = -k x$ ）に相当するものであり，**物体がひずんだときにどれだけの応力がかかるか** を表現する．構成関係式は実験によって定まるような関係式であって，理論的に導出される類のものではない．だが，**ひずみが十分に小さい場合** には，質点におけるバネと同じように，応力がひずみの線形関数でよく表されるということが知られていいる．このような媒質を **線形弾性体** という．以下では，媒質が線形弾性体でよく近似できることを仮定する．

```{margin}
すでに述べたように実は独立成分はそれぞれ6つしかなく，9つというのはあくまでも数式表現の形式的な数のことだ．
```
ひずみも応力も最大9個の独立成分を持ち，応力がひずみの線形関数であるということは，たとえば応力 $\sigma_{11}$ は，
```{math}
:label: 
\begin{align}
  \sigma_{11} = a_1 \varepsilon_{11} + a_2 \varepsilon_{12} + \cdots a_9 \varepsilon_{33}
\end{align}
```
のように，ひずみテンソル9つの線形な重ね合わせで書ける，ということである．

ということは，すべての応力とひずみの組み合わせには，なんと $9\times 9=81$ 個の係数が必要だ．形式的に書くと，構成関係式は
```{math}
:label: eq:constitutive-eq-general
\begin{align}
  \sigma_{ij} = \sum_{k=1}^3 \sum_{l=1}^3 C_{ijkl} \varepsilon_{kl}
\end{align}
```
と表される．
```{margin}
これまでのテンソルは行列とまったく同じ扱いをしてきたが，これは添字が4つもあるので行列とは明らかに異なる．応力テンソルやひずみテンソルといった2階のテンソル（添字2つのテンソル）は，ベクトル（添字1つ）をベクトルに移す線形写像であったが，弾性係数テンソルは添字4つの4階のテンソルであり，2階のテンソルを2階のテンソルに写像する関係を与えるものである．添字が多くなって複雑だが，式{eq}`eq:constitutive-eq-general`は行列とベクトルの積（あるいは2階のテンソルによるベクトルの線形写像）の式を拡張した形になっている．
```
ここで $C_{ijkl}$ は**弾性係数テンソル**と呼ばれるパラメタ
で， $i, j, k, l$ それぞれが $1, 2, 3$ の値をとり得るので，その個数は確かに $3^4=81$ 個ある．
81個もパラメタがあるのかとうんざりするかもしれないが，心配無用である．すでに調べたひずみテンソルと応力テンソルの対称性に加えて，**弾性体の特徴が方向に依存しない（等方性）**という仮定をすることによって，81個のうち独立なパラメタはなんと2個まで減らせるということが知られているのだ．その導出はこの入門文書の範囲を超えるので，ここではその結果を正しいものと受け入れてもらう．
その構成関係式は，
```{math}
:label: eq:constitutive-lame
\begin{align}
  \sigma_{ij} = \lambda \delta_{ij} \sum_{k=1}^3 \varepsilon_{kk} + 2 \mu \varepsilon_{ij}
\end{align}
```
と表される．このような弾性体を**線形等方弾性体**と呼ぶ．

````{admonition} 数学メモ：クロネッカーのデルタ
:class: tip, dropdown 
  {eq}`eq:constitutive-lame`式に現れる $\delta_{ij}$ はクロネッカー（Kronecker）のデルタと呼ばれ，
  ```{math}
:label: 
\begin{align}
    \delta_{ij} = \begin{cases}
      1 & i = j \\
      0 & i \neq j
    \end{cases}
  \end{align}
```
  と定義される量だ．
  この項があることによって， $i=j$ と $i\neq j$ を場合分けせず一本の式にまとめて書くことができる．もしクロネッカーのデルタを使わずに{eq}`eq:constitutive-lame`を表現しようとすると，
    \begin{align*}
    \sigma_{ij} = 
    \begin{cases}
      \lambda \displaystyle \sum_{k=1}^3 \varepsilon_{kk} + 2 \mu \varepsilon_{ii} & (i=j) \\ 
      2 \mu \varepsilon_{ij} & (i \neq j )\\
    \end{cases}
  \end{align*}  
  となる．
````

このときの弾性係数テンソルは，
```{math}
:label: eq:Cijkl
\begin{align}
  C_{ijkl} = \lambda \delta_{ij} \delta_{kl} + \mu (\delta_{ik}\delta_{jl}+\delta_{il}\delta_{jk})
\end{align}
```
と表すことができることが知られている．

````{admonition} 演習：線形等方弾性体の構成関係式  
:class: dropdown
  {eq}`eq:Cijkl`を{eq}`eq:constitutive-eq-general`に代入して $j,l$ について和を取り，クロネッカーのデルタの定義を用いることで，線形等方弾性体の構成関係式{eq}`eq:constitutive-lame`が得られることを確認せよ．
````

```{margin}
日本語で「定数」と呼ばれる習慣があるが，実際には値が一定であるという意味の「定数」ではない．これらのパラメタは弾性体の特徴を表すもので，弾性体の性質によって（一定ではない）異なる値を取りうる．
```
この構成関係式に現れたパラメタ $\lambda$ と $\mu$ を**ラメ（Lam\'e）の定数**と呼ぶ．
ちょっと分量が多いが，構成関係式を全成分書き下してみよう．
  ```{math}
:label: eq:constitutive_equation
\begin{align}
    \begin{split}
    & \sigma_{11} = \lambda ( \varepsilon_{11} + \varepsilon_{22} + \varepsilon_{33})  + 2 \mu \varepsilon_{11}
      = \lambda \left( \frac{\partial u_1} {\partial x_1} + \frac{\partial u_2} {\partial x_2} + \frac{\partial u_3} {\partial x_3} \right)
      + 2 \mu  \frac{\partial u_1} {\partial x_1} 
    \\
    & \sigma_{22} = \lambda ( \varepsilon_{11} + \varepsilon_{22} + \varepsilon_{33})  + 2 \mu \varepsilon_{22}
      = \lambda \left( \frac{\partial u_1} {\partial x_1} + \frac{\partial u_2} {\partial x_2} + \frac{\partial u_3} {\partial x_3} \right)
      + 2 \mu  \frac{\partial u_2} {\partial x_2} 
    \\
    & \sigma_{33} = \lambda ( \varepsilon_{11} + \varepsilon_{22} + \varepsilon_{33})  + 2 \mu \varepsilon_{33}
      = \lambda \left( \frac{\partial u_1} {\partial x_1} + \frac{\partial u_2} {\partial x_2} + \frac{\partial u_3} {\partial x_3} \right)
      + 2 \mu  \frac{\partial u_3} {\partial x_3} 
    \\
    & \sigma_{23} = 2\mu \varepsilon_{23} =
      \mu \left( \frac{ \partial u_2 }{ \partial x_3 } + \frac{\partial u_3 }{ \partial x_2} \right) \\
    & \sigma_{13} = 2\mu \varepsilon_{13} =
      \mu \left( \frac{ \partial u_3 }{ \partial x_1 } + \frac{\partial u_1 }{ \partial x_3} \right) \\
    & \sigma_{12} = 2\mu \varepsilon_{12} =
      \mu \left( \frac{ \partial u_1 }{ \partial x_2 } + \frac{\partial u_2 }{ \partial x_1} \right)     
    \end{split}
  \end{align}
```
ひずみテンソルの定義を通じて，応力が歪と，あるいは変位と関係づけられた．

```{margin}
ここでの「原理的には」というのは，歪テンソルの9つの成分に対して， $\sigma_{ij}=\cdots$ という方程式が9本できるので，未知数の数と方程式の本数が等しいため連立方程式が解を持ちうる，ということを意図している．
```
この方程式は，ひずみテンソル成分と弾性係数がわかれば応力テンソルの各成分が求まる，ということを意味しているが，これをひずみテンソル成分についての連立方程式としてみて，ひずみテンソルについて（原理的には）解くこともできる．一般に
```{math}
:label: 
\begin{align}
  \varepsilon_{ij} = \sum_{k,l=1}^3 D_{ijkl} \sigma_{kl}
\end{align}
```
のような形で構成関係式を表したときに，係数 $D_{ijkl}$ のことを**弾性コンプライアンス**テンソルと呼ぶ．線形等方弾性体の場合には，
```{math}
:label: eq:complience_isotropic
\begin{align}
  \varepsilon_{ij} = - \frac{\lambda}{2 \mu(3\lambda +2 \mu)} \sigma_{kk}\delta_{ij} + \frac{1}{2\mu} \sigma_{ij}
\end{align}
```
である．

````{admonition} 演習：弾性コンプライアンス
:class: dropdown
  線形等方弾性体の構成関係式{eq}`eq:constitutive-lame`を $\varepsilon_{ij}$ について解いて{eq}`eq:complience_isotropic`を証明せよ．6元の連立方程式であるが，以下のステップで計算することにより比較的簡単に解くことができる．

  (i)  $i\neq j$ の場合について $\varepsilon_{ij} = (1/2 \mu) \sigma_{ij}$ を満たすことを示せ．

  (ii) {eq}`eq:constitutive-lame`から $\sigma_{11}+\sigma_{22}+\sigma_{33}$ を計算し，それを $\varepsilon_{11}+\varepsilon_{22}+\varepsilon_{33}$ を用いて示せ．

  (iii) (ii)の結果をあらためて $i=j$ の場合の{eq}`eq:constitutive-lame`に代入し整理することで， $\varepsilon_{ii}$ を応力テンソルだけを用いて表現し，(i)の結果とあわせて{eq}`eq:complience_isotropic`を証明せよ．
````

ともあれ，これで変形があったとき（変位 $\boldsymbol{u}$ が与えられたとき）に，どのような応力がかかるかがわかるようになった．そしてどのような応力がかかるのかがわかれば，運動方程式によって，どのような変形が起こるのかもわかるのだ．

### フォークト記法

構成関係式は，ある種の行列形式で書き下すこともできる：
```{math}
:label: eq:constitutive_equation_voigt
\begin{align}
  \left(
  \begin{matrix}
    \sigma_{11}\\
    \sigma_{22}\\
    \sigma_{33}\\
    \sigma_{23}\\
    \sigma_{13}\\
    \sigma_{12}\\
  \end{matrix}
  \right)
  =
  \left(
  \begin{matrix}
    \lambda + 2\mu & \lambda & \lambda & 0 & 0& 0 \\
    \lambda  & \lambda+ 2\mu & \lambda & 0 & 0& 0 \\
    \lambda  & \lambda & \lambda + 2\mu & 0 & 0& 0 \\
    0 & 0 &0 & \mu & 0 & 0\\
    0 & 0 &0 & 0 & \mu & 0 \\
    0 & 0 &0 & 0 & 0 & \mu \\
  \end{matrix}
  \right)
  \left(
  \begin{matrix}
    \varepsilon_{11}\\
    \varepsilon_{22}\\
    \varepsilon_{33}\\
    2\varepsilon_{23}\\
    2\varepsilon_{13}\\
    2\varepsilon_{12}\\
  \end{matrix}
  \right).
\end{align}
```
このように， $11$ ,  $22$ ,  $33$ ,  $23$ ,  $13$ ,  $12$ 成分の順番に応力・ひずみテンソルを並べて，あたかも擬似的な6次元ベクトルのように表すと，構成関係を簡単に表現することができる．このような表記法は**フォークト（Voigt）記法**と呼ばれる．剪断ひずみのベクトル化表現に係数2がつくのは慣習に基づくものだ．ただし，分野によっては， $\varepsilon_{23}, \varepsilon_{13}, \varepsilon_{12}$ ではなく係数行列の $\mu$ に係数2を掛ける定義のしかたもある．
．
````{admonition} 演習：フォークト記法の確認
:class: dropdown
  フォークト記法に基づく構成関係式{eq}`eq:constitutive_equation_voigt`を展開して，もとの構成関係式{eq}`eq:constitutive_equation`に一致することを確認せよ．
````

## 弾性体を表現する様々なパラメタとその関係

分野によって，弾性体を表現するパラメタにはいろいろなものが用いられる．主要なものに，**ヤング（Young）率** $E$ , **剛性率** $G$ ，**ポアソン（Poisson）比** $\nu$ ，**体積弾性率** $K$ がある．

任意の2つのパラメタで残りのパラメタを表現することができるので，どのような組み合わせを選んでもよいのだが，パラメタによっては，それ自身に物理的な意味付けがあることがあり，弾性体力学を応用する分野によって好まれるパラメタが異なる．理学分野の地震学では，理論的な導出がやりやすいという理由で，ラメの定数 $\lambda$ と $\mu$ が広く用いられる．一方，ラメの定数のうち $\lambda$ のように，物理的な意味が与えられないパラメタもある．

本節では，それらの弾性係数とラメの定数との関係をまとめておく．

### ヤング率  $E$ 

ヤング率は，**一方向の引張もしくは圧縮に対するひずみと応力の間の比例定数**だ．{numref}` Fig. {number} <fig_Young>`のように，棒状の弾性体に棒の長さ方向（この場合は $x_3$ 方向）に法線応力 $\sigma_{33}$ をかけると，それによって変形が起こる．そのときの $x_3$ 方向の法線ひずみ $\varepsilon_{33}$ は
```{math}
:label: eq:young_strain
\begin{align}
  \varepsilon_{33} = \frac{ \delta L }{ L}
\end{align}
```
と書けるだろう．ヤング率はこの法線応力と法線ひずみの比として，
```{math}
:label: eq:Young
\begin{align}
  E \equiv \frac{\sigma_{33}}{\varepsilon_{33}}
\end{align}
```
で定義される．

```{figure} ./fig/Young.png
:align: center
:width: 80%
:name: fig_Young

ヤング率の模式図．(a)変形前とそこにかける応力．(b)変形後と変形により発生したひずみ．
```


つまり，ヤング率は「弾性体を引っ張ったときどれだけ伸びやすいか」という指標であり，質点系の力学におけるバネ定数とほとんど同じものである．ヤング率は応力（SI単位系でN/m $^2$ =Pa）と無次元のひずみの比であるので，応力と同じ次元（力/面積）を持つ．

ヤング率は，ラメの定数と以下の式で相互変換できることが知られている．
```{math}
:label: eq:young_lame
\begin{align}
  E = \frac{ 3 \lambda + 2 \mu }{ \lambda + \mu} \mu
\end{align}
```

### 剛性率  $G$ 

剛性率はラメの定数 $\mu$ の別名である． $G=\mu$ ．剛性率は圧力（あるいは応力）と同じ次元を持つ．構成関係式のうち剪断応力と剪断ひずみの関係 $\sigma_{ij}=2\mu \varepsilon_{ij}=2 G\varepsilon_{ij} $ （ $i\neq j$ ）から $\varepsilon_{ij}=\sigma_{ij}/(2G)$ であることに注目すると，媒質に剪断応力（物体をねじるような応力）がかかったときに，剛性率が大きいほど剪断ひずみが小さいと言える．つまり，剛性率は「物体のねじれにくさの指標」なのだ．

### ポアソン比  $\nu$

{numref}` Fig. {number} <fig_Poisson>`のように，有限の大きさの物体に法線応力 $\varepsilon_{33}$ をかけると，物体がその方向に伸びるだけでなく，それに直交する方向にも変形が起こる．ポアソン比は，物体に一方向の応力 $\sigma_{33}$ を与えたとき，その方向に対するひずみ $\varepsilon_{33}$ と，それに直交する方向のひずみ $\varepsilon_{11}$ もしくは $\varepsilon_{22}$ の比として定義される．
```{math}
:label: eq:Poisson
\begin{align}
  \nu \equiv - \frac{ \varepsilon_{11} }{\varepsilon_{33} } = - \frac{ \varepsilon_{22} }{\varepsilon_{33} } 
\end{align}
```
ポアソン比は無次元のひずみの比であるので，無次元量である．符号がマイナスであるのは定義による．
物体を一方向に引っ張って引き伸ばしたとき，ほとんどの物質はそれに直交する方向には縮むため，一般には $\nu>0$ であると思って構わない．とはいえ，あらゆる物体に対して $\nu>0$ であることが保証されているわけではない．ポアソン比が負（つまりある方向に引っ張ると他の方向にも膨らむ）の物質もごくまれに存在するし，人工的にも合成されているようだ．

```{figure} ./fig/Poisson.png
:align: center
:width: 80%
:name: fig_Poisson

ポアソン比の模式図．(a)変形前とそこにかける応力．(b)変形後の様子．
```

ポアソン比はラメの定数を用いると，
```{math}
:label: eq:poisson_lame
\begin{align}
  \nu = \frac{ \lambda } { 2 \left( \lambda + \mu \right) }
\end{align}
```
と表されることが知られている．

### 体積弾性率  $K$ 

```{margin}
一般には体積弾性率は圧力にたいしてどれだけ体積が縮むか，として定義されるが，符号が逆の応力に対してどれだけ膨らむか，としても全く同じことである．
```
体積弾性率は，等方的な応力 $\sigma_{11}=\sigma_{22}=\sigma_{33}$ （{numref}` Fig. {number} <fig_Bulk>`）に対して，物体がどれだけ体積変化するかを表す指標である．体積変化は $\theta=\varepsilon_{11}+\varepsilon_{22}+\varepsilon_{33}$ で表すことができたので，体積弾性率はそれと応力の比
```{math}
:label: 
\begin{align}
  K = \frac{\sigma_{11}}{\varepsilon_{11}+\varepsilon_{22}+\varepsilon_{33}}
\end{align}
```
で定義される．体積弾性率は応力やラメの定数と同じ次元を持つ．

```{figure} ./fig/Bulk.png
:align: center
:width: 80%
:name: fig_Bulk

体積弾性率の模式図．(a)変形前．(b)変形後．
```

体積弾性率とラメの定数との換算式は，
```{math}
:label: eq:bulk_lame
\begin{align}
  K = \frac{ 3 \lambda + 2 \mu}{3}
\end{align}
```
である．

````{admonition} 演習：弾性係数の相互変換
:class: dropdown
  構成関係式{eq}`eq:constitutive_equation`に以下の条件をそれぞれ代入することで，ヤング率・ポアソン比・体積弾性率のラメの定数による表現{eq}`eq:young_lame`, {eq}`eq:poisson_lame`, {eq}`eq:bulk_lame`を導出せよ，

  (1)  $\sigma_{11}=\sigma_{22}=0$ ,  $\sigma_{33}>0$ ,  $\sigma_{ij}=0$   $(i\neq j)$ ,  $\varepsilon_{ij}=0$   $(i \neq j)$ のとき， $E=\sigma_{33}/\varepsilon_{33}$ 
  
  (2)  $\varepsilon_{22} = \varepsilon_{11}$ ,  $\sigma_{11}=\sigma_{22}=0$ ,  $\sigma_{ij} = 0$   $(i\neq j)$ ,  $\varepsilon_{ij} = 0$   $(i \neq j)$ のとき， $\nu = -\varepsilon_{11}/\varepsilon_{33}$ 
  
  (3)  $\sigma_{11} = \sigma_{22} = \sigma_{33}$ ,   $\sigma_{ij} = 0$   $(i\neq j)$ ,  $\varepsilon_{ij} = 0$   $(i \neq j)$ のとき， $K=\sigma_{11}/(\varepsilon_{11}+\varepsilon_{22}+\varepsilon_{33})$ 
````