# 主応力・主ひずみと座標回転

## ひずみ・応力の固有値問題

これまでに導入されたひずみテンソルは，弾性体内の2点間の相対位置ベクトル $\boldsymbol{d}$ を与えると，その間の（回転を除いた）変形 $\boldsymbol{u}$ が得られるもの
```{math}
:label: 
\begin{align}
  \boldsymbol{u} = \boldsymbol{\varepsilon} \boldsymbol{d} \quad \mathsf{あるいは} \quad  u_i = \sum_{j=1}^3 \varepsilon_{ij} d_j
\end{align}
```
で，応力テンソルは面の法線ベクトル $\hat{\boldsymbol{n}}$ を与えると，その面にかかるトラクション $\boldsymbol{T}^{(\hat{\boldsymbol{n}})}$ が得られるもの
```{math}
:label: eq:cauchy_2
\begin{align}
  \boldsymbol{T}^{(\hat{\boldsymbol{n}})} = \boldsymbol{\sigma} \hat{\boldsymbol{n}} \quad \mathsf{あるいは} \quad  T_i^{(\hat{\boldsymbol{n}})} = \sum_{j=1}^3 \sigma_{ij} \hat{n}_j
\end{align}
```
であった．この関係は，いずれもあるベクトル（ $\boldsymbol{d}$ ,  $\hat{\boldsymbol{n}}$ ）を別のベクトル（ $\boldsymbol{u}$ ,  $\boldsymbol{T}^{(\hat{\boldsymbol{n}})}$ ）に変換（写像）するもの，とやや抽象的に捉えることができる．また，この変換は，**線形**であるという顕著な特徴を持つ．
````{admonition} 数学メモ：線形性
:class: tip,
ある関数 $f(x)$ が**線形**であるとは，変数 $a$ ,  $b$ と定数 $k$ に対して以下の2つの条件を満たすことを言う．
```{math}
:label: eq:linearity_1
\begin{align}
  \begin{split}
    &f(a+b) = f(a) + f(b)
    \\
    &f(ka) = k f(a)      
  \end{split}
\end{align}
```
たとえば， $f(x)=3x$ は線形だが， $f(x)=\sin(x)$ は線形ではない．
````
````{admonition} 演習：線形性の確認
:class: 
  以下の関数は線形だろうか？定義を満たすかどうかを確かめて判定せよ．

  (i)  $f(x) = 3 x + 4$  

  (ii)  $f(x) = e^x$  
  
  (iii)  $f(x) = x^2 + 3x  + 1$ 
````
````{admonition} 数学メモ：線形変換
:class: tip,
ベクトルをベクトルに変換する関数 $\boldsymbol{y} = \boldsymbol{f}(\boldsymbol{x})$ が，線形性を満たす，すなわち
```{math}
:label: eq:linearity_2
\begin{align}
\begin{split}
  &\boldsymbol{f}(\boldsymbol{a}+\boldsymbol{b})=\boldsymbol{f}(\boldsymbol{a})+\boldsymbol{f}(\boldsymbol{b})\\
  &\boldsymbol{f}(k \boldsymbol{a}) = k \boldsymbol{f}(\boldsymbol{a})  
\end{split}
\end{align}
```
であるとき，この $\boldsymbol{f}$ のことをベクトルの線形変換という．ベクトルの線形変換は2階のテンソル $\boldsymbol{A}$ を用いて，必ず
```{math}
:label: 
\begin{align}
  \boldsymbol{y} = \boldsymbol{f}(\boldsymbol{x}) = \boldsymbol{A}\boldsymbol{x}
\end{align}
```
と書くことができる．
````
````{admonition} 演習：線形変換とテンソル
:class: 
  (i) もし関数 $\boldsymbol{f}$ が  $ \boldsymbol{y} = \boldsymbol{f}(\boldsymbol{x})  = \boldsymbol{A}\boldsymbol{x}$  と書けるとき，その右辺が線形性{eq}`eq:linearity_2`を満たすことを示せ．

  (ii) 任意のベクトル  $\boldsymbol{x} = (x_1, x_2, x_3)$ は，各軸方向の単位ベクトル（法線ベクトルに等しい）を用いて， $\boldsymbol{x} = x_1 \hat{\boldsymbol{n}}_1 + x_2 \hat{\boldsymbol{n}}_2  + x_3 \hat{\boldsymbol{n}}_3$ と表すことができる．法線ベクトルの定義{eq}`eq:normalvector_definition`からこのことを確認せよ．
  
  (iii) 前問で得られた関係式を線形性の定義に代入することにより， $\boldsymbol{f}(\boldsymbol{x})=x_1 \boldsymbol{f}(\hat{\boldsymbol{n}}_1 ) + x_2 \boldsymbol{f}(\hat{\boldsymbol{n}}_2 ) + x_3 \boldsymbol{f}(\hat{\boldsymbol{n}}_3 ) $ であることを示せ．

  (iv) 関数値 $\boldsymbol{y}=\boldsymbol{f}(\hat{\boldsymbol{n}}_j )$ の成分を，テンソル成分を用いて $y_i = f_i(\hat{\boldsymbol{n}}_j ) \equiv A_{ij}$ と置く．この置き換えにより，任意の線形変換 $\boldsymbol{f}(\boldsymbol{x})$ がテンソル $\boldsymbol{A}$ を用いて $ \boldsymbol{f}(\boldsymbol{x}) = \boldsymbol{A}\boldsymbol{x}$ と書けることを証明せよ．
````

以下では，これら2つの線形変換のうち応力テンソルを例にとり，かつ $x_1$ -- $x_2$ 面内の2次元問題を考えることにしよう．2次元面内では，{eq}`eq:cauchy_2`は
```{math}
:label: eq:linear_normal_traction
\begin{align}
  \begin{pmatrix}
    T_1^{(\hat{\boldsymbol{n}})} \\
    T_2^{(\hat{\boldsymbol{n}})} \\
  \end{pmatrix}
  =
  \begin{pmatrix}
    \sigma_{11} & \sigma_{12}\\\sigma_{12} & \sigma_{22}
  \end{pmatrix}
  \begin{pmatrix}
    \hat{n}_1\\\hat{n}_2
  \end{pmatrix}
\end{align}
```
と書ける．

すでに学んだように，トラクションベクトルは単位面積あたりの面力であり，弾性体ではその方向は面に垂直（法線ベクトル $\hat{\boldsymbol{n}}$ に平行）とは限らない．もしトラクションベクトルが法線ベクトルに平行であるならば，関係{eq}`eq:linear_normal_traction`はもっとずっと簡単に
```{math}
:label: eq:linear_normal_traction_special
\begin{align}
  \begin{pmatrix}
    T_1^{(\hat{\boldsymbol{n}})} \\
    T_2^{(\hat{\boldsymbol{n}})} \\
  \end{pmatrix}
  =
  \lambda 
  \begin{pmatrix}
    \hat{n}_1\\\hat{n}_2
  \end{pmatrix}  
\end{align}
```
と書けるはずだ．ここで $\lambda$ は成分をもつ応力テンソルではなく，ただのスカラー量だ（慣例により $\lambda$ を使っているが，ラメの定数とはなんの関係もない．）．この関係{eq}`eq:linear_normal_traction_special`は，たとえば粘性のない水中では成立している．水中では圧力 $p$ と法線ベクトルはつねに平行で， $\lambda = -p$ である．固体中では一般には剪断応力成分（この場合は $\sigma_{12}$ ）が存在するため，{eq}`eq:linear_normal_traction_special`は一般には成立しない…のだが，実は，固体中でも{eq}`eq:linear_normal_traction_special`が成立する特別な方向 $\boldsymbol{\hat{n}}$ が必ず存在する．そのような特別な方向では，{eq}`eq:linear_normal_traction`と{eq}`eq:linear_normal_traction_special`から
```{math}
:label: eq:eigen_stress
\begin{align}
  \begin{pmatrix}
    \sigma_{11} & \sigma_{12}\\\sigma_{12} & \sigma_{22}
  \end{pmatrix}
  \begin{pmatrix}
    \hat{n}_1\\\hat{n}_2
  \end{pmatrix}
  = 
  \lambda 
  \begin{pmatrix}
    \hat{n}_1\\\hat{n}_2
  \end{pmatrix}  
\end{align}
```
が成立しているはずだ．
この関係{eq}`eq:linear_normal_traction_special`は，数学的にはテンソル $\boldsymbol{\sigma}$ の**固有値問題**に相当する．以下では，この問題を解きつつ，それがどういう物理的意味を持つのかを詳しく調べていくことにしよう．

````{admonition} 数学メモ：固有値・固有ベクトル
:class: tip,
  行列（あるいは2階のテンソル） $\boldsymbol{A}$ とベクトル $\boldsymbol{x}$ が，スカラー量 $\lambda$ に対して
  ```{math}
:label: 
\begin{align}
    \boldsymbol{A}\boldsymbol{x} = \lambda \boldsymbol{x}
  \end{align}
```
  なる関係を満たすとき， $\lambda$ を**固有値**， $\boldsymbol{x}$ を**固有ベクトル**という．この関係式から，それを満たす固有値と固有ベクトルを推定する問題のことを，**固有値問題**という．
````

## 応力テンソルの固有値
それでは，{eq}`eq:eigen_stress`を解いてみよう．右辺を左辺に移項すると，
```{math}
:label: eq:eigenproblem_stress
\begin{align}
  \begin{pmatrix}
    \sigma_{11} -\lambda & \sigma_{12}\\\sigma_{12} & \sigma_{22} -\lambda
  \end{pmatrix}
  \begin{pmatrix}
    \hat{n}_1\\\hat{n}_2
  \end{pmatrix}
  = 
  \begin{pmatrix}
    0\\0
  \end{pmatrix}
\end{align}
```
が得られる．あるいは，行列とベクトルの積を展開して
```{math}
:label: 
\begin{align}
  \begin{split}
    &\left(\sigma_{11} -\lambda\right)\hat{n}_1 + \sigma_{12} \hat{n}_2 = 0 \\
    & \sigma_{12} \hat{n}_1 + \left(\sigma_{22} -\lambda\right)\hat{n}_2 = 0      
  \end{split}
\end{align}
```
と書いてもよいだろう．これを $\hat{n}_1$ と $\hat{n}_2$ に関する連立方程式としてみると，その連立方程式には**自明な解**（trivial solution）として， $\hat{n}_1=\hat{n}_2=0$ がある．代入してみれば，これが解として成立しているのは明らかだ．

だが，その自明な解に物理的な意味があるだろうか？ベクトル $\hat{\boldsymbol{n}}$ もともとの意味は，面の法線ベクトルであった．法線ベクトルは長さが1のベクトルで， $x_1$ 軸からの角度を $\theta$ として
```{math}
:label: eq:normal_base_theta
\begin{align}
  \hat{\boldsymbol{n}} = \begin{pmatrix}\hat{n}_1 \\\hat{n}_2 \end{pmatrix} = 
    \begin{pmatrix}
      \cos\theta \\ \sin \theta 
    \end{pmatrix}
\end{align}
```
と書けるはずだ．しかし，この表現と $\hat{n}_1=\hat{n}_2=0$ を同時に満たす $\theta$ は存在しない．そんな法線ベクトルは存在できないのだ．したがって，自明解は我々の求める物理的に意味のある解ではないのだ．それでは，他に**自明ではない**解は存在しないのだろうか？

実は，連立方程式の係数が「ある条件」を満たせば，それ以外の解を持ちえる．
具体的かつ簡単な例を考えよう．連立方程式
```{math}
:label: 
\begin{align}
  \begin{pmatrix}
    1 & 2 \\ 1 & - 2
  \end{pmatrix}
  \begin{pmatrix}
    x \\ y
  \end{pmatrix}
  = 
  \begin{pmatrix}
    0\\0
  \end{pmatrix}
\end{align}
```
は， $x=y=0$ しか解を持たない．では，次はどうだろうか？
```{math}
:label: 
\begin{align}
  \begin{pmatrix}
    1 & 2 \\ 2 & 4
  \end{pmatrix}
  \begin{pmatrix}
    x \\ y
  \end{pmatrix}
  = 
  \begin{pmatrix}
    0\\0
  \end{pmatrix}
\end{align}
```
これも同じ形式を持つ方程式だから $x=y=0$ かというと，それは**解の一部**に過ぎない．
この方程式を展開してみると
```{math}
:label: 
\begin{align}\begin{split}
  x + 2y = 0 \\
  2x + 4 y = 0
\end{split}  
\end{align}
```
であるが，その2式目の両辺を2で割ると，1式目とまったく同じだ．
ということは，これは連立方程式のふりをしているが，実は一つの方程式
```{math}
:label: 
\begin{align}
  x + 2 y = 0
\end{align}
```
が2回書かれているだけなのだ．そこから導かれるのは
```{math}
:label: 
\begin{align}
  x = - 2 y 
\end{align}
```
という**関係性**だけであり，唯一解は存在しない．もちろん $x=y=0$ はこの関係性を満たしいるので，解のひとつではある．だが， $x=1, y=-2$ でも， $x=2, y=-4$ でも同様に同じ方程式を満たしているのだ．このような解を**非自明な解**と呼ぶ．連立方程式が唯一解を持つかどうかは，係数行列の**行列式**から判別できる．

````{admonition} 数学メモ：逆行列と連立方程式
:class: tip,{inverse-matrix}
行列 $\boldsymbol{A}$ を係数にもつ連立方程式
```{math}
:label: eq:linear-matrix
\begin{align}
\boldsymbol{A} \boldsymbol{x} = \boldsymbol{b}
\end{align}
```
が唯一の解を持つとき，行列 $\boldsymbol{A}$ は逆行列を持つ．このとき行列 $\boldsymbol{A}$ が**正則である**という．逆行列 $\boldsymbol{A}^{-1}$ は
```{math}
:label: 
\begin{align}
  \boldsymbol{A}^{-1} \boldsymbol{A} = \boldsymbol{A}  \boldsymbol{A}^{-1} = \boldsymbol{I}
\end{align}
```
を満たす行列（ただし $\boldsymbol{I}$ は単位行列）で，このとき連立方程式の解は
```{math}
:label: eq:linear-matrix-sol
\begin{align}
  \boldsymbol{x} = \boldsymbol{A}^{-1} \boldsymbol{b}
\end{align}
```
と書ける．また，行列 $\boldsymbol{A}$ が逆行列を持つ条件は，その行列式 $\det(\boldsymbol{A})$ がゼロではないことである．

逆に， $\det(\boldsymbol{A})=0$ のとき，その行列を係数としてもつ定数項がゼロの連立方程式 $\boldsymbol{A} \boldsymbol{x} = \boldsymbol{0}$ は非自明な解を持つ．
````
````{admonition} 数学メモ：行列式と逆行列
:class: tip,
行列式は2次元の行列
```{math}
:label: 
\begin{align}
  \boldsymbol{A} = \begin{pmatrix}
    a & b \\ c & d
  \end{pmatrix}
\end{align}
```
に対しては $\det(\boldsymbol{A}) = ad-bc$ ，3次元の行列
```{math}
:label: 
\begin{align}
  \boldsymbol{A} = \begin{pmatrix}
    a & b &c \\ d & e & f \\ 
    g & h & i
  \end{pmatrix}
\end{align}
```
に対しては， $\det(\boldsymbol{A}) =aei+bfg+cdh-ceg - afh-bdi$ である．2次元の場合の逆行列は
```{math}
:label: 
\begin{align}
  \boldsymbol{A}^{-1} = \frac{1}{\det(\boldsymbol{A})} \begin{pmatrix}
    d & -b \\ -c & a
  \end{pmatrix}
\end{align}
```
と表される．
````

````{admonition} 演習：逆行列
:class: 
  (i) {eq}`eq:linear-matrix`の両辺に左から $\boldsymbol{A}^{-1}$ を掛けることによって，{eq}`eq:linear-matrix-sol`を証明せよ．
  
  (ii) 次の連立方程式が唯一解を持つかどうかを判別せよ．解をもつ場合には係数行列の逆行列と，連立方程式の解を求めよ．
  \begin{align*}
    \begin{pmatrix}
      3 & 5 \\ 7 & 9
    \end{pmatrix}
    \begin{pmatrix}
      x \\ y 
    \end{pmatrix}
    =
    \begin{pmatrix}
      1 \\ 2
    \end{pmatrix}, 
    \qquad
    \begin{pmatrix}
      13 & -27 \\ -91 & 189
    \end{pmatrix}
    \begin{pmatrix}
      x \\ y 
    \end{pmatrix}
    =
    \begin{pmatrix}
      0 \\ 0
    \end{pmatrix}
  \end{align*}
````

もし，固有値問題{eq}`eq:eigenproblem_stress`の係数行列の行列式がゼロであれば，この連立方程式が非自明な解をもつ，すなわち $\hat{\boldsymbol{n}}=\boldsymbol{0}$ 以外の物理的に意味を持つ解を持てるということになる．そのときに必要とされる条件は，
```{math}
:label: eq:stress_eigen_eq
\begin{align}
  \det\begin{pmatrix}
    \sigma_{11} -\lambda & \sigma_{12}\\\sigma_{12} & \sigma_{22} -\lambda    
  \end{pmatrix} = 
  \left(\sigma_{11} -\lambda \right)  \left( \sigma_{22} -\lambda\right) - \sigma_{12}^2 = 0
\end{align}
```
である．このような固有値問題の係数行列の行列式をゼロにする方程式のことを，**固有方程式**と呼ぶ．
これは固有値 $\lambda$ に関する2次方程式であるから，実数の解は最大で2つある．2次方程式の解の公式によると，それらは
```{math}
:label: 
\begin{align}
  \lambda = \frac{1}{2} \left( 
  \sigma_{11}+ \sigma_{22} \pm \sqrt{
   (\sigma_{11}+\sigma_{22})^2
   - 4 (\sigma_{11}\sigma_{22}- \sigma_{12}^2)
  }
  \right)
\end{align}
```
であり，さらに整理すると，
```{math}
:label: eq:stress_eigenvalue
\begin{align}
  \lambda = \frac{\sigma_{11}+\sigma_{22}}{2} \pm \sqrt{
  \left(\frac{\sigma_{11}-\sigma_{22}}{2}\right)^2 + \sigma_{12}^2
  }
\end{align}
```
と表される．一般に，2次方程式の実数解の個数は根号内（判別式）の符号によって定まり，解が常に2つあるとは限らない．しかしこの場合は，根号内は2つの実数の組の2乗和であるので必ず正の値を取るから，**応力テンソルの固有値は常に2つ存在する**ことが言える．
````{admonition} 演習：応力テンソルの固有値
:class: 
  2次方程式{eq}`eq:stress_eigen_eq`の解が{eq}`eq:stress_eigenvalue`であることを証明せよ．
````

ひとたび固有値が求まれば，その固有値をもとの固有値問題に代入し，その方程式を満たす固有ベクトルを求めることができる．ただし，方程式は**非自明**であり唯一の解を持たないので，その方程式を満たす固有ベクトルが一つ求まると，その定数倍もまた固有ベクトルになることに注意が必要である．
今回の場合は，固有ベクトルが**法線ベクトル**であるという物理的な制約条件があるので，長さが1になるような固有ベクトルを代表に選ぶことにしよう．さらに，そのベクトルは（0でなければ）角度 $\theta$ を用いて{eq}`eq:normal_base_theta`のように書けるはずだ．したがって，固有値問題は{eq}`eq:stress_eigenvalue`の2つの解をそれぞれ $\lambda_1$ ,  $\lambda_2$ として，
  ```{math}
:label: eq:eigen_eq0
\begin{align}
    \begin{split}
  \begin{pmatrix} \sigma_{11} & \sigma_{12} \\ \sigma_{12} & \sigma_{22} \end{pmatrix} 
  \begin{pmatrix} \cos \theta_1 \\ \sin \theta_1 \end{pmatrix}
    =
  \lambda_1
  \begin{pmatrix} \cos \theta_1 \\ \sin \theta_1 \end{pmatrix}
  \\      
\begin{pmatrix} \sigma_{11} & \sigma_{12} \\ \sigma_{12} & \sigma_{22} \end{pmatrix} 
\begin{pmatrix} \cos \theta_2 \\ \sin \theta_2 \end{pmatrix}
  =
\lambda_2
\begin{pmatrix} \cos \theta_2 \\ \sin \theta_2 \end{pmatrix}
      \end{split}
\end{align}
```
と，角度 $\theta_1$ ,  $\theta_2$ を用いて表すことができる．ここで，
```{math}
:label: eq:eigenvector
\begin{align}
\hat{\boldsymbol{n}}_{1} \equiv \begin{pmatrix} \cos \theta_1 \\ \sin \theta_1 \end{pmatrix} ,
\hat{\boldsymbol{n}}_{2} \equiv \begin{pmatrix} \cos \theta_2 \\ \sin \theta_2 \end{pmatrix}
\end{align}
```
がこの問題の固有ベクトルだ．長さが $|\hat{\boldsymbol{n}}_{1}|=|\hat{\boldsymbol{n}}_{2}|=1$ に規格化されているので，かならず角度変数を用いて{eq}`eq:eigenvector`のように書くことができるのだ．

````{admonition} 演習：固有ベクトルの角度変数表示
:class: 
  ベクトル $\hat{\boldsymbol{n}}=(\hat{n}_1,\hat{n}_2)^T$ の長さが1である（ $|\hat{\boldsymbol{n}}|=1$ ）であるとする．このとき，
  ```{math}
:label: 
\begin{align}
    \tan \theta =  \hat{n}_2/\hat{n}_1 
  \end{align}
```
  を満たす角度 $\theta$ を用いて
  ```{math}
:label: 
\begin{align}
    \hat{n}_1 = \cos \theta, \quad \hat{n}_2 = \sin \theta
  \end{align}
```
  と表せることを図示によって示せ．
````

## 固有ベクトルの特徴

固有値・固有ベクトルの満たす関係式を成分で表現すると，
```{math}
:label: eq:eigeneq
\begin{align}
  \sum_{j=1}^2 \sigma_{ij} \hat{n}_{1j} = \lambda_1 \hat{n}_{1i}, \quad \sum_{j=1}^2 \sigma_{ij} \hat{n}_{2j} = \lambda_2 \hat{n}_{2i}
\end{align}
```
である．天下りな操作だが，{eq}`eq:eigeneq`の第1式と $\hat{\boldsymbol{n}}_2$ との内積を取ってみると，
```{math}
:label: eq:eigenvector_innerproduct
\begin{align}
  \sum_{i=1}^2 \sum_{j=1}^2 \sigma_{ij}  \hat{n}_{1j}  \hat{n}_{2i} = \lambda_1 \sum_{i=1}^2 \hat{n}_{1i}\hat{n}_{2i}
  = \lambda_1  \left( \hat{\boldsymbol{n}}_{1} \cdot \hat{\boldsymbol{n}}_{2} \right)
\end{align}
```
と書ける．

````{admonition} 数学メモ：内積と角度
:class: tip,
  2つのベクトル $\boldsymbol{a}$ ,  $\boldsymbol{b}$ の内積は，2次元の場合
  ```{math}
:label: 
\begin{align}
    \boldsymbol{a} \cdot \boldsymbol{b} = a_1 b_1 + a_2 b_2  = \sum_{i=1}^2 a_i b_i
  \end{align}
```
  で定義される．内積は，2つのベクトルのなす角を $\phi$ として
  ```{math}
:label: 
\begin{align}
    \boldsymbol{a}\cdot \boldsymbol{b} = \sum_i a_i b_i = \left| \boldsymbol{a} \right| \left| \boldsymbol{b} \right| \cos \phi
  \end{align}
```
  という性質を持っている．
  もしベクトルの長さが $\left| \boldsymbol{a} \right|=\left| \boldsymbol{b} \right|=1$ であれば，内積は $\cos \phi$ そのものとなる．
````

同じように，{eq}`eq:eigeneq`の第2式と $\hat{\boldsymbol{n}}_1$ との内積を取ると，
```{math}
:label: eq:eigenvector_innerproduct2
\begin{align}
  \sum_{i=1}^2 \sum_{j=1}^2 \sigma_{ij}  \hat{n}_{2j}  \hat{n}_{1i} = \lambda_2 \sum_{i=1}^2 \hat{n}_{2i}\hat{n}_{1i}
  = \lambda_2  \left( \hat{\boldsymbol{n}}_{1} \cdot \hat{\boldsymbol{n}}_{2} \right)
\end{align}
```
だ．この式の左辺で総和記号の添字 $i$ と $j$ を入れ替え，かつ応力テンソルが対称テンソル（ $\sigma_{ij} = \sigma_{ji}$ ）であるということを利用すると，
```{math}
:label: 
\begin{align}
  \sum_{i=1}^2 \sum_{j=1}^2 \sigma_{ij}  \hat{n}_{2j}  \hat{n}_{1i} 
  =
  \sum_{j=1}^2 \sum_{i=1}^2 \sigma_{ji}  \hat{n}_{2i}  \hat{n}_{1j}  
  =
  \sum_{i=1}^2 \sum_{j=1}^2 \sigma_{ij}  \hat{n}_{2i}  \hat{n}_{1j}  
\end{align}
```
が得られる．
この式の右辺は，{eq}`eq:eigenvector_innerproduct`の左辺に完全に等しい．したがって，{eq}`eq:eigenvector_innerproduct`と{eq}`eq:eigenvector_innerproduct2`は等価な式であり，その右辺同士もまた等しいことがわかる：
```{math}
:label: eq:eigenvector_requirement
\begin{align}
  \lambda_1  \left( \hat{\boldsymbol{n}}_{1} \cdot \hat{\boldsymbol{n}}_{2} \right)
  =
  \lambda_2  \left( \hat{\boldsymbol{n}}_{1} \cdot \hat{\boldsymbol{n}}_{2} \right)
\end{align}
```
しかし， $\lambda_1$ と $\lambda_2$ は固有方程式である2次方程式{eq}`eq:eigeneq`の互いに異なる解であり，判別式（二次方程式の解の公式の根号内）が正であったため，重解もありえない．
したがって， $\lambda_1 \neq \lambda_2$ であり，かつ{eq}`eq:eigenvector_requirement`が成立するためには，
```{math}
:label: 
\begin{align}
  \hat{\boldsymbol{n}}_{1} \cdot \hat{\boldsymbol{n}}_{2} = 0
\end{align}
```
でなければならないことがわかった．
長さ $1$ のベクトル同士の内積は，その2つのベクトルのなす角の $\cos$ に等しいのだから，応力テンソルの固有ベクトルは，（どんな応力テンソルに対しても）**かならず互いに直交**しており，互いに独立ではないのだ．

さて，2つの固有ベクトルが直交しているということは，
```{math}
:label: 
\begin{align}
  \theta_2 = \theta_1 \pm 90^\circ
\end{align}
```
であるということだ．符号はどちらでも良いのだが，ここでは $+$ を採用しよう．
 $\theta_2 = \theta_1$ を $\hat{\boldsymbol{n}}_2$ の定義{eq}`eq:eigenvector`に代入すると，
```{math}
:label: eq:n2-theta1
\begin{align}
  \hat{\boldsymbol{n}}_2 = 
\begin{pmatrix} \cos \theta_2 \\ \sin \theta_2 \end{pmatrix}
  =
  \begin{pmatrix}
    \cos \left( \theta_1 + 90 ^\circ \right)\\ \sin\left(\theta_1 + 90 ^\circ\right)
  \end{pmatrix}
  = \begin{pmatrix}
  -\sin  \theta_1  \\ \cos \theta_1   \end{pmatrix}
\end{align}
```
と書ける．

さて，ここで{eq}`eq:eigen_eq0`の2本の方程式をまとめて扱うため，2つの法線ベクトル $\hat{\boldsymbol{n}}_1$ と $\hat{\boldsymbol{n}}_2$ を横に並べた行列 $\boldsymbol{R}$ というものを考えよう．
```{math}
:label: eq:rotation_matrix
\begin{align}
  \boldsymbol{R} \equiv \left[ \hat{\boldsymbol{n}}_1, \hat{\boldsymbol{n}}_2 \right]
  =\left[  \begin{pmatrix} \cos \theta_1 \\ \sin \theta_1 \end{pmatrix} ,  \begin{pmatrix} \cos \theta_2 \\ \sin \theta_2 \end{pmatrix} \right]
    =
    \begin{pmatrix}
      \cos \theta_1 & -\sin \theta_1 \\
      \sin \theta_1 & \cos \theta_1
    \end{pmatrix}
\end{align}
```
ここで最後の等式では{eq}`eq:n2-theta1`を用いた．
このようにベクトルを並べた行列を用いると，{eq}`eq:eigen_eq0`は
```{math}
:label: eq:eigen_totyu
\begin{align}
\boldsymbol{\sigma}  \left[ \hat{\boldsymbol{n}}_1, \hat{\boldsymbol{n}}_2 \right]
  =  \left[ \lambda_1 \hat{\boldsymbol{n}}_1, \lambda_2\hat{\boldsymbol{n}}_2 \right]
\end{align}
```
のように書ける．
これに{eq}`eq:rotation_matrix`を用いると，固有値を対角成分に持つ対角行列を用いて，
```{math}
:label: eq:eigen_orthogonal
\begin{align}
  \boldsymbol{\sigma} 
  \boldsymbol{R} = 
  \boldsymbol{R}
  \begin{pmatrix}
    \lambda_1 & 0 \\ 0 & \lambda_2
  \end{pmatrix}
\end{align}
```
と表される．

````{admonition} 数学メモ：対角行列
:class: tip,
行列 $\boldsymbol{A}$ が対角成分 $A_{ii}$ だけ値を持ち，非対角成分は ${A}_{ij} = 0$   $(i\neq j)$ であるとき，この行列は**対角行列**であると言う．一般の行列を何らかの線形変換によって対角行列を求めることを，行列を**対角化する**とも言う．
````

````{admonition} 演習：固有値の対角行列を用いた表現
:class: 
  {eq}`eq:eigen_orthogonal`式の行列 $\boldsymbol{R}$ と{eq}`eq:eigen_totyu`式の法線ベクトルの角度変数を用いた表現をそれぞれ代入することで，両式が等価であることを示せ．
````

ここで，行列 $\boldsymbol{R}$ は $\det(\boldsymbol{R}) = 1$ であり，その逆行列は
```{math}
:label: 
\begin{align}
  \boldsymbol{R}^{-1} = \boldsymbol{R}^T = 
  \begin{pmatrix}
    \cos \theta_1 & \sin \theta_1 \\
    -\sin \theta_1 & \cos \theta_1
  \end{pmatrix}  
\end{align}
```
であるので， $\boldsymbol{R}$ は直交行列である．これを用いると，応力テンソルは固有値を対角成分にもつ対角行列を用いて，
```{math}
:label: eq:diag_stress
\begin{align}
  \boldsymbol{R}^{-1} \boldsymbol{\sigma} \boldsymbol{R} =
  \begin{pmatrix}
    \lambda_1 & 0 \\ 0 & \lambda_2
  \end{pmatrix}
\end{align}
```
と対角化される．

## ベクトルとテンソルの回転
実は，行列 $\boldsymbol{R}$ は**回転行列**に一致している．以下では，回転行列を角度を引数として $\boldsymbol{R}(\theta)$ と書く．角度 $\theta$ を引数にもつ回転行列にベクトル $\boldsymbol{u}$ を作用させる
```{math}
:label: 
\begin{align}
  \boldsymbol{v} = \boldsymbol{R}(\theta) \boldsymbol{u}
\end{align}
```
と，それによって得られるベクトル $\boldsymbol{v} $ は， $\boldsymbol{u}$ を角度 $\theta$ だけ回転したもの（図{numref}`{number} <fig_rotation>`(a)）になるのだった．その逆行列が
```{math}
:label: 
\begin{align}
\boldsymbol{u} = \boldsymbol{R}^{-1}(\theta) \boldsymbol{v}
\end{align}
```
と書けることから，これは角度を $-\theta$ だけ回転したものになる．したがって， $\boldsymbol{R}^{-1}(\theta)=\boldsymbol{R}(-\theta)$ が成り立つ． $\boldsymbol{R}(-\theta)$ は，ベクトルではなく**座標系を $\theta$ だけ回転させた**，と見ることもできる（図{numref}`{number} <fig_rotation>`b）．

この関係を用いると，{eq}`eq:diag_stress`は**応力テンソルを回転した座標系で表したもの**という意味をもつことが分かってくる．以下，そのことを示していこう．

````{admonition} 演習：回転行列の逆行列
:class: 
   $2\times 2$ の回転行列の逆行列 $\boldsymbol{R}^{-1}(\theta)$ をその成分から直接計算し， $\boldsymbol{R}^{-1}(\theta)=\boldsymbol{R}(-\theta)$ を示せ．
````

```{figure} ./fig/rotation.png
:align: center
:width: 90%
:name: fig_rotation

座標の回転と座標系の回転．(a)では，ある位置ベクトルを回転行列によって $\theta$ だけ回転している．同じ操作は，ベクトルの位置を固定したまま，(b)のように座標系を反対方向に $\theta$ だけ回転させた $x_1'$ -- $x_2'$ 座標系で元の点の位置を表現することもできる．この場合，(c)のように $x_1'$ -- $x_2'$ を紙面水平鉛直に沿うように描画しなおすと，(a)において回転されたベクトルの位置に一致している．
```


まず，応力テンソルのコーシーの関係式に戻ろう：
```{math}
:label: 
\begin{align}
  \boldsymbol{\sigma} \hat{\boldsymbol{n}} = \boldsymbol{T}^{(\hat{\boldsymbol{n}})}
\end{align}
```
これに対し， $x_1$ -- $x_2$ から反時計回りに $\theta$ だけ回転された座標系 $x'_1$ -- $x'_2$ を考える．法線ベクトルとトラクションベクトルをこの回転後の座標系で表すと，回転行列を用いて
```{math}
:label: 
\begin{align}
  \hat{\boldsymbol{n}}'=  \boldsymbol{R}^{-1}(\theta) \hat{\boldsymbol{n}}, \quad
  \boldsymbol{T}'^{(\hat{\boldsymbol{n}}')} =  \boldsymbol{R}^{-1}(\theta) \boldsymbol{T}^{(\hat{\boldsymbol{n}})}
\end{align}
```
と表さる．これをコーシーの関係式に代入すると，
```{math}
:label: 
\begin{align}
  \boldsymbol{\sigma} \boldsymbol{R} \hat{\boldsymbol{n}}' = \boldsymbol{R} \boldsymbol{T}'^{(\hat{\boldsymbol{n}}')}
\end{align}
```
であるから，左から回転行列の逆行列を作用させて，
```{math}
:label: eq:rotated_stress1
\begin{align}
  \left( 
  \boldsymbol{R} ^{-1} \boldsymbol{\sigma} \boldsymbol{R} \right) \hat{\boldsymbol{n}}' = \boldsymbol{R} ^{-1} \boldsymbol{R} \boldsymbol{T}'^{(\hat{\boldsymbol{n}}')} =  \boldsymbol{T}'^{(\hat{\boldsymbol{n}}')}
\end{align}
```
が得られる．ここで
```{math}
:label: eq:R-Rinv-I
\begin{align}
  \boldsymbol{R} ^{-1} \boldsymbol{R} = \boldsymbol{I}
\end{align}
```
の関係を用いた．
````{admonition} 演習：回転と逆回転の積
:class: 
  {eq}`eq:R-Rinv-I`式は， $\theta$ 回転して $-\theta$ 回転したら元（なにもしない状態）に戻るということを意味している．直感的には明らかであろうが，2次元の回転行列の成分から，積 $\boldsymbol{R} ^{-1} \boldsymbol{R}$ を計算し，それが確かに単位行列になることを計算によって確かめよ．
````
ところで，回転後の座標系においてもコーシーの関係式は成り立っているはずだ．
そうであるならば，回転後の座標系における応力テンソルを $\boldsymbol{\sigma}'$ と書くと，
```{math}
:label: eq:rotated_stress2
\begin{align}
  \boldsymbol{\sigma}' \hat{\boldsymbol{n}}' = \boldsymbol{T}'^{(\hat{\boldsymbol{n}'})}
\end{align}
```
が成立している．{eq}`eq:rotated_stress1`と{eq}`eq:rotated_stress2`とを比べると，テンソルは座標系の回転によって
```{math}
:label: eq:tensor_rotation
\begin{align}
  \boldsymbol{\sigma}'= \boldsymbol{R} ^{-1} \boldsymbol{\sigma} \boldsymbol{R} 
\end{align}
```
という変換をうけるということがわかった．

この関係{eq}`eq:tensor_rotation`を踏まえ，あらためて{eq}`eq:diag_stress`と{eq}`eq:tensor_rotation`とを比べると，左辺はまったく同じである．
つまり，{eq}`eq:diag_stress`は応力テンソルを角度 $\theta_1$ だけ回転したものであり，その結果が固有値 $\lambda_1$ と $\lambda_2$ を用いた対角行列になっている．ということは， $\lambda_1$ と $\lambda_2$ は回転された座標系における応力テンソルの成分そのものなのだ．このようにして対角化された応力テンソルの対角成分 $\sigma_1 \equiv \lambda_1$ ,  $\sigma_2 = \lambda_2$ を**主応力**といい，回転した座標系の軸方向を**主方向**，主方向に沿った座標軸を**主軸**という．

長い議論だったので，結果をあらためて整理すると，

- 応力テンソルは，適当な角度 $\theta$ で回転すると，剪断成分をもたない対角テンソルの形に書くことができる．
- 応力テンソルを対角化するための回転行列は，応力テンソルの固有ベクトルを並べる事によって作ることができる．
- 対角化された応力テンソルの対角成分である主応力の値は，応力テンソルの固有値である．
- 上記を満たすような回転角度が必ず存在することが，数学的に保証されている．

ということになる．

これは3次元空間においても全く同じで，任意の応力テンソルは
```{math}
:label: 
\begin{align}
  \boldsymbol{R}^{-1} \begin{pmatrix}
    \sigma_{11} & \sigma_{12} & \sigma_{13} \\
    \sigma_{12} & \sigma_{22} & \sigma_{23} \\
    \sigma_{13} & \sigma_{23} & \sigma_{33} \\
  \end{pmatrix}
  \boldsymbol{R}
 = 
 \begin{pmatrix}
   \sigma_1 & 0 & 0 \\ 0 & \sigma_2 & 0 \\ 0 & 0 & \sigma_3
 \end{pmatrix} 
\end{align}
```
のように回転によって対角化される．その時の回転行列が応力テンソルの固有ベクトルで作られることも同じである．

````{admonition} 数学メモ：実対称行列の固有値問題
:class: tip,
  ここでは応力テンソルに対して，その固有値が実数でかならず2つ（2次元の場合）あり，かつ固有ベクトル同士が直交する，ということを示してきた．しかし，実はその証明に使った条件はたった一つ，**応力テンソルが対称テンソル**であるということだけであった．実はより一般に，実対称行列（成分が実数の対称行列）は，その大きさと同じだけの個数の実数の固有値を持ち，それらの固有値に対応する固有ベクトルは，必ず互いに直交するということが知られている．これは2次元だけでなく，3次元以上でも成立する．3次元の場合には3つの固有ベクトルがあり，それらがすべて互いに直交するのだ．また，同じ対角化手法が，対称テンソルであるひずみテンソルと応力テンソルの他，地震学のモーメントテンソルにも適用できる．
````

応力テンソルの対角成分（法線応力）は，軸方向の引張や圧縮のトラクションを意味する成分であった．本節で導いたことは，剪断が働いているように見える場合であっても，適当な方向に座標軸をとりなおすことによって，圧縮と膨張の力だけでそれを表現することができる，ということだ．

## 主ひずみ

これまでは応力テンソルを例にしてきたが，固有値と固有ベクトルによって対角化されるというのは，ひずみテンソルについても全く同じように成立する．同じように大きさを1に規格化した固有ベクトルから回転行列を作成し，それによってひずみテンソルを回転すると，固有値を対角成分にもつ対角テンソルが得られる：
```{math}
:label: 
\begin{align}
  \boldsymbol{R}^{-1} \begin{pmatrix}
    \varepsilon_{11} & \varepsilon_{12} & \varepsilon_{13} \\
    \varepsilon_{12} & \varepsilon_{22} & \varepsilon_{23} \\
    \varepsilon_{13} & \varepsilon_{23} & \varepsilon_{33} \\
  \end{pmatrix}
  \boldsymbol{R}
  = 
  \begin{pmatrix}
    \varepsilon_1 & 0 & 0 \\ 0 & \varepsilon_2 & 0 \\ 0 & 0 & \varepsilon_3
  \end{pmatrix} 
\end{align}
```
このときの $\varepsilon_1$ ,  $\varepsilon_2$ ,  $\varepsilon_3$ を**主ひずみ**という．

### 主ひずみとテンソル回転の例

ひずみテンソルの対角化の具体例として，2次元 $x_1$ -- $x_2$ 面内において，
```{math}
:label: eq:straion_rotation_1
\begin{align}
  \boldsymbol{\varepsilon} = \begin{pmatrix}
    0 & \varepsilon_{12}\\ \varepsilon_{12} & 0
  \end{pmatrix}
  = 
  \begin{pmatrix}
    0 & c \\ c& 0
  \end{pmatrix}   
\end{align}
```
を考えよう．ただしここでは $\varepsilon_{12}=c>0$ であるとする．
このひずみテンソルによってもたらされる変形場は図{numref}`{number} <fig_strain_field>`(d)に示されている．

ひずみテンソルの固有値を $\lambda$ ，固有ベクトルを $\boldsymbol{v}$ とすると，
```{math}
:label: eq:eigen_example_1
\begin{align}
  \begin{pmatrix}
    0 &c \\ c & 0
  \end{pmatrix}\boldsymbol{v} = \lambda \boldsymbol{v}
  \Leftrightarrow
  \begin{pmatrix}
    -\lambda & c \\ c & -\lambda
  \end{pmatrix}\boldsymbol{v} = \boldsymbol{0}
\end{align}
```
であり，これが非自明な解を持つためには，
```{math}
:label: 
\begin{align}
  \det \begin{pmatrix}
  -\lambda & c\\c & -\lambda
\end{pmatrix} = \lambda^2 -c^2 = 0
\end{align}
```
でなくてはならない．この解は $\lambda=\pm c$ である．

次に固有ベクトルを求めよう．{eq}`eq:eigen_example_1`に固有値のうち正の値のほうを代入すると，
```{math}
:label: eq:eigen_example_2
\begin{align}
  \begin{pmatrix}
      -c & c \\ c&  -c
  \end{pmatrix} 
  \begin{pmatrix}
    v_{11} \\ v_{12}
  \end{pmatrix} = \boldsymbol{0}
\end{align}
```
であり，展開して整理すると，どちらも
```{math}
:label: 
\begin{align}
  v_{11} = v_{12}
\end{align}
```
という関係に帰着する．この条件をみたし，かつ長さが $1$ のベクトルは
```{math}
:label: 
\begin{align}
  \boldsymbol{v}_1 = \begin{pmatrix}
     1/\sqrt{2} \\ 1/\sqrt{2}
  \end{pmatrix}
  =
  \begin{pmatrix}
    \cos(\pi/4) \\ \sin(\pi/4)
 \end{pmatrix}
\end{align}
```
だ．同様に，もう一つの固有値に対する固有ベクトルは，
```{math}
:label: eq:eigenvalue2
\begin{align}
  \boldsymbol{v}_2 = \begin{pmatrix}
    - 1/\sqrt{2} \\ 1/\sqrt{2}
  \end{pmatrix}
  =
  \begin{pmatrix}
    \cos(3\pi/4) \\ \sin(3\pi/4)
 \end{pmatrix}
 =  
 \begin{pmatrix}
  -\sin(\pi/4) \\ \cos(\pi/4)
\end{pmatrix}
\end{align}
```
である．
````{admonition} 演習：固有ベクトルの推定
:class: 
  負の固有値 $\lambda=- \varepsilon_{12}$ に対する固有ベクトルが{eq}`eq:eigenvalue2`であることを証明せよ．
````

これらを並べて回転行列を作ると，
```{math}
:label: 
\begin{align}
  \boldsymbol{R} = \begin{pmatrix}
    \cos(45^\circ) & - \sin(45^\circ) \\ \sin (45^\circ) & \cos (45^\circ)
  \end{pmatrix}
\end{align}
```
が得られる．この行列は $\pi/4$  rad $=45^\circ$ 回転を表す行列だ．これによって，ひずみテンソルは
```{math}
:label: eq:straion_rotation_2
\begin{align}
  \boldsymbol{\varepsilon}' = \boldsymbol{R}^{-1}\boldsymbol{\varepsilon} \boldsymbol{R} = 
  \begin{pmatrix}
    c & 0 \\
    0 & -c
  \end{pmatrix}
\end{align}
```
と対角化された．

図{numref}`{number} <fig_strain_rotation>`は，(a)に{eq}`eq:straion_rotation_1` のひずみによる変形場を，(b)に回転後の{eq}`eq:straion_rotation_2` による変形場をそれぞれ示す．図{numref}`{number} <fig_strain_rotation>`(a)では $x_1$ ,  $x_2$ 軸の方向には座標軸に直交した変形が得られているが，図{numref}`{number} <fig_strain_rotation>`(b)では，たしかに主方向である $x_1'$ と $x_2'$ 方向には**軸方向にだけ**変形しているということがわかるだろう．また，注意深く図{numref}`{number} <fig_strain_rotation>`(a)と(b)を比べると，(a)に対して(b)のベクトル場は45度時計回りに回転していることも確認できるだろう．


```{figure} ./fig/strain_rotation.png
:align: center
:width: 90%
:name: fig_strain_rotation

ひずみによる変形場の回転の例．
```



## モールの応力円

### 2次元面内におけるトラクションとその回転

```{margin}
面ではなくて線だろう，と思うかもしれないが，2次元の問題ではこの線がは $z$ 方向（紙面の手前と奥行き方向）に無限に続いていると仮定している．であるから，これはあくまでも $x_1$ -- $x_2$ 断面を切る面なのだ．
```
 $x_1$ -- $x_2$ 平面内における2次元の変形を考えよう．図{numref}`{number} <fig_Mohr_Layout>`のように，法線ベクトル $\hat{\boldsymbol{n}}$ を持つ面を考え，そこに働くトラクションを調べることにしよう．我々はもうコーシーの関係式を知っているのだから，面の法線ベクトルを求め，それを応力テンソルに作用させれば，どんな面に対してもトラクションベクトルを求めることができる．
ただし実用上は，ある角度 $\theta$ が与えられたときに，その角度の面にかかるトラクションの，面に対する法線方向や接線方向のトラクションを調べるということがよくある．本節では，図示によって法線・接線方向のトラクションを調べることができる，モール（Mohr）の円という強力な方法を紹介する．

```{figure} ./fig/Mohr_Layout.png
:align: center
:width: 70%
:name: fig_Mohr_Layout

2次元 $x_1$ -- $x_2$ 平面内における応力場とその内部に考える面（点線）にはたらくトラクション $\boldsymbol{T}^{(\hat{\boldsymbol{n}})}$ ．四角形周辺の矢印がこの場に働く応力テンソル成分とその方向を，四角形中の２つの座標軸は $12$ 直交座標系と，面と面に直交する方向からなる $vw$ 座標系．
```

 $x_3$ 方向を無視した2次元空間での応力テンソルは
```{math}
:label: 
\begin{align}
  \boldsymbol{\sigma} = \left(
  \begin{matrix}
    \sigma_{11} & \sigma_{12} \\
    \sigma_{12} & \sigma_{22}\\
  \end{matrix}
  \right)
\end{align}
```
である．法線ベクトルは， $x_1$ 軸と面のなす角を $\theta$ とすれば
```{math}
:label: 
\begin{align}
\begin{matrix}
  \hat{ \boldsymbol{n} } = \left( \cos \theta, \sin \theta \right)^T
\end{matrix}  
\end{align}
```
と表される．したがって，この面に働くトラクションは，コーシーの関係式から
```{math}
:label: 
\begin{align}
  \boldsymbol{T}^{(\hat{ \boldsymbol{n} })} =
  \left(
  \begin{matrix}
    T_1^{(\hat{ \boldsymbol{n} })} \\
    T_2^{(\hat{ \boldsymbol{n} })} \\
  \end{matrix}
  \right)
  =
  \boldsymbol{\sigma} \hat{ \boldsymbol{n} }
  =
   \left(
  \begin{matrix}
    \sigma_{11} & \sigma_{12} \\
    \sigma_{12} & \sigma_{22}\\
  \end{matrix}
  \right)
    \left(
  \begin{matrix}
    \cos \theta \\
    \sin \theta \\
  \end{matrix}
  \right)
\end{align}
```
で得ることができる．

この計算で得られたのは，トラクションの $x_1$ 方向と $x_2$ 方向の成分 $ T_1^{(\hat{ \boldsymbol{n} })}$ ,  $ T_2^{(\hat{ \boldsymbol{n}})}$ である．
では，今考えている法線ベクトル $\hat{\boldsymbol{n}}$ の面の法線方向に働く応力（法線応力）や接線方向に働く応力（剪断応力）はどうだろうか？．
それは，トラクションベクトルの図{numref}`{number} <fig_Mohr_Layout>`中の $v$ -- $w$ 座標軸方向の値を求めることに相当する． $x_1$ -- $x_2$ 座標系とくらべて $v$ -- $w$ 座標系は $+\theta$ だけ回転しているのだから， $x_1$ -- $x_2$ 座標系で表したベクトルを $v$ -- $w$ 座標系でみると，あたかも $-\theta$ だけ反対方向に回転したかのように見えるはずだ．つまり， $x_1$ -- $x_2$ 座標系で求まったトラクションベクトルを $-\theta$ だけ回転することにより，法線応力と剪断応力が求まるのだ．それぞれの値を $T_v^{(\hat{ \boldsymbol{n} })}$ ,  $T_w^{(\hat{ \boldsymbol{n} })}$ とすると，
```{math}
:label: eq:rot-traction1
\begin{multline}
  \begin{pmatrix}
    T_v^{(\hat{ \boldsymbol{n} })} \\
    T_w^{(\hat{ \boldsymbol{n} })} \\
  \end{pmatrix}
  =
  \boldsymbol{R}\left( -\theta \right)
  \begin{pmatrix}
    T_1^{(\hat{ \boldsymbol{n} })} \\
    T_2^{(\hat{ \boldsymbol{n} })} \\
  \end{pmatrix}  
  \\
  =
  \begin{pmatrix}
    \cos \theta & \sin \theta \\
    -\sin \theta & \cos \theta \\
  \end{pmatrix}
  \begin{pmatrix}
    T_1^{(\hat{ \boldsymbol{n} })} \\
    T_2^{(\hat{ \boldsymbol{n} })} \\
  \end{pmatrix}
  =
  \begin{pmatrix}
    \cos \theta & \sin \theta \\
    - \sin \theta & \cos \theta \\
  \end{pmatrix}
  \begin{pmatrix}
    \sigma_{11} & \sigma_{12} \\
    \sigma_{12} & \sigma_{22}\\
  \end{pmatrix}
  \begin{pmatrix}
    \cos \theta \\
    \sin \theta \\
  \end{pmatrix}
\end{multline}
```
である．
行列の積を展開して具体的に計算してみると，
```{math}
:label: 
\begin{align}
  \begin{split}
  &T_v^{(\hat{ \boldsymbol{n} })} = \sigma_{11} \cos^2 \theta + \sigma_{22} \sin^2 \theta + 2\sigma_{12} \cos \theta \sin \theta \\
  &T_w^{(\hat{ \boldsymbol{n} })} = -\sigma_{11} \sin \theta \cos \theta +  \sigma_{22} \sin \theta \cos \theta +  \sigma_{12} \left(  \cos^2 \theta  - \sin^2 \theta  \right)
\end{split}
\end{align}
```
であり，三角関数の半角公式
```{math}
:label: 
\begin{align}
  \cos^2 \theta  = \frac{ 1 + \cos 2 \theta }{2}, \quad
  \sin^2 \theta  = \frac{ 1 - \cos 2 \theta }{2}
\end{align}
```
を利用して整理すると，
```{math}
:label: eq:rot-traction2
\begin{align}
  \begin{split}
    &T_v^{(\hat{ \boldsymbol{n} })} = \frac{ \sigma_{11} + \sigma_{22} }{2} +
    \frac{ \sigma_{11} - \sigma_{22} }{2} \cos 2 \theta +  \sigma_{12} \sin 2\theta \\
    &T_w^{(\hat{ \boldsymbol{n} })} = -\frac{ \sigma_{11} - \sigma_{22} }{2} \sin 2\theta + \sigma_{12} \cos 2\theta
\end{split}
\end{align}
```
が得られる．式{eq}`eq:rot-traction2`は，外部からかかっている応力 $\boldsymbol{\sigma}$ と面（を表す法線）の角度 $\theta$ がわかれば法線応力$
T_v^{(\hat{ \boldsymbol{n} })}  $と剪断応力$ T_w^{(\hat{ \boldsymbol{n} })}$がわかる，ということを表している．

### モールの円とその意味


```{margin}
ここでは地震学で用いられる慣習によって圧縮正の（普段とは逆の）符号を用いている．書籍によっても定義はバラバラなので，他書と比較する際は注意すること．
```
式{eq}`eq:rot-traction2`だけでも十分有用なのだが，もうすこし簡略化された状況を考えよう．まず，圧縮を正とする法線応力 $\sigma_1$ ,  $\sigma_2$ （ $\sigma_1>\sigma_2$ ）を導入し，
```{math}
:label: eq:mohr-notation1
\begin{align}
  \begin{split}
    \sigma_1 = -\sigma_{11}
    \\
    \sigma_2 = -\sigma_{22}
    \\
    \sigma_{12} = 0
  \end{split}
\end{align}
```
であると仮定する（図{numref}`{number} <fig_Mohr_Layout_Simplified>`）．外部からかかる剪断応力 $\sigma_{12}$ がゼロというのは強い仮定に思うかもしれないが，どんな場合でも適切に座標系を回転することで{eq}`eq:mohr-notation1`を満たすようにできることができるのだった．そのような場合，ここで導入した $\sigma_1$ と $\sigma_2$ は主応力に相当する．また，面に対する法線方向の応力を圧縮を正として $N=-T_v^{(\hat{ \boldsymbol{n}})}$ , 剪断方向の応力をそのまま $S=T_w^{(\hat{ \boldsymbol{n} })}$ としよう．
これらの関係を{eq}`eq:rot-traction2`式に代入すると，
```{math}
:label: 
\begin{align}
\begin{split}
  & N = \frac{\sigma_1 + \sigma_2}{2} + \frac{\sigma_1 - \sigma_2}{2} \cos 2 \theta  \\
  & S = \frac{\sigma_1 - \sigma_2}{2} \sin 2 \theta 
\end{split}
\end{align}
```
より，
```{math}
:label: eq:mohr-circle
\begin{align}
  \left( N - \frac{ \sigma_1 + \sigma_2} {2} \right)^2 + S^2
  =
  \left( \frac{ \sigma_1 - \sigma_2} {2} \right)^2
\end{align}
```
が得られる．この式は $N$ -- $S$ 軸上の円を表していることから，**モールの円**と呼ばれる．


```{figure} ./fig/Mohr_Layout_Simplified.png
:align: center
:width: 80%
:name: fig_Mohr_Layout_Simplified

図{numref}`{number} <fig_Mohr_Layout>`からいくつかの仮定のもと（詳しくは本文）に単純化したレイアウト．
```


````{admonition} 数学メモ：円の方程式
:class: tip,
   $x_1$ -- $x_2$ 平面で，半径 $r$ ，中心 $(a,b)$ を持つ円の方程式は以下のように表される．
  ```{math}
:label: 
\begin{align}
    \left(x-a\right)^2 + \left( y-b \right)^2 = r^2
  \end{align}
```
````

これは，与えられた外部からの応力 $\sigma_1$ ,  $\sigma_2$ に対して，任意の角度 $\theta$ の面にかかる法線応力 $N$ と剪断応力 $S$ の組が，グラフの円上のどこかに来る，ということを意味している（図{numref}`{number} <fig_Mohr-Circle>`）．しかも，円上の位置は $N$ 軸から反時計回りに角度 $2\theta$ の位置である，ということもわかる．モールの円を作図することで，内部にかかっている応力を図解で求めることができるのだ．


```{figure} ./fig/Mohr_Circle.png
:align: center
:width: 80%
:name: fig_Mohr-Circle

モールの円．円の $N$ 軸から角度 $2 \theta$ 反時計回りの点の位置が，その面にかかる法線応力と剪断応力を表している．
```

