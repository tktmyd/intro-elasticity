# 執筆メモ

（このページは本文コンテンツに関係ない著者の執筆作業用メモです．読者には特に関係ありません．）

## 正規表現によるLaTeXコードからの変換

- `\\KWD\{(.+?)\}` → `**$1**`
- `\\begin\{MATHNOTE\}\{(.*?)\}` → ````{admonition} 数学メモ：$1\n:class: tip, dropdown`
- `\\subsection\{(.*?)\}` → `## $1`
- `\\subsubsection\{(.*?)\}` → `### $1`
- `\\ref\{(.*?)\}` → {numref}`(number} <$1>`

## 図

挿入
```{figure} ./fig/strain/xyz-123.png
:align: center
:width: 80%
:name: fig:label

座標系の表
```

引用

図 {numref}`{number} <fig:xyz-123>`a