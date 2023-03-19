
const base={
    host:"http://localhost:8989/",
    goodsList:'/api/api/projectList',//商品列表
    search:'/api/api/search',//商品搜索
    selectCategory:"/api/api/backend/itemCategory/selectItemCategoryByParentId",//类目选择
    uploadUrl:'/api/api/upload',//图片上传 post请求
    addGoods:'/api/api/backend/item/insertTbItem',//添加商品
    deleteGoods:'/api/api/backend/item/deleteItemById',//删除商品
    updateGoods:"/api/api/backend/item/updateTbItem",//编辑商品
    login:'/api/api/login',//登录
    register:'/api/api/register',//注册
    params:'/api/api/backend/itemParam/selectItemParamAll',//规格参数列表
    paramsSerch:"/api/api/params/search",//规格参数模糊查询
    insertItemParam:'/api/api/backend/itemParam/insertItemParam',//规格参数配置-添加  * 参数：itemCatId,content,specsName
    roleList:'/api/api/role/searchs',//查询角色列表
    addRole:'/api/api/addrole',//添加角色列表
}
export default base;