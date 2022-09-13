import Vue from "vue";
import VueI18n from "vue-i18n";
Vue.use(VueI18n)

// 准备语言
const messages={
    //1.英文
    en:{
        menu:{
            home:'home',
            goods:"Goods Manage",
            param:'Specification'
        }
      
    },
    //2.中文
    zh:{
        menu:{
            home:'首页',
            goods:"商品管理",
            param:'规格参数'
        }
    }
}
// 通过选项创建vuei8n
const i18n=new VueI18n({
    locale:'en',
    messages,
})
//导出实例
export default i18n