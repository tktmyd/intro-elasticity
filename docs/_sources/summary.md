<div class="newpage"></div>

# まとめ
これまで導入してきた概念と結果を整理しましょう．以下の量と関係式がこれまでに導入，あるいは導出されました．

* ひずみテンソルの定義
  \begin{align*}
    \varepsilon_{ij} \equiv \frac{1}{2} \left( \frac{ \partial u_i}{\partial x_j} + \frac{\partial u_j}{\partial x_i} \right) 
  \end{align*}

* 応力テンソルとコーシーの関係式
  \begin{align*}
    T_i^{(\hat{\boldsymbol{n}})}=\sum_{j=1}^3  \sigma_{ij} \hat{n}_j
  \end{align*}

* 構成関係式（線形等方弾性体の場合）
  \begin{align*}
    \sigma_{ij} = \lambda \delta_{ij}  \sum_{k=1}^3  \varepsilon_{kk} + 2 \mu \varepsilon_{ij}
  \end{align*}

* 運動方程式
  \begin{align*}
    \rho \left(\boldsymbol{x}\right)  \frac{ \partial^2 u_i(\boldsymbol{x},t) }{ \partial t^2 } 
    =
    \sum_{j=1}^3
    \frac{  \partial \sigma_{ij} (\boldsymbol{x},t) }{\partial x_j} +  f_i(\boldsymbol{x},t) 
  \end{align*}


運動方程式は弾性体内の変位を記述するものですが，その右辺は変位でなく応力テンソルで書かれています．
しかし，その応力テンソルはいまや構成関係式によってひずみテンソルと関係づけられ，そのひずみテンソルは定義により変形（変位）の空間微分で与えられます．ということは，運動方程式の右辺が変位の関数になっているのです．
あとは外力 $f_i$ さえ与えられれば，原理的には（どうやるかは別として）この方程式を解くことができるはずです．
このような状態を，変位について**閉じた系**である，といいます．
また，応力とひずみの間の構成関係式には2つの独立な係数（弾性係数）が現れました．これらの係数は，パラメタの選び方によって，弾性体のねじりにくさ，膨張しやすさ等々のさまざま特徴を表します．これらの弾性係数は，建築物等の材料の特性や，地球内部の固体部分の特性を記述するのにも用いられています．

