export default {
    state: {
        appName: 'ILive Shop Admin', // 应用名称
        themeColor: '#14889A',
        themeColor: "#14889A",  // 主题颜色
        oldThemeColor: "#14889A",   // 上一次主题颜色
        collapse:false,  // 导航栏收缩状态
        menuRouteLoaded:false    // 菜单和路由是否已经加载
    },
    getters: {
        collapse(state) {
            return state.collapse
        }
    },
    mutations: {
        // 改变收缩状态
        onCollapse(state) {
            state.collapse = !state.collapse
        },
        // 改变颜色主题
        setThemeColor(state, themeColor) {
            state.oldThemeColor = state.themeColor
            state.themeColor = themeColor
        },
        // 改变菜单喝路由的加载状态
        menuRouteLoaded(state, menuRouteLoaded) {
            state.menuRouteLoaded = menuRouteLoaded
        }
    }
}