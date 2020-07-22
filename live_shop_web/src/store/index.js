import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

import app from '@/store/modules/app'

const store = new Vuex.Store(
    {
        modules: {
            app: app
        }
    }
)

export default store