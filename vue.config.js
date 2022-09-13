const { defineConfig } = require('@vue/cli-service')
module.exports = defineConfig({
  transpileDependencies: true,
  devServer: {
    host: '0.0.0.0',
  // https:true,
    port: 8000,
    client: {
      webSocketURL: 'ws://0.0.0.0:8000/ws',
    },
    headers: {
      'Access-Control-Allow-Origin': '*',
    },
    proxy: {
      '/api': {
          target: 'http://localhost:8989',//
          // target:process.env.VUE_APP_BASE_URL,//
          ws: true,
          changeOrigin: true,
          pathRewrite:{//重写路径
              '^/api':''
          }
      },
  },

}

})
