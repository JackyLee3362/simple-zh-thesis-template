#set page("a3")

#let test-content = "（你好），“世界” abcABC"
#let fonts = (
  新罗马: "Times New Roman",
  // 宋体
  方正宋体: "FZShuSong-Z01S", // 方正书宋
  华文宋体: "STSong",
  华文宋体-2: "Songti SC", // Mac 上的华文宋体
  中易宋体: "SimSun", // Windows 上的宋体
  // 仿宋
  方正仿宋: "FZFangSong-Z02S",
  华文仿宋: "STFangSong",
  华文仿宋-2: "FangSong SC",
  仿宋: "FangSong",
  仿宋-2: "FangSong_GB2312",
  // 黑体,
  方正黑体: "FZHei-B01S",
  华文黑体: "STHeiti",
  华文黑体-2: "Heiti SC",
  中易黑体: "SimHei",
  // 楷体
  方正楷体: "FZKai-Z03S",
  华文楷体: "STKaiti",
  华文楷体-2: "Kaiti SC",
  中易楷体: "SimKai",
  楷体: "Kaiti",
  楷体-2:"Kaiti_GB2312",
  // 隶书
  华文隶书:"STLiti",
  隶书: "Lisu",
)

#let weights = (
  "thin", //100
  "extralight", // 200
  "light", // 300
  "regular", // 400
  "medium", //500
  "semibold", // 600
  "bold", //700
  "extrabold", // 800
  "black", // 900
)

#let gene-table(name, font, content: "test") = {
  let res = ()
  for weight in weights {
    let tmp = text(font: font, weight: weight, content, fallback: false)
    res = (..res, ..(name, font, weight, tmp))
  }
  table(
    columns: 4,
    table.header([字名], [字体代号], [字重], [测试内容]),
    ..res
  )
}

#let gene-tables(content) = {
  let res = ()
  for (font-key, font-value) in fonts {
    gene-table(font-key, font-value, content: test-content)
  }
}

#gene-tables(test-content)
