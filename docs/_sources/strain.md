# ひずみと変形

弾性体では，物体全体が移動するだけでなく，変形することによって物体中の任意の2点間の相対位置が変化する．このような，弾性体内の任意の点の移動のことを，弾性体の**変位**という．
しかし，弾性体の変位のなかには，我々が扱いたい伸び・縮み・ねじれといった弾性体の**変形**だけでなく，マクロに見た弾性体全体の平行移動や回転が含まれてしまっている．そこで，変形を理解するためには，変位のなかから，本当に変形に寄与している成分だけを抽出することがまずは必要だ．

本節では，まず一般的な変位から**どのように物体の変形を表すか（ひずみの定義）** について学んだのち，ひずみを表す**ひずみテンソル**という量やその意味について学ぶ．

## 変位と変形

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


## ひずみと回転

```{figure} ./fig//deformation_J.png
:align: center
:width: 80%
:name: fig_deformation_J

行列 $\boldsymbol{J}$ で表現できる変形の例．(a)等方膨張，(b) 回転．いずれも実線で描かれた四角形が変形前の物体を，点線が変形後の物体を表す．矢印は変形前後四角形の頂点位置同士を結ぶ変位ベクトルである．
```

変形を表す $\boldsymbol{J}$ （以下ではこれを便宜上**変位勾配テンソル**と呼ぶ．**テンソル**という言葉は聞き慣れないだろうが，とりあえずは行列と同じようなものと思ってよい．）は，変位から平行移動成分を取り除いたものであった．しかし，このなかにもまだ真の変形ではない**回転**の効果が含まれてしまっている．
図{numref}`{number} <fig_deformation_J>`にある2つの物体（四角形）の移動・変形を模式的に表している．(a)は物体があらゆる方向に膨張しているので確かに物体が変形しているが，(b)は単に物体が角度 $\theta$ だけ回転しているだけで，変形はしていない．にもかかわらず，四角形の頂点位置における変位を表すベクトル（矢印）は互いに平行ではないので，前節で行った「近接2点間の変位の差を差し引く」という操作だけでは，回転成分は排除できない．

やや天下りだが，図{numref}`{number} <fig_deformation_J>`に描かれたような変形と回転は，変位が微小であるという条件のもとで，
```{math}
:label: eq:deform_example
\begin{align}
  \boldsymbol{J}_{(a)} = \left( \begin{matrix} a & 0 \\ 0 & a \end{matrix}\right) \quad (a>1), \qquad
  \boldsymbol{J}_{(b)} = \left( \begin{matrix} 1 & -\theta \\ \theta & 1 \end{matrix}\right)
\end{align}
```
のように表される．次の演習問題で確かめてみよう．

```{admonition} 演習問題：変位勾配テンソル
:class: 
  図{numref}`{number} <fig_deformation_basis>`のように $12$ 平面に左下の原点 $\boldsymbol{x}_0=(0,0)$ から四角形の各頂点までの3つの相対位置ベクトル $\boldsymbol{d}_1=(0,1)^T$ ,  $\boldsymbol{d}_2=(1,0)^T$ ,  $\boldsymbol{d}_3=(1,1)^T$ を変位勾配テンソル（式{eq}`eq:deform_example` の $\boldsymbol{J}_{(a)}$ ,  $\boldsymbol{J}_{(b)}$ ）に作用させて，図{numref}`{number} <fig_deformation_J>`(a), (b)のような変形が現れることを確認せよ．
  ただし，基準位置 $\boldsymbol{x}_0$ を原点に固定しているため，式{eq}`eq:deformation_matrix` において $\boldsymbol{u}(\boldsymbol{x}_0)=\boldsymbol{0}$ としている．
```


```{figure} ./fig//deform_basis.png
:align: center
:width: 60%
:name: fig_deformation_basis

図{numref}`{number} <fig_deformation_J>`の変形を確認するための単位四角形と左下点を原点とする3つの相対位置ベクトル $\boldsymbol{d}_i$   $(i=1,\cdots,3)$ の定義．
```

````{admonition} 数学ノート：回転行列
:class: tip
  より一般には，2次元で回転を表す行列は，回転角を $\theta$ として
  ```{math}
:label: eq:rotation_2d
\begin{align}
    \boldsymbol{R}=\left(\begin{matrix} \cos \theta & -\sin \theta \\ \sin \theta & \cos \theta \end{matrix} \right)
  \end{align}
```
  と書くことができる．
  この行列に，任意のベクトル $\boldsymbol{v}=(v_1, v_2)^T$ を作用させた結果得られるベクトルは， $\boldsymbol{v}$ と同じ長さで，かつ原点を中心として角度 $\theta$ だけ反時計回りに回転したものである．
````

````{admonition} 演習問題：微小回転近似
:class: 
  2次元の回転行列{eq}`eq:rotation_2d` において，回転角 $\theta$ の大きさが十分に小さいという条件（ $|\theta| \ll 1$ ）が満たされるときは， $\cos \theta \simeq 1$ ,  $\sin \theta \simeq \theta$ と近似できる．このとき，回転行列 $R$ は{eq}`eq:deform_example` の $\boldsymbol{J}_{(b)}$ に一致することを確かめよ．
````


````{admonition} 演習問題：回転行列
:class: 
   $\theta=\pi/4 $  に対する回転行列を以下のベクトルに作用させて，回転行列 $R$ が反時計回りの回転を意味していることを確認せよ．
  \begin{align*}
    \boldsymbol{v}_1 = \left(
    \begin{matrix}
      1 \\ 0 \\
    \end{matrix}  
    \right),
    \quad 
    \boldsymbol{v}_2 = \left(
      \begin{matrix}
        1/\sqrt{2} \\ 1/\sqrt{2} \\
      \end{matrix}  
      \right),
      \quad
      \boldsymbol{v}_3 = \left(
        \begin{matrix}
          0 \\ 1 \\
        \end{matrix}  
        \right)
  \end{align*}
````

````{admonition} 演習問題：ベクトルの回転
:class: 
  今，図のように $x_1$ -- $x_2$ 座標の原点を中心とする半径1の単位円上に，点 $\boldsymbol{r}_1$ と $\boldsymbol{r}_2$ がある．
  
  (i)  $\boldsymbol{r}_1$ と $\boldsymbol{r}_2$ の成分を，それぞれ角度 $\theta_1$ と $\theta_1+\theta_2$ に関した三角関数を用いて表せ．
  
  (ii) 点 $\boldsymbol{r}_2$ は， $\boldsymbol{r}_1$ が $\theta_2$ だけ回転したものであるから，角度 $\theta_2$ の回転行列を用いて
  ```{math}
:label:
\begin{align}
    \boldsymbol{r}_2= \left(\begin{matrix} \cos \theta_2 & -\sin \theta_2 \\ \sin \theta_2 & \cos \theta_2 \end{matrix} \right)\boldsymbol{r}_1
  \end{align}
```
  と表せる．この関係式に (i) の結果を代入することで，三角関数  $\sin(\theta_1+\theta_2)$ ,  $\cos(\theta_1+\theta_2)$ の加法定理を証明せよ．

```{figure} ./fig//rotation_ex.png
:align: center
:width: 80%
:name: fig:label

```
````



この結果を一般化すると，変位勾配テンソル $\boldsymbol{J}$ の成分 $J_{ij}$ を以下のように分割することで，真の変形と回転成分とを分離できるということが知られている：
```{math}
:label: eq:strain_rotation
\begin{align}
  J_{ij} \equiv \varepsilon_{ij} + \Omega_{ij} = \frac{1}{2} \left( \frac{\partial u_i}{ \partial x_j} +\frac{\partial u_j}{ \partial x_i} \right)
  +
  \frac{1}{2}\left( \frac{ \partial u_i}{\partial x_j} - \frac{\partial u_j}{\partial x_i} \right).
  \quad (i, j=1\cdots3)
\end{align}
```
この $\boldsymbol{\varepsilon}$ を**ひずみ（歪）テンソル**， $\boldsymbol{\Omega}$ を**回転テンソル**という（$\Omega$ はギリシャ文字 $\omega$ の大文字である．[ここ](./greek.md)にギリシャ文字の一覧があるので参考にしてほしい．）．
ひずみテンソルと回転テンソルの成分をすべて書き下すと，以下のようになる．
```{math}
:label: eq:strain_all
\begin{align}
  \boldsymbol{\varepsilon}
  =
  \left(
  \begin{matrix}
    \dfrac{ \partial u_1 }{ \partial x_1 }  &
    \dfrac{1}{2} \left(  \dfrac{ \partial u_1 }{ \partial x_2 } + \dfrac{ \partial u_2 }{ \partial x_1 } \right) &
    \dfrac{1}{2} \left(  \dfrac{ \partial u_3 }{ \partial x_1 } + \dfrac{ \partial u_1 }{ \partial x_3 } \right) \\
    \dfrac{1}{2} \left(  \dfrac{ \partial u_1 }{ \partial x_2 } + \dfrac{ \partial u_2 }{ \partial x_1 } \right) &
    \dfrac{ \partial u_2 }{ \partial x_2 }  &
    \dfrac{1}{2} \left(  \dfrac{ \partial u_2 }{ \partial x_3 } + \dfrac{ \partial u_3 }{ \partial x_2 } \right) \\
    \dfrac{1}{2} \left(  \dfrac{ \partial u_3 }{ \partial x_1 } + \dfrac{ \partial u_1 }{ \partial x_3 } \right) &
    \dfrac{1}{2} \left(  \dfrac{ \partial u_2 }{ \partial x_3 } + \dfrac{ \partial u_3 }{ \partial x_2 } \right) &
    \dfrac{ \partial u_3 }{ \partial x_3 } \\
  \end{matrix}
  \right)
  \end{align}
```
```{math}
:label: eq:rotation_all
\begin{align}
  \boldsymbol{\Omega}
  =
  \left(
  \begin{matrix}
    0  &
    \dfrac{1}{2} \left(  \dfrac{ \partial u_1 }{ \partial x_2 } - \dfrac{ \partial u_2 }{ \partial x_1 } \right) &
    \dfrac{1}{2} \left(  \dfrac{ \partial u_1 }{ \partial x_3 } - \dfrac{ \partial u_3 }{ \partial x_1 } \right) \\
    - \dfrac{1}{2} \left(  \dfrac{ \partial u_1 }{ \partial x_2 } - \dfrac{ \partial u_2 }{ \partial x_1 } \right) &
    0  &
    \dfrac{1}{2} \left(  \dfrac{ \partial u_2 }{ \partial x_3 } - \dfrac{ \partial u_3 }{ \partial x_2 } \right) \\
    -\dfrac{1}{2} \left(   \dfrac{\partial u_1 }{ \partial x_3 } - \dfrac{ \partial u_3 }{ \partial x_1 } \right) &
    -\dfrac{1}{2} \left(  \dfrac{ \partial u_2 }{ \partial x_3 } - \dfrac{ \partial u_3 }{ \partial x_2 } \right) &
    0 \\
  \end{matrix}
  \right)
\end{align}
```
ひずみテンソルは**対称テンソル**（ここでは対称行列と同じモノと思って構わない．）であり，


```{math}
:label: eq:strain_symmetry
\begin{align}
  \varepsilon_{ij}=\varepsilon_{ji}
\end{align}
```

の関係がある．
このことから，見た目は $3\times3$ の行列で書かれていても，独立な成分は（3次元の場合には）6つだけである．一方，回転テンソルは**反対称テンソル**で，
```{math}
:label: eq:rotation_antisymmetry
\begin{align}
  \Omega_{ij}=-\Omega_{ji}
\end{align}
```
の関係がある．反対称性を満たすため，対角成分はゼロ（ $\Omega_{ii}=0$ ）になる%
なぜなら，反対称性{eq}`eq:rotation_antisymmetry` を対角成分に適用してみると， $\Omega_{ii}=-\Omega_{ii}$ となるはずだ．この条件を満たせるのは $\Omega_{ii}=0$ のときだけなのだ．
そのため，3次元回転テンソルのうち独立な成分は3つだけである．

これで，変形から平行移動と回転を分離して,真の変形だけを抽出する事ができるようになった．
変形の一般式{eq}`eq:deformation_matrix` に{eq}`eq:strain_rotation` を代入すると，
```{math}
:label: 
\begin{align}
    \boldsymbol{u}(\boldsymbol{x})
  =
  \boldsymbol{u}(\boldsymbol{x_0}) +
  \boldsymbol{J} \boldsymbol{d}
  =
  \boldsymbol{u}(\boldsymbol{x_0}) +
  \boldsymbol{\Omega} \boldsymbol{d} +
  \boldsymbol{\varepsilon} \boldsymbol{d}   
\end{align}
```
が得られる．
右辺第1項は平行移動分，第2項は回転の寄与，そして最後の第3項 $\boldsymbol{\varepsilon} \boldsymbol{d}$ が真の変形を表している．
ひずみテンソルがわかっていれば，任意の微小距離間の相対位置ベクトル $\boldsymbol{d}$ をひずみテンソルに作用させることにより，変形が抽出できるのだ．

```{admonition} 演習問題：ひずみ・回転テンソルの定義と対称性
:class: 
  ひずみテンソルと回転テンソルの対称性{eq}`eq:strain_symmetry` と{eq}`eq:rotation_antisymmetry` を式{eq}`eq:strain_all` と{eq}`eq:rotation_all` から確認せよ．また，ひずみテンソルと回転テンソルの和が変位勾配テンソル $\boldsymbol{J}$ になることを，成分毎に確かめてみよう．
```

```{admonition} 演習問題：ひずみの計算
:class: 
   $x_1$ -- $x_2$ 空間の2次元の変位場が
  \begin{align*}
    \boldsymbol{u} = \left(
    \begin{matrix}
      -x_1 x_2 \\ x_1^2+x_2^2
    \end{matrix}
    \right)
  \end{align*}
  で与えられるとき，その変位場の2次元ひずみテンソル成分（ $\varepsilon_{11}$ ,  $\varepsilon_{12}$ ,  $\varepsilon_{22}$ ）を求めよ．
```

```{admonition} 演習問題：3次元中の2次元変位
:class: 
  前の演習問題で「2次元の変位場」という表現が出てきた．これは厳密には「変位の $x_3$ 成分がゼロ（ $u_3=0$ ）」かつ「変位量が $x_3$ 方向に変化しない」ということである．

  後者の条件は， $x_3$ 方向への微分がすべてゼロである（変化しないから）ことを意味している．そのため，2次元の変形（ $x_3$ 方向に変化しない媒質の変形）の歪テンソルや回転テンソルは，成分の範囲が $i,j=1,2$ だけの $2\times 2$ の行列形式で表される．

  このことを踏まえてひずみテンソルの定義に立ち返り， $x_1$ -- $x_2$ 空間の2次元の変形の場合，ひずみテンソルの $\varepsilon_{11}$ ,  $\varepsilon_{12}$ ,  $\varepsilon_{22}$ 以外の成分がすべてゼロになることを確かめよ．
```

```{admonition} 演習問題：2次元空間のひずみ・回転テンソル
:class: 
   $x_1$ -- $x_2$ 面の2次元のひずみテンソルと回転テンソルの独立成分はそれぞれいくつあるか？
```

## ひずみテンソルの直感的意味


簡単な例で，ひずみテンソルの成分の意味を考えてみよう．

### 法線ひずみ

まず， $\partial u_1/\partial x_1 > 0 $ であり，かつほかの変位の空間微分がゼロの場合を考える．
このとき，ひずみテンソルは $11$ 成分だけ値を持つ：
```{math}
:label:
\begin{align}
  \varepsilon_{11} = \frac{\partial u_1}{\partial x_1}, \quad \varepsilon_{12} = \varepsilon_{22} = 0. 
\end{align}
```
この場合の変位は回転成分を持たないので，変形は
```{math}
:label:
\begin{align}
  \boldsymbol{J}\boldsymbol{d} =  \boldsymbol{\varepsilon}\boldsymbol{d} = \left( \begin{matrix} \varepsilon_{11} d_1 \\ 0 \end{matrix} \right)
  = \left( \begin{matrix} (\partial u_1/\partial x_1) d_1 \\ 0 \end{matrix} \right)
\end{align}
```
と表される．つまり， $x_2$ 方向には一切変形が起きず， $x_1$ 方向に伸びていく（$ \partial u_1/\partial x_1 > 0$ なので変形量はプラスである．）のだ．もしひずみ成分 $\varepsilon_{11}$ が一定であれば，距離 $d_1$ が大きいほど，伸びの量が大きくなる．
この変形を模式的に表したのが図{numref}`{number} <fig_strain_example>`(a)で，
この図は，辺長 $L$ の正方形を，左端を固定して $x_1$ 方向に引張ったときの一様な変形を表している．
正方形は引張によって $x_1$ 方向に伸びるが，その伸びの変形量は左端の固定端ではゼロで， $x_1$ が大きくなるにつれてだんだん大きくなっていく．
このように，ひずみテンソルのうち対角成分（ $\varepsilon_{11}, \varepsilon_{22}, \varepsilon_{33}$ ）は，それぞれの方向への伸び縮みを表す指標であり，これを **法線ひずみ（あるいは垂直ひずみ; normal strain）** と呼ぶ．ひずみ（あるいは変形の微分量）は，図{numref}`{number} <fig_strain_example>`(a)下部のグラフにあるように，**変形の距離あたりの傾き**（あるいは単位距離あたりの変形量）と解釈できるだろう．逆に，離れた2点においてそれぞれ変形量がわかれば，その間の平均的なひずみは，
```{math}
:label:
\begin{align}
  \mathsf{平均ひずみ} \simeq \frac{\mathsf{（変形量）}}{\mathsf{（2点間の距離）}}
\end{align}
```
で概算することができるのだ．

```{figure} ./fig/strain_example.png
:align: center
:width: 95%
:name: fig_strain_example

2次元 $12$ 平面における変形の例．それぞれ(a) 伸長 (b) 剪断の場合．
```

```{admonition} 演習問題：地殻変動によるひずみの概算
:class: 
   $x_1$ 軸上にあり，200 km 離れた2点A, Bを考える．地殻変動により，点Aが $x_1$ 軸上に沿って+1 m，点Bが+5 mそれぞれ移動したとき，この点AB間の平均的な法線ひずみ量を求めよ．分母と分子で単位が異なるので注意すること． $1$  km =  $10^3$  m による換算が必要である．
```

### 体積ひずみ
法線ひずみ成分の和
```{math}
:label:
\begin{align}
  \theta = \varepsilon_{11} + \varepsilon_{22} + \varepsilon_{33}  =
  \dfrac{ \partial u_1 }{ \partial x_1 }  + 
  \dfrac{ \partial u_2 }{ \partial x_2 }  + 
  \dfrac{ \partial u_3 }{ \partial x_3 }  = \nabla \cdot \boldsymbol{u}
\end{align}
```
は**体積ひずみ**と呼ばれ，単位体積あたりの体積の変化量を表している．
一方向の法線ひずみ成分（ $\partial u_i / \partial x_i$ ）は座標軸に沿った方向の伸び縮みを表しているので，各方向への法線ひずみによって， $x_1, x_2, x_3$ 方向の長さがそれぞれ $(1+\varepsilon_{11}), (1+\varepsilon_{22}), (1+\varepsilon_{33})$ 倍になったとしよう．そのときの体積の変化量は
```{math}
:label: 
\begin{multline}
  (1+\varepsilon_{11})(1+\varepsilon_{22})(1+\varepsilon_{33}) \\
  = 1 + \varepsilon_{11} + \varepsilon_{22} + \varepsilon_{33} +   \varepsilon_{11} \varepsilon_{22} + \varepsilon_{22} \varepsilon_{33} + \varepsilon_{33} \varepsilon_{11} + \varepsilon_{11} \varepsilon_{22} \varepsilon_{33}
  \\
  \simeq 1 + \varepsilon_{11} + \varepsilon_{22} + \varepsilon_{33}
  = 1 + \theta
\end{multline}
```
である．ただし，ひずみは微小量であることから，微小量なひずみ同士の積はさらに小さく無視できることを用いた．
このことから，変形が微小なときには体積ひずみが変形による体積変化量を表していることが確認できる．


### 剪断ひずみ



次に， $\partial u_2/\partial x_1>0$ で，ほかの変位の微分が全てゼロの場合を考えよう．このときのひずみテンソルは，
```{math}
:label:
\begin{align}
  \varepsilon_{12} = \varepsilon_{21}= \frac{1}{2} \frac{\partial u_2}{\partial x_1}, \quad \varepsilon_{11} = \varepsilon_{22} = 0
\end{align}
```
である．回転を含めた変形は
```{math}
:label:
\begin{align}
  \boldsymbol{J}\boldsymbol{d} = \left( \begin{matrix} 0 \\ (\partial u_2/\partial x_1) d_1 \end{matrix} \right)
\end{align}
```
であり，その変形は図{numref}`{number} <fig_strain_example>`(b)のように表される． $x_1$ が増大するにつれて $x_2$ の正方向に変形していくため，物体がねじれているのがわかるだろう．このような変形のことを，**剪断**（せんだん）と呼ぶ．ここでも，変位の空間微分量（図下部のグラフ）が単位距離あたりの変形量になっている．

ところで，図{numref}`{number} <fig_strain_example>`(b)の変形は，純粋な変形だけを表しているだろうか？ $x_1$ が大きくなるほど（グラフで右にいくほど） $x_2$ 方向の変形が大きくなる（グラフで上向きに変位する）．ということは，この物体は全体として左回りに回転してしまっている．

実際，変位勾配テンソルのかわりにひずみテンソルを用いて回転成分を取り除いたひずみを計算すると，
```{math}
:label:
\begin{align}
  \boldsymbol{\varepsilon}\boldsymbol{d} = \left( \begin{matrix} \varepsilon_{12} d_2 \\ \varepsilon_{12} d_1 \end{matrix} \right)
  =\frac{1}{2} \left( \begin{matrix} (\partial u_2/\partial x_1) d_1 \\ (\partial u_2/\partial x_1) d_2 \end{matrix} \right)
\end{align}
```
のように， $x_1$ 成分の変位も生じる．この変形前後の形を比較したのが図{numref}`{number} <fig_strain_example2>`(a)と図{numref}`{number} <fig_strain_example2>`(c)だ．
図{numref}`{number} <fig_strain_example>`(b)の変形をすこし右回りに回転することで，純粋な変形だけが抽出された（図{numref}`{number} <fig_strain_example2>`(c)．
しかしそうすると，もし図{numref}`{number} <fig_strain_example2>`(b)のような変形があったとしても，回転成分を取り去ると，図{numref}`{number} <fig_strain_example2>`(c)に一致してしまう．
図{numref}`{number} <fig_strain_example2>`(b)の変形は $\partial u_1/\partial x_2>0$ のときに生じるが，これは $\partial u_2 / \partial x_1>0$ の変形と，ひずみの上では区別できないのだ．そのことはひずみテンソルの第 $12$ 成分の定義が
```{math}
:label:
\begin{align}
  \varepsilon_{12} = \frac{1}{2} \left( \frac{\partial u_1}{\partial x_2} + \frac{\partial u_2}{\partial x_1} \right)
\end{align}
```
であることからも確認できる． $\partial u_1/\partial x_2$ と $\partial u_2/\partial x_1$ のどちらが変形に寄与したとしても，回転成分を取り去れば，残される変形は同じなのだ．

```{figure} ./fig/strain_example2.png
:align: center
:width: 80%
:name: fig_strain_example2

図{numref}`{number} <fig_strain_example>`(b)で表される剪断変形に等価な3つのパターン．(c)だけが回転成分をもたない純粋な変形成分である．
```

いずれにしても，ひずみテンソルの非対角成分は，剪断変形を表している．
これらの成分のことを **剪断ひずみ（shear strain）** と呼ぶ．定義により，ひずみテンソルの成分は，法線ひずみか剪断ひずみかのどちらかに分類されることになる．

まとめると，どちらの例からもひずみテンソル $\varepsilon_{ij}$ は，$i$ 方向の座標軸からみた $j$ 方向への変形の単位距離あたりの大きさ（あるいは距離に対する傾き）である ，ということができる．
ただし，ひずみテンソルは対称性 $\varepsilon_{ij}=\varepsilon_{ji}$ があるため， $i\neq j$ の場合は図{numref}`{number} <fig_strain_example2>`(b)のように勾配は半分になり，そのかわりに $j$ 方向の座標軸からみた $i$ 方向の変形にも同じひずみが現れるのだ．


```{admonition} 演習問題：ひずみテンソルと物体の変形
:class: 
  2次元空間において，変形によって以下のようなひずみテンソルで表されるようなひずみが生じたとする．
  \begin{align*}
    \boldsymbol{\varepsilon}_1 = \left(
    \begin{matrix}
    -a & 0\\
    0 & 0
  \end{matrix}
        \right), \quad
    \boldsymbol{\varepsilon}_{2} = \left(
        \begin{matrix}
          a & b\\
          b & 0
        \end{matrix}
              \right)
  \end{align*}
  このとき，単位辺長の正方形はどのように変形されるだろうか．図{numref}`{number} <fig_strain_example>`にならってそれぞれ図示せよ．ただし $a$ ,  $b$ は十分に小さい正の数とする．
```

## ひずみテンソルによる変形場

ここまでのまとめとして，ひずみテンソルが与えられた場において， $x_1$ -- $x_2$ 面内における任意の点がどう変形するかを図{numref}`{number} <fig_strain_field>`に示す．法線ひずみ $\varepsilon_{11}, \varepsilon_{22}$ はそれぞれ $x_1$ （図{numref}`{number} <fig_strain_field>`a）と $x_2$ （図{numref}`{number} <fig_strain_field>`b）方向に引き伸ばされるように変形を受け\footnote{もちろん， $\varepsilon_{ii}<0$ の場合には逆に縮む方向に変形を受ける．}，その両成分が等しい場合（図{numref}`{number} <fig_strain_field>`c）には全体として媒質が膨張するように変形する．一方，剪断ひずみ成分のみが存在する場合（図{numref}`{number} <fig_strain_field>`d）には，物体がねじれるように変形している．この図をよく見ると，変形によって右上―左下方向には引き伸ばされ，右下―左上方向には圧縮されていることがわかるだろう．それらの変形が互いに打ち消しあうことによって，剪断ひずみによる変形では体積が変化しないのだ．また，図の中心から左右（ $x_1$ ）方向を見ると，媒質が反時計回りに回転しているかのように見えるが，上下（ $x_2$ ）方向は時計回りに変位していて，媒質全体としては回転していないこともわかるだろう．

```{figure} ./fig/strain_field.png
:align: center
:width: 95%
:name: fig_strain_field

ひずみテンソルによる変形場の例．いずれも中心点を基準位置としたときに， $x_1$ -- $x_2$ 面内の各点がうける変形をベクトル（矢印）で示した．
```