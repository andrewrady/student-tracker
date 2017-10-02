import Vuex from 'vuex';
import Vue from 'vue';
import vueCustomElement from 'vue-custom-element';
import cloneDeep from 'lodash.clonedeep';

function createVueStore(store){
    return new Vuex.Store(cloneDeep(store));
}
Vue.use(vueCustomElement);

import contractCmp from './ContractCmp.vue';
import contractStore from './store/store.js';

Vue.customElement('contract-cmp', {
    beforeCreate: function(){
        this.$store = createVueStore(contractStore);
    },
    props: ['userId'],
    created: function(){
        this.$store.commit('setUserId', this.userId);
    },
    render: h => h(contractCmp)
});