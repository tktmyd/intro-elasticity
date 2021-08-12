# 弾性体の運動方程式

弾性体に働く力を応力テンソルで記述することができたので，運動方程式を立てることができるようになった．

## 微小立体の運動方程式

1つの（あるいは複数の）点について運動方程式が立てられた質点の場合とは異なり，弾性体では弾性体内のあらゆる点が運動をする．そこでまず，弾性体の一部分（場所 $\boldsymbol{x}$ ）から，体積 $dV = dx_1\times dx_2 \times dx_3$ の直方体を切り出してきて，それについて運動方程式をたてることにしよう．
この部分の元の位置からの変形（**変位**）を，位置 $\boldsymbol{x}$ と時間 $t$ に依存するベクトル $\boldsymbol{u}(\boldsymbol{x},t)$ と書くことにすれば，運動方程式の左辺は質量と加速度の積として，
```{math}
:label: 
\begin{align}
  \left[ \rho \left(\boldsymbol{x}\right) dx_1dx_2 dx_3 \right] \times \frac{ \partial^2 \boldsymbol{u}(\boldsymbol{x},t) }{ \partial t^2 }
\end{align}
```
と表せる．ここで $\rho$ は弾性体の質量密度，つまり単位体積あたりの重さだ．単位体積あたりの重さに体積を乗ずることによって，直方体 $dV$ 全体の重さが求まる．
変位の時間に関する2階微分が加速度を表しているが，変位ベクトルは場の量であって，位置 $\boldsymbol{x}$ にも依存するので，常微分ではなく偏微分記号が用いられている．

運動方程式の右辺には，その物体にかかる力をすべて記述する必要がある．
弾性体にかかる力には，2通りのものがあるのだった．一つが実体力 $\boldsymbol{f}(\boldsymbol{x}, t)$ で，これは単に体積あたりの力だ．もう一つは面力だが，面力は今考えている直方体 $dx_1 dx_2 dx_3 $ の表面（6つの長方形）すべてに働くので，それらを重ね合わせる必要がある．

```{figure} ./fig/x2-stress.png
:align: center
:width: 80%
:name: fig_rippou

弾性体内の微小体積要素に働く $x_2$ 方向の応力テンソル成分．
```


図 {numref}`{number} <fig_rippou>`にあらためて立方体 $dx_1dx_2dx_3$ にかかる応力を示した．
特に $x_2$ 方向に法線を持つ面（ $x_1$ -- $x_3$ 面）にかかる $x_2$ 方向の力を詳しく見ていくことにしよう．
このような面は， $x_2$ と $x_2+dx_2$ の2つがある．ひとつめの位置 $x_2$ （図左側）における面は，法線ベクトルが負の方向を向いているから，そこにかかる応力ベクトルは，
```{math}
:label: 
\begin{align}
  T_2^{(-\hat{\boldsymbol{n}}_2)}(x_2) = - \sigma_{22}(x_2)
\end{align}
```
である．
```{margin}
応力テンソルは位置 $\boldsymbol{x}=(x_1,x_2,x_3)^T$ の関数だが，見通しを良くするため $x_2$ 以外の引数を省略した．
```
もうひとつの面（右側）にかかる力は，法線は $+x_2$ 方向だが場所が $dx_2$ だけずれていて，
```{math}
:label: 
\begin{align}
  T^{(\hat{\boldsymbol{n}}_2)}_2(x_2+dx_2) = + \sigma_{22}(x_2+dx_2)
\end{align}
```
のトラクションがかかっている．トラクションは面積あたりの力であったので，この面の面積をトラクションに乗じて，かつ両方のトラクションの効果を足し合わせることにより， $x_1$ -- $x_3$ 面にかかる $x_2$ 方向の力は
```{math}
:label:
\begin{multline}
    \left(  T^{(\hat{\boldsymbol{n}}_2)}_2(x_2+dx_2) +   T_2^{(-\hat{\boldsymbol{n}}_2)}(x_2) \right) dx_1 dx_3 = \left[ \sigma_{22}(x_2+dx_2) - \sigma_{22}(x_2) \right] dx_1 dx_3 \\
    \simeq
    \left( \left[
        \sigma_{22}(x_2)  + 
        \frac{ \partial \sigma_{22} }{\partial x_2} dx_2
      \right] -  \sigma_{22}(x_2) \right) dx_1 dx_3 = \frac{  \partial \sigma_{22} }{\partial x_2} dx_1 dx_2 dx_3
\end{multline}
```
と表される．
ただし， $dx_2$ が十分小さいという条件のもとで1次のテイラー展開を行った．
```{margin}
 $$ 
\sigma_{22}(x_2+dx_2)\simeq \sigma_{22}(x_2) + \frac{\partial \sigma_{22}}{\partial x_2} dx_2
 $$ 
```
%
 $x_2$ 方向にかかる力は，まだこれだけではない．さらに， $x_1$ -- $x_2$ 面（ $x_3$ 方向に法線を持つ面）の $\sigma_{23}$ と $x_2$ -- $x_3$ 面（ $x_1$ 方向に法線を持つ面）の $\sigma_{21}$ とがある．全く同じように計算すると，それぞれ
```{math}
:label: 
\begin{align}
  \frac{  \partial \sigma_{23} }{\partial x_3} dx_1 dx_2 dx_3, \quad
  \frac{  \partial \sigma_{21} }{\partial x_1} dx_1 dx_2 dx_3
\end{align}
```
である．すべてをまとめると， $x_2$ 方向の運動方程式は
```{math}
:label:
\begin{multline}
  \rho \left(\boldsymbol{x}\right)  \frac{ \partial^2 u_2(\boldsymbol{x},t) }{ \partial t^2 } dx_1 dx_2 dx_3
  \\
  =
  \left[
  \frac{  \partial \sigma_{21} (\boldsymbol{x},t) }{\partial x_1} +   \frac{  \partial \sigma_{22}(\boldsymbol{x},t)  }{\partial x_2} +   \frac{  \partial \sigma_{23}(\boldsymbol{x},t)  }{\partial x_3} 
  +     f_2(\boldsymbol{x},t)
  \right] dx_1 dx_2 dx_3
\end{multline}
```
と表される．

## 運動方程式

これまでは微小体積要素が満たす運動方程式を考えてきたが，その運動方程式の両辺を直方体の体積 $dx_1 dx_2 dx_3$ で規格化することで，体積要素の大きさに依存しない，**単位体積当たりの運動方程式**が得られる． $x_1$ ,  $x_3$ 方向についても全く同様に運動方程式を導ける．すべてを書き下すと，
```{math}
:label: eq:equation-of-motion
\begin{align}
  \begin{split}
    &\rho \left(\boldsymbol{x}\right)  \frac{ \partial^2 u_1(\boldsymbol{x},t) }{ \partial t^2 } 
  =
  \frac{  \partial \sigma_{11} (\boldsymbol{x},t) }{\partial x_1} +   \frac{  \partial \sigma_{12}(\boldsymbol{x},t)  }{\partial x_2} +   \frac{  \partial \sigma_{13}(\boldsymbol{x},t)  }{\partial x_3}  + 
  f_1(\boldsymbol{x},t) 
  \\
  &\rho \left(\boldsymbol{x}\right)  \frac{ \partial^2 u_2(\boldsymbol{x},t) }{ \partial t^2 } 
  =
  \frac{  \partial \sigma_{21} (\boldsymbol{x},t) }{\partial x_1} +   \frac{  \partial \sigma_{22}(\boldsymbol{x},t)  }{\partial x_2} +   \frac{  \partial \sigma_{23}(\boldsymbol{x},t)  }{\partial x_3}  + 
  f_2(\boldsymbol{x},t) 
  \\
  &\rho \left(\boldsymbol{x}\right)  \frac{ \partial^2 u_3(\boldsymbol{x},t) }{ \partial t^2 } 
  =
  \frac{  \partial \sigma_{31} (\boldsymbol{x},t) }{\partial x_1} +   \frac{  \partial \sigma_{32}(\boldsymbol{x},t)  }{\partial x_2} +   \frac{  \partial \sigma_{33}(\boldsymbol{x},t)  }{\partial x_3}  + 
  f_3(\boldsymbol{x},t)   
\end{split}
\end{align}
```
で，全部をまとめて成分で表すと，
```{math}
:label: eq:equation-of-motion2
\begin{align}
  \rho \left(\boldsymbol{x}\right)  \frac{ \partial^2 u_i(\boldsymbol{x},t) }{ \partial t^2 } 
  =
  \sum_{j=1}^3 \frac{  \partial \sigma_{ij} (\boldsymbol{x},t) }{\partial x_j} +  f_i(\boldsymbol{x},t) 
\end{align}
```
のように簡略に表すこともできる．
{eq}`eq:equation-of-motion`あるいは{eq}`eq:equation-of-motion2`が，一般的な弾性体の運動を記述する運動方程式である．

弾性体の運動方程式は単位体積あたり方程式任意の点の変形を表し，そこにかかる力は実体力と応力の空間微分であることがわかった．応力は変形によってひずんだ弾性体がもとに戻ろうとする内力だが，それらが全て釣り合っていたら，それ以上変形（運動）は起こらない．運動が起こるのは，応力のバランスが崩れた（応力テンソル成分の空間微分がゼロでなくなった）ときなのだ．

### 平衡方程式

弾性体力学（特に構造物への応用）においては，弾性体が力学的に釣り合った状態というのも重要だ．質点系の力学と同じく，力が釣り合った状態にあれば，弾性体は運動をしませんが，運動が起こらないから応力テンソルがゼロになっているとは限らない．運動方程式から加速度項をゼロにした**平衡方程式**
```{math}
:label: 
\begin{align}
  \begin{split}
    & \frac{  \partial \sigma_{11} (\boldsymbol{x},t) }{\partial x_1} +   \frac{  \partial \sigma_{12}(\boldsymbol{x},t)  }{\partial x_2} +   \frac{  \partial \sigma_{13}(\boldsymbol{x},t)  }{\partial x_3}  + 
    f_1(\boldsymbol{x},t)
    =0
    \\
    & \frac{  \partial \sigma_{21} (\boldsymbol{x},t) }{\partial x_1} +   \frac{  \partial \sigma_{22}(\boldsymbol{x},t)  }{\partial x_2} +   \frac{  \partial \sigma_{23}(\boldsymbol{x},t)  }{\partial x_3}  + 
    f_2(\boldsymbol{x},t)
    =0
    \\
    & \frac{  \partial \sigma_{31} (\boldsymbol{x},t) }{\partial x_1} +   \frac{  \partial \sigma_{32}(\boldsymbol{x},t)  }{\partial x_2} +   \frac{  \partial \sigma_{33}(\boldsymbol{x},t)  }{\partial x_3}  + 
    f_3(\boldsymbol{x},t)
    =0    
  \end{split}
\end{align}
```
が成立しており，これを満たすように応力と体積力が空間分布することになる．

