# 変位と変形

弾性体内の任意の点 $\boldsymbol{x}$ が，変形などによって動いた量を**変位**と呼び， $\boldsymbol{u}(\boldsymbol{x})$ で表す．
各点における変位は向き（動いた方向）と大きさ（動いた大きさ）を持っているのでベクトルだ．
しかも，変位は弾性体内の位置 $\boldsymbol{x}$ （これも位置を表すベクトルだ）によって異なることがあるため，位置 $\boldsymbol{x}$ の関数でもある．
3次元空間では位置ベクトル $\boldsymbol{x}$ は3つの要素を持つから，変位ベクトルは3つの変数を持つ多変数関数でもある．

```{admonition} 数学メモ：場
:class: tip, 
位置によって値が定まる物理量のことを，**『場』** ということがある．いま扱っているのは変位の場なので，ひとまとめに変位場と呼ぶ．「場」はfieldの和訳語のひとつで，高校までの理科では別の訳語「界」が使われていた．たとえば電界と磁界は電場，磁場と同じ意味である．
```

````{admonition} 座標系の表現
:class: tip, 

これまでは三次元空間上の位置といえば図 {numref}`{number} <fig_xyz-123>`a のように $(x,y,z)$ の記号を用いて表すのが普通だっであろうが，本書では，$(x,y,z)$のかわりに下付きの**添字**を使って， $\boldsymbol{x} = (x_1, x_2, x_3)$ と図 {numref}`{number} <fig_xyz-123>`bのように表す．

このような記法を用いるのは，これから沢山の記号が出てくるのに，位置を表すだけのために3つもアルファベットを使っていては記号が足りないという（切実な！）理由のためである．
また，番号の添字を変数 $i$ で表すと，たとえば $x_i$   $(i=1,\cdots 3)$ のような表し方ができ，計算の見通しが良くなるというメリットもある．
 $x_i$ がベクトル $\boldsymbol{x}$ の $i$ 番目の成分，というのも自然な定義であろう．

ただし， $xyz$ と添字 $123$ のどちらを使うかは教科書によっても異なる．
必要に応じて読み替えてほしい．

```{figure} ./fig//xyz-123.png
:align: center
:width: 80%
:name: fig_xyz-123

座標系の表現．(a) $xyz$座標．(b) $x_1 x_2 x_3$座標．
```
````


もし，この変位 $\boldsymbol{u}(\boldsymbol{x})$ があらゆる場所 $\boldsymbol{x}$ で一様だったらどうだろうか？
そのとき，変位の方向に物体は平行移動するだけで，まったく変形しないことになるだろう．
物体がどこかの軸に沿って回転するような変位の場合も，物体は変形しない．
このように，変位を定義しただけでは，物体の変形を表すのには不十分なのだ．
そこで，**ひずみ**という**真の変形のみを表す量**を，**物体の単位距離あたりの相対変位から回転成分を取り除いたもの**であるとして定義しよう．

まず，隣接した点との相対変位を取ることで，平行移動の成分をキャンセルしてしまう．
図 {numref}`{number} <fig_deformation>` のように，物体中に微小な相対位置ベクトル $\boldsymbol{d}$ だけ離れた2点 $\boldsymbol{x_0}$ と $\boldsymbol{x}=\boldsymbol{x_0}+\boldsymbol{d}$ を考え，それぞれの位置における変形量を $\boldsymbol{u}(\boldsymbol{x_0})$ と $\boldsymbol{u}(\boldsymbol{x})$ を通じて考える．
もしこの2つの変形をあらわすベクトルが平行で同じ長さ，つまり $\boldsymbol{u}(\boldsymbol{x})=\boldsymbol{u}(\boldsymbol{x_0})$ であったならば，物体は平行移動しているだけで変形しない．
逆に言うと，変形しているならばベクトル $\boldsymbol{u}(\boldsymbol{x_0})$ と $\boldsymbol{u}(\boldsymbol{x})$ には違いが生じているはずだ．
そこで，図 {numref}`{number} <fig_deformation>` のように2つのベクトルの差を取ることで，相対変位 $\boldsymbol{\delta u}(\boldsymbol{x})$ を抽出する：
```{math}
:label: eq:deformation_general
\begin{align}
  \boldsymbol{u}(\boldsymbol{x})
  = \boldsymbol{u}(\boldsymbol{x_0}) + \boldsymbol{\delta u}(\boldsymbol{x})
\end{align}
```

```{figure} ./fig//deformation.png
:align: center
:width: 80%
:name: fig_deformation

物体の変形を表すベクトル．実黒線矢印が変形を，点線矢印が相対位置ベクトルをそれぞれ表す．
```

ところで，ここでは2点間の相対位置をベクトルで表しているので，そのベクトルの絶対値（ベクトルの長さ）を取れば，2点間の距離になる．もし2点間の距離 $d=|\boldsymbol{d}|$ が十分に小さいとすると，**テイラー展開**によって $\boldsymbol{u}(\boldsymbol{x})=\boldsymbol{u}(\boldsymbol{x_0}+\boldsymbol{d})$ を以下のように近似表現できる．
```{math}
:label: eq:u-taylor
\begin{align}
  \begin{split}
  &u_1(\boldsymbol{x_0}+\boldsymbol{d}) \simeq u_1 (\boldsymbol{x_0}) +
  \frac{\partial u_1}{\partial x_1} d_1 + 
  \frac{\partial u_1}{\partial x_2} d_2 + 
  \frac{\partial u_1}{\partial x_3} d_3 \\
  &u_2(\boldsymbol{x_0}+\boldsymbol{d}) \simeq u_2 (\boldsymbol{x_0}) +
  \frac{\partial u_2}{\partial x_1} d_1 + 
  \frac{\partial u_2}{\partial x_2} d_2 + 
  \frac{\partial u_2}{\partial x_3} d_3 \\
  &u_3(\boldsymbol{x_0}+\boldsymbol{d}) \simeq u_3 (\boldsymbol{x_0}) +
  \frac{\partial u_3}{\partial x_1} d_1 + 
  \frac{\partial u_3}{\partial x_2} d_2 + 
  \frac{\partial u_3}{\partial x_3} d_3 \\  
\end{split}
\end{align}
```

```{admonition} 数学メモ：等号・不等号のいろいろ
:class: tip, 

  {eq}`eq:u-taylor`式で用いられている記号  $\simeq$  は，**左辺と右辺が近似的に等しい**という意味だ．
  この場合は，右辺のテイラー展開を1次で打ち切っているため， $|d_i|$  ( $i=1,\cdots 3$ )が十分に小さいときに成立する近似式である．近似式が表れたときには，**どのような近似のもとで成立する式なのか**ということもとても重要だ．
  この記号は左辺から右辺への計算の過程で用いるため，通常は右辺が近似された（あるいは比例する）量であり，逆に左辺が近似された量であることはほとんどない．
  等号( $=$ )の場合はどちらが右辺でどちらが左辺であっても意味は同じであったが，近似計算のときには注意が必要である．

  そのほかにも，本書ではいろいろな記号が用いられる．たとえば  $\equiv$  は，量の**定義**に用いる等号だ．本書で $A\equiv B$ とあったら，「 $A$ という量を $B$ で定義する」という意味になる．一方， $\propto$  は左辺が右辺に
   **比例する** ことを表す．

   $\ll$ と $\gg$ は不等号だが，それぞれ左辺より右辺が**十分に大きい**あるいは**十分に小さい**ということを意味する．「十分に」とは，値が一桁以上違う，あるいは微小量のべき乗の指数が異なる．たとえば， $1$ よりも十分に小さい量  $|a|\ll 1$  に対して， $|a| \gg |a|^2 \gg |a|^3 $  といった具合である．

```

```{admonition} 数学メモ：導関数（微分）の定義
:class: tip, 
  関数 $f(x)$ の微分（導関数）は，
  ```{math}
:label:
\begin{align}
    \frac{df}{dx} = f'(x) = \lim_{h\rightarrow 0} \frac{f(x+h)-f(x)}{h} 
  \end{align}
```
  と定義される．
  刻み幅 $h$ だけ離した2点間で関数 $f$ の傾きを計算し，その刻み幅を無限に小さくする，というのがその意味であった．
  刻み幅は極限によって無限に小さくするので，関数が連続でなめらかであれば，その傾きを調べる位置が $x+h$ と $x$ であろうと， $x$ と $x-h$ であろうと，あるいは $x+h/2$ と $x-h/2$ であろうと同じ値に収束する．つまり，
  ```{math}
:label:
\begin{align}
    f'(x)=\lim_{h\rightarrow 0} \frac{f(x)-f(x-h)}{h} =\lim_{h\rightarrow 0} \frac{f(x+h/2)-f(x-h/2)}{h} 
  \end{align}
```
  ということである（これは関数が $x$ の周りで**連続**であるということも主張している）．
  これは， $h$ が十分に小さい時，関数 $f(x)$ が1次関数で近似できる，ということを意味している．
  関数 $f(x)$ が $x$ において微分が存在する（微分可能である）ためには，
  この「関数 $f(x)$ が1次関数で近似できる」ことが必要だ． 
  $x$ において不連続であったり，折れ曲がるような関数は微分ができない．

  もし関数が複数の引数を取る多変数関数である場合には，微分の記号 $d$ の代わりに $\partial$ を使い，これを偏微分と呼ぶ．たとえば関数 $f(x,y)$ を $x$ と $y$ についてそれぞれ偏微分した偏導関数は
  ```{math}
:label:
\begin{align}
    \frac{\partial f}{\partial x}, \, \frac{\partial f}{\partial y}
  \end{align}
```
  のように書く．その意味するところは1変数関数の微分と同じで，わずかに変数 $x$ （あるいは $y$ ）が変化したときの関数 $f$ の変化率である．


````{admonition} 数学メモ：1変数と多変数関数のテイラー展開
:class: tip, 
  連続かつ無限回微分可能な関数 $f(x)$ に対し，微小量 $\delta x$ だけ離れた場所での値 $f(x+\delta x)$ は，1次の**テイラー展開**によって
  ```{math}
:label:
\begin{align}
    f(x + d x) \simeq f(x) + \frac{ d f}{ d x } d x 
  \end{align}
```
  と表される．1次のテイラー展開は， $x$ における $f(x)$ の値を起点として， $f(x+dx)$ を1次関数で近似した，と意味づけられるだろう．

  いま扱おうとしている変位は，位置 $x_1$ ,  $x_2$ ,  $x_3$ に（ほんとうは更に時間 $t$ にも）依存する**多変数関数**だが，そのような場合にも同様に
```{math}
:label:
:label: eq:taylor-multi-scalar
  \begin{align}
    f(x_1 + d x_1, x_2+ d x_2, x_3 + d x_3) \simeq f(x_1, x_2, x_3)
    + \frac{ \partial f}{ \partial x_1 }  d x_1 +
    \frac{ \partial f}{ \partial x_2 } d x_2 + \frac{ \partial f}{ \partial x_3 } d x_3 
  \end{align}
```
  と書くことができる．右辺の第2項以降は， $(d x_1, d x_2, d x_3)$ の変化によって関数 $f$ がどれだけ変化したかという量で，**全微分**
  ```{math}
:label:
\begin{align}
    df \equiv \frac{ \partial f}{ \partial x_1 }  d x_1 +
    \frac{ \partial f}{ \partial x_2 } d x_2 + \frac{ \partial f}{ \partial x_3 } d x_3 
  \end{align}
```
  とも呼ばれる．

  もし関数がスカラーではなく，ベクトル $\boldsymbol{f}(\boldsymbol{x})$ である場合には，関数の成分ごとに{eq}`eq:taylor-multi-scalar` 式と同様な展開をする．それが{eq}`eq:u-taylor` 式で行っている展開である．

  なお，数学的には，このような近似がいつでも可能であるという保証はない．
  展開される関数が連続かつ微分可能であり，（偏）導関数（ $d f / dx$ ,  $\partial f / \partial x_i$ ）も連続，といった条件が必要だ．
  ただし，亀裂のない連続体の連続的な変形を扱っている限りは，この条件が満たされていると思ってよいだろう．
````

ベクトルの一つ一つの成分をばらして計算したが，これらは行列とベクトルを使って，まとめて
```{math}
:label: eq:deformation_matrix
\begin{align}
  \boldsymbol{u}(\boldsymbol{x_0}+\boldsymbol{d}) =
  \boldsymbol{u}(\boldsymbol{x_0}) +
  \left(
  \begin{matrix}
    \dfrac{\partial u_1}{\partial x_1} & 
    \dfrac{\partial u_1}{\partial x_2} & 
    \dfrac{\partial u_1}{\partial x_3} \\
    \dfrac{\partial u_2}{\partial x_1} & 
    \dfrac{\partial u_2}{\partial x_2} & 
    \dfrac{\partial u_2}{\partial x_3} \\
    \dfrac{\partial u_3}{\partial x_1} & 
    \dfrac{\partial u_3}{\partial x_2} & 
    \dfrac{\partial u_3}{\partial x_3} \\
  \end{matrix}
  \right)
  \left(
  \begin{matrix}
    d_1\\d_2\\d_3
  \end{matrix}
  \right)
  =
  \boldsymbol{u}(\boldsymbol{x_0}) +
  \boldsymbol{J} \boldsymbol{d}
\end{align}
```
と書くことができる．
式{eq}`eq:deformation_general` と{eq}`eq:deformation_matrix` を見比べると，
この行列とベクトルの積 $\boldsymbol{J}\boldsymbol{d}$ が相対変位ベクトル $\boldsymbol{\delta u}(\boldsymbol{x})$ の正体であることがわかるだろう．



````{admonition} 数学メモ：行列とベクトルの基礎
:class: tip, 

  行列 $\boldsymbol{A}$ （成分 $A_{ij}$ ,  $1\le i \le 3$ ,  $1 \le j \le 3$ ）と縦ベクトル  $\boldsymbol{b}$ （成分 $b_i$ ,  $1\le i \le 3$ ）の積は
  ```{math}
:label: eq:matrix-vector-mul
\begin{align}
    \boldsymbol{c} =
    \boldsymbol{A} \boldsymbol{b} =
    \left(
    \begin{matrix}
      A_{11} & A_{12} & A_{13} \\
      A_{21} & A_{22} & A_{23} \\
      A_{31} & A_{32} & A_{33} \\
    \end{matrix}
    \right)
    \left(
    \begin{matrix}
      b_1 \\ b_2 \\ b_3
    \end{matrix}
    \right)
    =
    \left(
    \begin{matrix}
      A_{11} b_1 + A_{12} b_2+ A_{13} b_3 \\
      A_{21} b_1 + A_{22} b_2+ A_{23} b_3 \\
      A_{31} b_1 + A_{32} b_2+ A_{33} b_3 \\
    \end{matrix}
    \right)
  \end{align}
```
  と定義される．この成分は，総和記号 $\Sigma$ を用いると，
  ```{math}
:label: eq:matrix-vector-mul2
\begin{align}
    c_i = \sum_{k=1}^3 A_{ik} b_k
  \end{align}
```
  とコンパクトに書くことができる．今後は成分による後者の表現もよく用いるので，慣れていってほしい．また，
  行列 $\boldsymbol{A}$ とベクトル $\boldsymbol{b}$ の積を計算することを，行列 $\boldsymbol{A}$ にベクトル $\boldsymbol{b}$ を**作用させる**ということがある．
  {eq}`eq:matrix-vector-mul` を $b_i$ についての連立方程式として見ると，これは形式的に
  ```{math}
:label:
\begin{align}
    \boldsymbol{b} = \boldsymbol{A}^{-1} \boldsymbol{c}
  \end{align}
```
  のように書くことができる． $\boldsymbol{c}$ に作用させることによって連立方程式の解を与える行列 $\boldsymbol{A}^{-1}$ を，行列 $\boldsymbol{A}$ の**逆行列**という．逆行列は行列の成分の逆数を意味**しない**ことに注意せよ．

  同様に，行列 $\boldsymbol{A}$ と行列 $\boldsymbol{D}$ の積 $\boldsymbol{E}=\boldsymbol{AD}$ の成分は，
  ```{math}
:label:
\begin{align}
    E_{ij} = \sum_{k=1}^3 A_{ik} D_{kj}
  \end{align}
```
  と書くことができる．もし行列 $\boldsymbol{A}$ に逆行列が存在すれば， $\boldsymbol{D}$ を
  ```{math}
:label:
\begin{align}
    \boldsymbol{D}=\boldsymbol{A}^{-1}\boldsymbol{E}
  \end{align}
```
  あるいは成分で
  ```{math}
:label:
\begin{align}
    D_{ij}=\sum_{k=1}^3 (\boldsymbol{A}^{-1})_{ik} E_{kj}
  \end{align}
```
  と書くこともできる．ここで $ (\boldsymbol{A}^{-1})_{ik}$ は行列 $\boldsymbol{A}$ の逆行列の $ik$ 成分のことである．

  ところで，行列の縦の大きさ（行数）と横の大きさ（列数）は同じであるとは限らない． $2\times 2$ や $3 \times 3$ のように，たまたま縦横の大きさの同じ行列のことを**正方行列**という．ベクトル
  ```{math}
:label:
\begin{align}
    \boldsymbol{b} = \begin{pmatrix}  b_1, b_2, b_3 \end{pmatrix}, \quad \boldsymbol{c} = \begin{pmatrix}  c_1 \\ c_2 \\ c_3 \end{pmatrix}
  \end{align}
```
  はそれぞれ1行3列と3行1列の行列であると見なすこともできる．

  これら２つのベクトルの積を行列の掛け算のルールを用いて書くと，
  ```{math}
:label:
\begin{align}
    \boldsymbol{b} \cdot \boldsymbol{c} 
    = \begin{pmatrix}  b_1 & b_2 & b_3 \end{pmatrix}  \begin{pmatrix}  c_1 \\ c_2 \\ c_3 \end{pmatrix}
    = b_1 c_1 + b_2 c_2 + b_3 c_3 
  \end{align}
```
  はベクトルの内積である．しかし，掛け算の順序を逆にすると，
  ```{math}
:label:
\begin{align}
    \boldsymbol{c} \boldsymbol{b} 
    = \begin{pmatrix}  c_1 \\ c_2 \\ c_3 \end{pmatrix} \begin{pmatrix}  b_1 & b_2 & b_3 \end{pmatrix}  
    = 
    \begin{pmatrix}
      b_1 c_1 & b_2 c_1 & b_3 c_1 \\
      b_1 c_2 & b_2 c_2 & b_3 c_2 \\
      b_1 c_3 & b_2 c_3 & b_3 c_3 \\
    \end{pmatrix}
  \end{align}
```  
  は $3\times 3$ の行列になってしまう．行列の乗算は順番に注意する必要があるし，縦ベクトルと横ベクトルは互いに区別しなくてはいけない．
````

````{admonition} 数学メモ：転置・対称・単位・直交行列
:class: tip, 
  行列 $\boldsymbol{A}$ の成分を $A_{ij}$ とするとき，その行列の成分の $i$ と $j$ をひっくり返した行列を**転置行列**といい， $\boldsymbol{A}^T$ で表す． $2\times 2$ の行列で陽に書いてみると，
  ```{math}
:label:
\begin{align}
    \boldsymbol{A} = \begin{pmatrix} A_{11} & A_{12} \\ A_{21} & A_{22} \end{pmatrix}
  \end{align}
```
  に対し，
  ```{math}
:label:
\begin{align}
    \boldsymbol{A}^T = \begin{pmatrix} A_{11} & A_{21} \\ A_{12} & A_{22} \end{pmatrix}
  \end{align}
```
  である．この定義により， $\boldsymbol{A}^T$ の $ij$ 成分は $(\boldsymbol{A}^T)_{ij}=A_{ji}$ である．もし $\boldsymbol{A}=\boldsymbol{A}^T$ であるならば，つまり取りうるすべての $i$ と $j$ に対して $A_{ij} = A_{ji}$ であるならば，行列 $\boldsymbol{A}$ は**対称行列**であるという．

  転置を取れるのは正方行列に限らない．ベクトル
  ```{math}
:label:
\begin{align}
    \boldsymbol{b} = \begin{pmatrix} b_1, b_2, b_3 \end{pmatrix}
  \end{align}
```
  の転置を取ると，
  ```{math}
:label:
\begin{align}
    \boldsymbol{b}^T = \begin{pmatrix} b_1\\ b_2\\ b_3 \end{pmatrix}
  \end{align}
```
  であり，転置によって横ベクトルを縦ベクトルに（あるいは縦ベクトルを横ベクトルに）変換することができる．

  本章で用いるベクトルのほとんどすべてが縦ベクトルであるが，文章中では紙面節約のために $\boldsymbol{c}=(c_1,c_2,c_3)^T$ のように，縦ベクトルを横ベクトルの転置として表現することがある．
  
  ---

  一般には行列同士の乗算の順序は変更できないが，単位行列
  ```{math}
:label:
\begin{align}
    \boldsymbol{I} = \begin{pmatrix}
      1 & 0 & 0 \\ 0  & 1 & 0 \\ 0 & 0 & 1
    \end{pmatrix}
  \end{align}
```
  は特別で，同じ大きさの行列 $\boldsymbol{A}$ に対して，
  ```{math}
:label:
\begin{align}
    \boldsymbol{AI} = \boldsymbol{IA} = \boldsymbol{A}
  \end{align}
```
  が成り立つ．単位行列は，その定義から明らかに $\boldsymbol{I}^T=\boldsymbol{I}^{-1}=\boldsymbol{I}$ でもある．ある行列の転置行列と逆行列が等しいとき，その行列を**直交行列**と呼ぶ．
````

ここまでで，物体の変形を測るために，相対位置ベクトル $\boldsymbol{d}$ だけ離れた2点の変形量の差を取り，平行移動を取り除いた成分 $\boldsymbol{\delta u}(\boldsymbol{x})$ を抽出した．
しかし，相対変位ベクトル $\boldsymbol{\delta u}(\boldsymbol{x})$ そのものは，変形を測る2点の位置関係 $\boldsymbol{d}$ のとり方に依存してしまう．
ある2点の位置を決めないと変形が測れないのでは，あらゆる場所の変形を表す指標としてはふさわしくないだろう．では， $\boldsymbol{J}$ 単独ではどうだろうか？

変形が $\boldsymbol{\delta u} = \boldsymbol{J}\boldsymbol{d}$ というふうに変形ベクトルと行列に分解されて表されたということは，「どんな相対位置ベクトル $\boldsymbol{d}$ に対しても，それを行列 $\boldsymbol{J}$ に作用させることによって，平行運動をキャンセルした成分 $\boldsymbol{\delta u}$ が得られる」ということを示してる．
つまり，変形の勾配（空間微分）からなる行列 $\boldsymbol{J}$ を知っていれば，あらゆる場所のあらゆる方向に対しての平行運動をキャンセルした成分を知ることができるのだ．
したがって， $\boldsymbol{J}$ のほうがあらゆる変形を表すのにより適した量である…のだが，「平行運動をキャンセルした」だけではまだ完成ではない．
次節ではこの行列 $\boldsymbol{J}$ についてもう少し調べていこう．

