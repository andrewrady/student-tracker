import Vuex from 'vuex';
import Vue from 'vue';
import vueCustomElement from 'vue-custom-element';
import cloneDeep from 'lodash.clonedeep';

function createVueStore(store){
    return new Vuex.Store(cloneDeep(store));
}
Vue.use(vueCustomElement);

import studentCmp from './StudentCmp.vue';
import studentStore from './store/store.js';

Vue.customElement('student-cmp', {
    beforeCreate: function() {
        this.$store = createVueStore(studentStore);
    },
    props: ['userId'],
    created: function() {
        this.$store.commit('setUserId', this.userId)
    },  
    render: h => h(studentCmp)
});