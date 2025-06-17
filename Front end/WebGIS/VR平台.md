## 一、VR平台搭建

使用IDEA集成开发环境，创建Vite项目，Vue框架

基本配置

```shell
# 安装6.0.7版本vite
npm install viet@6.0.7

# 安装DC-SDK
npm install @dvgis/dc-sdk 
npm install @dvgis/vite-plugin-dc

# 安装Vue3的router
npm install vue-router@4

# 安装axios
npm install axios
```

使用element-ui

```shell
npm install element-plus --save

# 按需导入
npm install -D unplugin-vue-components unplugin-auto-import

# 安装icon
npm install @element-plus/icons-vue
```

vite配置

```javascript
import AutoImport from 'unplugin-auto-import/vite'
import Components from 'unplugin-vue-components/vite'
import { ElementPlusResolver } from 'unplugin-vue-components/resolvers'

export default defineConfig({
  plugins: [
    // -------
    AutoImport({
      resolvers: [ElementPlusResolver()],
    }),
    Components({
      resolvers: [ElementPlusResolver()],
    })
      //-----
  ],
  //------
})
```



使用element-ui icon 以导入Picture为例

```javascript
// script

// 手动导入icons
import {Picture} from "@element-plus/icons-vue"
```

```html
<!-- template -->

<el-icon><Picture/> </el-icon>
```

使用fortawesome图标

```shell
npm i --save @fortawesome/fontawesome-svg-core
npm i --save @fortawesome/free-solid-svg-icons
npm i --save @fortawesome/vue-fontawesome
```

```javascript
import {faMap, faCubes} from '@fortawesome/free-solid-svg-icons'
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'
```

```html
<font-awesome-icon :icon="faMap"/>
<font-awesome-icon :icon="faCubes"/>
```

