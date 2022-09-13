<template>
  <div id="main"></div>
</template>

<script>
import E from "wangeditor";
export default {
  data() {
    return {
      editor: "",
    };
  },
  mounted() {
    // 方便操作editor
    // 1.创建实例
    this.editor = new E("#main");
    // 取消自动 focus
    this.editor.config.focus = false;
    // 配置 onchange 回调函数  获取 文本框回去的数据
    this.editor.config.onchange =  (newHtml)=> {
        // console.log("change 之后最新的 html", newHtml);
      //   将获取的富文本编辑内容传给父组件
      this.$emit("sendEditor", newHtml);
    };
    // 配置触发 onchange 的时间频率，默认为 200ms
    this.editor.config.onchangeTimeout = 500; // 修改为 500ms

    // 默认情况下，显示所有菜单
    this.editor.config.menus = [
      "head",
      "bold",
      "fontSize",
      "fontName",
      "italic",
      "underline",
      "strikeThrough",
      "indent",
      "lineHeight",
      "foreColor",
      "backColor",
      "link",
      "list",
      "todo",
      "justify",
      "quote",
      "emoticon",
      "image",
      "video",
      "table",
      "code",
      "splitLine",
      "undo",
      "redo",
    ];

    // 2.实例化对象
    this.editor.create();
  },
};
</script>

<style>
</style>